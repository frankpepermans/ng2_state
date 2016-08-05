library ng2_state.state_service;

import 'dart:async';
import 'dart:html';

import 'package:angular2/angular2.dart';

import 'package:dorm/dorm.dart';
import 'package:rxdart/rxdart.dart' as rx;
import 'package:tuple/tuple.dart';
import 'package:lawndart/lawndart.dart' as storage;

import 'package:ng2_state/src/state_container.dart';
import 'package:ng2_state/src/state_recording_session.dart';
import 'package:ng2_state/src/state_provider.dart' show StateProvider, StatePhase;

import 'package:ng2_state/src/stateful_component.dart';

@Injectable()
class StateService {

  final ExceptionHandler exceptionHandler;

  String stateName = 'ng2_state';
  Stream<bool> get ready$ => _ready$ctrl.stream;
  bool isReady = false, _initStarted = false;

  final EntityFactory<Entity> _factory = new EntityFactory();
  final StreamController<StateContainer> _state$ctrl = new StreamController<StateContainer>();
  final StreamController<Tuple2<String, String>> _evictState$ctrl = new StreamController<Tuple2<String, String>>();
  final StreamController<List<StateContainer>> _aggregatedState$ctrl = new StreamController<List<StateContainer>>.broadcast();
  final StreamController<bool> _ready$ctrl = new StreamController<bool>.broadcast();
  final Map<dynamic, StatefulComponent> _registry = <dynamic, StatefulComponent>{};
  final List<StateProvider> _stateProviders = <StateProvider>[];

  StreamController<StateContainer> _snapshot$ctrl = new StreamController<StateContainer>.broadcast();

  SerializerJson _serializer;
  List<StateContainer> _snapshot;

  static StateService _instance;

  factory StateService(@Inject(ExceptionHandler) ExceptionHandler exceptionHandler) {
    if (_instance != null) return _instance;

    _instance = new StateService._internal(exceptionHandler);

    _instance._serializer = new SerializerJson()
      ..asDetached = true
      ..outgoing([])
      ..addRule(
        DateTime,
        (int value) => (value != null) ? new DateTime.fromMillisecondsSinceEpoch(value, isUtc:true) : null,
        (DateTime value) => value?.millisecondsSinceEpoch
      );

    return _instance;
  }

  StateService._internal(this.exceptionHandler);

  void init() => _initStreams();

  void evictState(Tuple2<String, String> tuple) => _evictState$ctrl.add(tuple);

  StatefulComponent getComponentForElementRef(ElementRef elementRef) => _registry[elementRef.nativeElement];

  void registerComponentElementRef(StatefulComponent component, ElementRef elementRef) {
    _registry[elementRef.nativeElement] = component;
  }

  StatefulComponent unregisterComponentElementRef(ElementRef elementRef) => _registry.remove(elementRef.nativeElement);

  void registerComponentState(String stateGroup, String stateId, Entity stateParts) {
    final StateContainer container = new StateContainer()
      ..group = stateGroup
      ..id = stateId
      ..stateParts = stateParts;

    _state$ctrl.add(container);

    _snapshot$ctrl.add(container);
  }

  void registerState(StateProvider stateProvider) => _stateProviders.add(stateProvider);

  void unregisterState(StateProvider stateProvider) {
    if (_stateProviders.contains(stateProvider)) _stateProviders.remove(stateProvider);
  }

  Iterable<StateContainer> findStatesById(String stateId) => _snapshot
    .where((StateContainer container) => container.id == stateId);

  Entity getComponentState(String stateGroup, String stateId) {
    final StateContainer match = _snapshot?.firstWhere((StateContainer container) => container.group == stateGroup && container.id == stateId, orElse: () => null);

    if (match != null) return match.stateParts;

    return null;
  }

  StateRecordingSession startRecordingSession() {
    final StateRecordingSession recordingSession = new StateRecordingSession();
    final Stopwatch stopwatch = new Stopwatch();

    stopwatch.start();

    recordingSession.subscription = _snapshot$ctrl.stream
      .map((StateContainer stateContainer) => new Tuple2<List<StateContainer>, int>(_snapshot, stopwatch.elapsedMilliseconds))
      .listen(recordingSession.add);

    return recordingSession;
  }

  Future<bool> replayRecordingSession(StateRecordingSession recordingSession) {
    final Completer<bool> completer = new Completer<bool>();
    final StreamController<List<StateContainer>> ctrl = new StreamController<List<StateContainer>>();

    recordingSession.subscription.cancel();

    recordingSession.aggregatedStates.forEach((Tuple2<List<StateContainer>, int> tuple) {
      new Timer(new Duration(milliseconds: tuple.item2), () {
        ctrl.add(tuple.item1);
      });
    });

    ctrl.stream.take(recordingSession.aggregatedStates.length).listen((List<StateContainer> containers) {
      if (containers != null) containers.forEach((StateContainer container) {
        final StateProvider match = _stateProviders.firstWhere((StateProvider stateProvider) => stateProvider.state == container.group && stateProvider.stateId == container.id, orElse: () => null);

        if (match != null) {
          match.component.receiveState(container.stateParts, StatePhase.REPLAY);

          match.component.changeDetector.markForCheck();
        }
      });
    }, onDone: () => completer.complete(true), onError: (error) => completer.complete(false));

    return completer.future;
  }

  void _initStreams() {
    if (_initStarted) return;

    _initStarted = true;

    _getSnapshot$()
      .listen((Tuple2<storage.Store, List<Entity>> tuple) {
        rx.observable(_aggregatedState$ctrl.stream)
          .tap((List<StateContainer> aggregated) {
            _snapshot = new List<StateContainer>.unmodifiable(aggregated);
          })
          .flatMapLatest((List<StateContainer> aggregated) =>
            new rx.Observable.merge(<Stream>[
              window.onBeforeUnload,
              new rx.Observable.merge(<Stream>[
                window.onMouseMove,
                window.onClick,
                window.onKeyDown,
                window.onTouchEnd,
                window.onScroll
              ])
                .debounce(const Duration(milliseconds: 1000))
            ])
              .take(1)
              .map((_) => _serializer.outgoing(aggregated)))
          .flatMapLatest((String encoded) =>
            tuple.item1
              .save(encoded, 'state')
              .asStream()
              .take(1)
              .map((_) => encoded))
          .listen((String encoded) => print('state persisted'));

        new rx.Observable<List<StateContainer>>.zip([
          new rx.Observable.merge([
            _state$ctrl.stream,
            _evictState$ctrl.stream
          ]),
          rx.observable(_aggregatedState$ctrl.stream).startWith([tuple.item2])
        ], (dynamic /*StateContainer|Tuple2<String, String>*/incoming, List<StateContainer> aggregated) {
          final List<StateContainer> copy = new List<StateContainer>.from(aggregated);

          if (incoming is StateContainer) {
            copy.removeWhere((StateContainer container) => container.group == incoming.group && container.id == incoming.id);

            copy.add(incoming);
          } else if (incoming is Tuple2<String, String>) {
            copy.removeWhere((StateContainer container) => container.group == incoming.item1 && (incoming.item2 == null || container.id == incoming.item2));
          }

          return copy;
        })
          .listen(_aggregatedState$ctrl.add);

        _ready$ctrl.add(true);

        isReady = true;
      });
  }

  Stream<Tuple2<storage.Store, List<Entity>>> _getSnapshot$() async* {
    final storage.Store db = await storage.Store.open('ng2_db', stateName);
    final String existingState = await db.getByKey('state');
    List<Entity> existing = <StateContainer>[];

    if (existingState != null) {
      try {
        print('Loading existing state...');

        final Iterable<Map<String, dynamic>> result = _serializer.incoming(existingState);

        existing = _factory.spawn(result, _serializer, (Entity serverEntity, Entity clientEntity) => ConflictManager.AcceptClient);

        _snapshot = existing as List<StateContainer>;
      } catch (error) {
        exceptionHandler.call(error, error.stackTrace, 'Failed to reopen last state: $existingState');
      }
    }

    yield new Tuple2<storage.Store, List<Entity>>(db, existing);
  }

}