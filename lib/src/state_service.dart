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
import 'package:ng2_state/src/state.dart';

@Injectable()
class StateService {

  final ExceptionHandler exceptionHandler;

  String stateName = 'ng2_state';
  Stream<bool> get ready$ => _ready$ctrl.stream;
  bool isReady = false;

  final EntityFactory<Entity> _factory = new EntityFactory();
  final StreamController<StateContainer> _state$ctrl = new StreamController<StateContainer>();
  final StreamController<List<StateContainer>> _aggregatedState$ctrl = new StreamController<List<StateContainer>>.broadcast();
  final StreamController<bool> _ready$ctrl = new StreamController<bool>.broadcast();
  final List<State> _states = <State>[];

  StreamController<StateContainer> _snapshot$ctrl = new StreamController<StateContainer>.broadcast();

  SerializerJson _serializer;
  List<StateContainer> _snapshot;

  static StateService _instance;

  factory StateService(@Inject(ExceptionHandler) ExceptionHandler exceptionHandler) {
    if (_instance != null) return _instance;

    _instance = new StateService._internal(exceptionHandler);

    _instance._serializer = new SerializerJson()..outgoing([])
      ..addRule(
        DateTime,
        (int value) => (value != null) ? new DateTime.fromMillisecondsSinceEpoch(value, isUtc:true) : null,
        (DateTime value) => value.millisecondsSinceEpoch
      );

    _instance._initStreams();

    return _instance;
  }

  StateService._internal(this.exceptionHandler);

  void registerComponentState(String stateGroup, String stateId, Entity stateParts) {
    final StateContainer container = new StateContainer()
      ..group = stateGroup
      ..id = stateId
      ..stateParts = stateParts;

    _state$ctrl.add(container);

    _snapshot$ctrl.add(container);
  }

  void registerState(State state) => _states.add(state);

  void unregisterState(State state) {
    if (_states.contains(state)) _states.remove(state);
  }

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
      .map((StateContainer stateContainer) => new Tuple2<StateContainer, int>(stateContainer, stopwatch.elapsedMilliseconds))
      .listen(recordingSession.add);

    return recordingSession;
  }

  Future<bool> replayRecordingSession(StateRecordingSession recordingSession) {
    final Completer<bool> completer = new Completer<bool>();
    final StreamController<StateContainer> ctrl = new StreamController<StateContainer>();

    recordingSession.subscription.cancel();

    recordingSession.aggregatedStates.forEach((Tuple2<StateContainer, int> tuple) {
      new Timer(new Duration(milliseconds: tuple.item2), () {
        ctrl.add(tuple.item1);
      });
    });

    ctrl.stream.take(recordingSession.aggregatedStates.length).listen((StateContainer container) {
      final State match = _states.firstWhere((State state) => state.stateGroup == container.group && state.stateId == container.id, orElse: () => null);

      if (match != null) match.component.receiveState(container.stateParts, StatePhase.REPLAY);
    }, onDone: () => completer.complete(true), onError: (error) => completer.complete(false));

    return completer.future;
  }

  Future<bool> _initStreams() async {
    final storage.Store db = await storage.Store.open('ng2_db', stateName);
    final String existingState = await db.getByKey('state');
    List<Entity> existing = <StateContainer>[];

    rx.observable(_aggregatedState$ctrl.stream)
      .tap((List<StateContainer> aggregated) => _snapshot = aggregated)
      .flatMapLatest((List<StateContainer> aggregated) {
        final StreamController<List<StateContainer>> ctrl = new StreamController<List<StateContainer>>();

        new rx.Observable.merge(<Stream>[
          window.onUnload,
          window.onBeforeUnload
        ])
          .take(1)
          .listen((_) {
            ctrl.add(aggregated);
          });

        return ctrl.stream;
      })
      .listen((List<StateContainer> aggregated) async {
        await db.save(_serializer.outgoing(aggregated), 'state');
      });

    if (existingState != null) {
      try {
        final Iterable<Map<String, dynamic>> result = _serializer.incoming(existingState);

        existing = _factory.spawn(result, _serializer, (Entity serverEntity, Entity clientEntity) => ConflictManager.AcceptClient);

        _snapshot = existing as List<StateContainer>;
      } catch (error) {
        exceptionHandler.call(error, error.stackTrace, 'Failed to reopen last state: $existingState');
      }
    }

    new rx.Observable<List<StateContainer>>.zip([
      _state$ctrl.stream,
      rx.observable(_aggregatedState$ctrl.stream).startWith([existing])
    ], (StateContainer incoming, List<StateContainer> aggregated) {
      final List<StateContainer> copy = new List<StateContainer>.from(aggregated);

      copy.removeWhere((StateContainer container) => container.group == incoming.group && container.id == incoming.id);

      copy.add(incoming);

      return copy;
    })
      .listen(_aggregatedState$ctrl.add);

    _ready$ctrl.add(true);

    isReady = true;

    return true;
  }

}