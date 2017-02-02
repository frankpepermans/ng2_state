library ng2_state.state_service;

import 'dart:async';
import 'dart:html';

import 'package:angular2/angular2.dart';

import 'package:dorm/dorm.dart';
import 'package:rxdart/rxdart.dart' as rx;
import 'package:tuple/tuple.dart';
import 'package:lawndart/lawndart.dart' as storage;

import 'package:ng2_state/src/state_container.g.dart';
import 'package:ng2_state/src/state_recording_session.dart';
import 'package:ng2_state/src/state_provider.dart' show StateProvider, StatePhase;

@Injectable()
class StateService {

  final ExceptionHandler exceptionHandler;

  String stateName = 'ng2_state';
  Stream<bool> get ready$ => _ready$ctrl.stream;
  Stream<bool> get updated$ => _aggregatedState$ctrl.stream.map((_) => true);
  Stream<Tuple2<String, String>> get evict$ => _evictState$ctrl.stream;
  bool isReady = false, _initStarted = false;

  final EntityFactory<Entity> _factory = new EntityFactory<Entity>();
  final StreamController<StateProvider> _stateProvider$ctrl = new StreamController<StateProvider>.broadcast();
  final StreamController<StateContainer> _state$ctrl = new StreamController<StateContainer>();
  final StreamController<Tuple2<String, String>> _evictState$ctrl = new StreamController<Tuple2<String, String>>.broadcast();
  final StreamController<List<StateContainer>> _aggregatedState$ctrl = new StreamController<List<StateContainer>>.broadcast();
  final StreamController<bool> _ready$ctrl = new StreamController<bool>.broadcast();
  final List<StateProvider> _stateProviders = <StateProvider>[];

  StreamController<StateContainer> _snapshot$ctrl = new StreamController<StateContainer>.broadcast();

  SerializerJson<String, Map<String, dynamic>> _serializer;
  Map<String, StateContainer> _snapshot = <String, StateContainer>{};
  String lastEncodedState = '';

  static StateService _instance;

  factory StateService(@Inject(ExceptionHandler) ExceptionHandler exceptionHandler) {
    if (_instance != null) return _instance;

    _instance = new StateService._internal(exceptionHandler);

    _instance._serializer = new SerializerJson<String, Map<String, dynamic>>()
      ..outgoing(const [])
      ..addRule(
        DateTime,
        (int value) => (value != null) ? new DateTime.fromMillisecondsSinceEpoch(value, isUtc:true) : null,
        (DateTime value) => value?.millisecondsSinceEpoch
      );

    return _instance;
  }

  StateService._internal(this.exceptionHandler);

  void close() {
    _stateProvider$ctrl.close();
    _state$ctrl.close();
    _evictState$ctrl.close();
    _aggregatedState$ctrl.close();
    _ready$ctrl.close();
    _snapshot$ctrl.close();
  }

  void init() => _initStreams();

  void evictState(Tuple2<String, String> tuple) => _evictState$ctrl.add(tuple);

  void registerComponentState(String stateGroup, String stateId, Entity stateParts) {
    if (_state$ctrl.isClosed) return;

    final StateContainer container = new StateContainer()
      ..group = stateGroup
      ..id = stateId
      ..stateParts = stateParts;

    _state$ctrl.add(container);

    _snapshot$ctrl.add(container);
  }

  void registerState(StateProvider stateProvider) => _stateProvider$ctrl.add(stateProvider);

  void unregisterState(StateProvider stateProvider) {
    if (_stateProviders.contains(stateProvider)) {
      final String key = '${stateProvider.state}|${stateProvider.stateId}';

      if (_snapshot.containsKey(key)) _snapshot.remove(key);

      _stateProviders.remove(stateProvider);
    }
  }

  bool isFullyRegistered(StateProvider stateProvider) => _snapshot.containsKey('${stateProvider.state}|${stateProvider.stateId}');

  String _toKey(StateContainer container) => '${container.group}|${container.id}';

  Iterable<StateContainer> findStatesById(String stateId) => _snapshot
    ?.values
    ?.where((StateContainer container) => container != null && container.id == stateId);

  Entity getComponentState(String stateGroup, String stateId) {
    if (_snapshot == null) return null;

    final StateContainer match = _snapshot['$stateGroup|$stateId'];

    if (match != null) return match.stateParts;

    return null;
  }

  StateRecordingSession startRecordingSession() {
    final StateRecordingSession recordingSession = new StateRecordingSession();
    final Stopwatch stopwatch = new Stopwatch();

    stopwatch.start();

    recordingSession.subscription = _snapshot$ctrl.stream
      .map((StateContainer stateContainer) => new Tuple2<Map<String, StateContainer>, int>(_snapshot, stopwatch.elapsedMilliseconds))
      .listen(recordingSession.add);

    return recordingSession;
  }

  Future<bool> replayRecordingSession(StateRecordingSession recordingSession) {
    final Completer<bool> completer = new Completer<bool>();
    final StreamController<List<StateContainer>> ctrl = new StreamController<List<StateContainer>>();

    recordingSession.subscription.cancel();

    recordingSession.aggregatedStates.forEach((Tuple2<Map<String, StateContainer>, int> tuple) {
      new Timer(new Duration(milliseconds: tuple.item2), () {
        ctrl.add(tuple.item1.values);
      });
    });

    ctrl.stream.take(recordingSession.aggregatedStates.length).listen((List<StateContainer> containers) {
      if (containers != null) containers.forEach((StateContainer container) {
        final StateProvider match = _stateProviders.firstWhere((StateProvider stateProvider) => stateProvider.state == container.group && stateProvider.stateId == container.id, orElse: () => null);

        if (match != null) {
          match.component.receiveState(container.stateParts, StatePhase.REPLAY);

          //match.component.changeDetector.markForCheck();
        }
      });
    }, onDone: () => completer.complete(true), onError: (Error error) => completer.complete(false));

    return completer.future;
  }

  void _initStreams() {
    if (_initStarted) return;

    _initStarted = true;

    _stateProvider$ctrl.stream
      .listen((StateProvider provider) => _stateProviders.add(provider));

    _getSnapshot$()
      .listen((Tuple2<storage.Store, List<StateContainer>> tuple) {
        rx.observable(_aggregatedState$ctrl.stream).startWith(tuple.item2)
          .call(onData:(List<StateContainer> aggregated) => aggregated
            .forEach((StateContainer container) => _snapshot[_toKey(container)] = container))
          .flatMapLatest((List<StateContainer> aggregated) =>
            new rx.Observable<dynamic>.merge(<Stream<dynamic>>[
              window.onBeforeUnload,
              new Stream<dynamic>.periodic(const Duration(seconds: 1))
            ])
              .take(1)
              .map((_) => aggregated)
              .map(_serializer.outgoing))
          .flatMapLatest((String encoded) =>
            tuple.item1
              .save(encoded, 'state')
              .asStream()
              .take(1)
              .map((_) => encoded))
          .distinct((String a, String b) => identical(a, b))
          .call(onData:(String encoded) => lastEncodedState = encoded)
          .listen((String encoded) => print('state persisted ${encoded.length}'), onError: ([_]) => print('state failed'));

        rx.Observable.zip2(
          new rx.Observable<dynamic>.merge(<Stream<dynamic>>[
            _state$ctrl.stream,
            _evictState$ctrl.stream,
            _stateProvider$ctrl.stream
          ]),
          rx.observable(_aggregatedState$ctrl.stream)
            .startWith(tuple.item2)
        , (dynamic /*StateContainer|Tuple2<String, String>*/incoming, List<StateContainer> aggregated) {
          if (incoming is StateContainer) {
            final List<StateContainer> copy = new List<StateContainer>.from(aggregated);

            copy.removeWhere((StateContainer container) => container.group == incoming.group && container.id == incoming.id);

            copy.add(incoming);

            return copy;
          } else if (incoming is Tuple2<String, String>) {
            final List<StateContainer> copy = new List<StateContainer>.from(aggregated);

            copy.removeWhere((StateContainer container) => container.group == incoming.item1 && (incoming.item2 == null || container.id == incoming.item2));

            return copy;
          } else if (incoming is StateProvider) {
            _snapshot.putIfAbsent('${incoming.state}|${incoming.stateId}', () => aggregated
              .firstWhere((StateContainer container) => container.group == incoming.state && container.id == incoming.stateId, orElse: () => null));
          }

          return aggregated;
        })
          .listen(_aggregatedState$ctrl.add);

        _ready$ctrl.add(true);

        isReady = true;
      });
  }

  Stream<Tuple2<storage.Store, List<StateContainer>>> _getSnapshot$() async* {
    final storage.Store db = await storage.Store.open('ng2_db', stateName);
    final String existingState = await db.getByKey('state');
    List<StateContainer> existing = <StateContainer>[];

    if (existingState != null) {
      try {
        print('Loading existing state...');

        lastEncodedState = existingState;

        existing = _factory.spawn(_serializer.incoming(existingState), _serializer)
          .where((Entity entity) => entity is StateContainer)
          .toList(growable: false) as List<StateContainer>;
      } catch (error) {
        exceptionHandler.call(error, error.stackTrace, 'Failed to reopen last state: $existingState');
      }
    }

    yield new Tuple2<storage.Store, List<StateContainer>>(db, existing);
  }

}