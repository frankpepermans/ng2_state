import 'dart:async';
import 'dart:html';

import 'package:angular/angular.dart';

import 'package:dorm/dorm.dart';
import 'package:rxdart/rxdart.dart' as rx;
import 'package:tuple/tuple.dart';

import 'package:ng2_state/src/state_container.g.dart';
import 'package:ng2_state/src/state_recording_session.dart';
import 'package:ng2_state/src/state_provider.dart'
    show StateProvider, StatePhase;

@Injectable()
class StateService {
  final ExceptionHandler exceptionHandler;

  String stateName = 'ng2_state';
  Stream<bool> get ready$ => _ready$ctrl.stream;
  Stream<bool> get updated$ => _aggregatedState$ctrl.stream.map((_) => true);
  Stream<Tuple2<String, String>> get evict$ => _evictState$ctrl.stream;
  bool isReady = false, _initStarted = false;

  final EntityFactory<Entity> _factory = new EntityFactory<Entity>();
  final StreamController<StateProvider> _stateProvider$ctrl =
      new StreamController<StateProvider>.broadcast();
  final StreamController<StateContainer> _state$ctrl =
      new StreamController<StateContainer>();
  final StreamController<Tuple2<String, String>> _evictState$ctrl =
      new StreamController<Tuple2<String, String>>.broadcast();
  final StreamController<List<StateContainer>> _aggregatedState$ctrl =
      new StreamController<List<StateContainer>>.broadcast();
  final StreamController<bool> _ready$ctrl =
      new StreamController<bool>.broadcast();
  final List<StateProvider> _stateProviders = <StateProvider>[];

  final StreamController<StateContainer> _snapshot$ctrl =
      new StreamController<StateContainer>.broadcast();

  SerializerJson<String> _serializer;
  final Map<String, StateContainer> _snapshot = <String, StateContainer>{};
  String lastEncodedState = '';

  static StateService _instance;

  factory StateService(
      @Inject(ExceptionHandler) ExceptionHandler exceptionHandler) {
    if (_instance != null) return _instance;

    _instance = new StateService._internal(exceptionHandler);

    _instance._serializer = new SerializerJson<String>()
      ..outgoing(const <dynamic>[])
      ..addRule<int, DateTime>(
          DateTime,
          (int value) => (value != null)
              ? new DateTime.fromMillisecondsSinceEpoch(value, isUtc: true)
              : null,
          (DateTime value) => value?.millisecondsSinceEpoch);

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

  void registerComponentState(
      String stateGroup, String stateId, Entity stateParts) {
    if (_state$ctrl.isClosed) return;

    final StateContainer container = new StateContainer()
      ..group = stateGroup
      ..id = stateId
      ..stateParts = stateParts;

    _state$ctrl.add(container);

    _snapshot$ctrl.add(container);
  }

  void registerState(StateProvider stateProvider) =>
      _stateProvider$ctrl.add(stateProvider);

  void unregisterState(StateProvider stateProvider) {
    if (_stateProviders.contains(stateProvider)) {
      final String key = '${stateProvider.state}|${stateProvider.stateId}';

      if (_snapshot.containsKey(key)) _snapshot.remove(key);

      _stateProviders.remove(stateProvider);
    }
  }

  bool isFullyRegistered(StateProvider stateProvider) =>
      stateProvider.component != null &&
      _snapshot.containsKey('${stateProvider.state}|${stateProvider.stateId}');

  String _toKey(StateContainer container) =>
      '${container.group}|${container.id}';

  Iterable<StateContainer> findStatesById(String stateId) =>
      _snapshot?.values?.where((StateContainer container) =>
          container != null && container.id == stateId);

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
        .map((StateContainer stateContainer) =>
            new Tuple2<Map<String, StateContainer>, int>(
                _snapshot, stopwatch.elapsedMilliseconds))
        .listen(recordingSession.add);

    return recordingSession;
  }

  Future<bool> replayRecordingSession(StateRecordingSession recordingSession) {
    final Completer<bool> completer = new Completer<bool>();
    final StreamController<Iterable<StateContainer>> ctrl =
        new StreamController<Iterable<StateContainer>>();

    recordingSession.subscription.cancel();

    recordingSession.aggregatedStates
        .forEach((Tuple2<Map<String, StateContainer>, int> tuple) {
      new Timer(new Duration(milliseconds: tuple.item2), () {
        ctrl.add(tuple.item1.values);
      });
    });

    ctrl.stream.take(recordingSession.aggregatedStates.length).listen(
        (Iterable<StateContainer> containers) {
      if (containers != null)
        containers.forEach((StateContainer container) {
          final StateProvider match = _stateProviders.firstWhere(
              (StateProvider stateProvider) =>
                  stateProvider.state == container.group &&
                  stateProvider.stateId == container.id,
              orElse: () => null);

          if (match != null) {
            match.component
                .receiveState(container.stateParts, StatePhase.REPLAY);

            //match.component.changeDetector.markForCheck();
          }
        });
    },
        onDone: () => completer.complete(true),
        onError: (Error error) => completer.complete(false));

    return completer.future;
  }

  void _initStreams() {
    if (_initStarted) return;

    _initStarted = true;

    _stateProvider$ctrl.stream.listen(_stateProviders.add);

    final List<StateContainer> snapshot = _getSnapshot();

    new rx.Observable<List<StateContainer>>(_aggregatedState$ctrl.stream)
        .startWith(snapshot)
        .doOnData((List<StateContainer> aggregated) => aggregated.forEach(
            (StateContainer container) =>
                _snapshot[_toKey(container)] = container))
        .switchMap((List<StateContainer> aggregated) =>
            new rx.Observable<dynamic>.race(<Stream<dynamic>>[
              window.onBeforeUnload,
              new Stream<dynamic>.periodic(const Duration(seconds: 1))
            ]).take(1).map((dynamic _) => aggregated).map(_serializer.outgoing))
        .doOnData((String encoded) {
          window.localStorage[stateName] = encoded;
        })
        .distinct(identical)
        .doOnData((String encoded) => lastEncodedState = encoded)
        .listen((String encoded) => print('state persisted ${encoded.length}'),
            onError: ([dynamic error]) {
          if (error is DomException) {
            print(error.message);
          } else {
            print('state failed: $error, ${error.stackTrace}');
          }
        });

    rx.Observable.zip2<dynamic, List<StateContainer>, List<StateContainer>>(
        new rx.Observable<dynamic>.merge(<Stream<dynamic>>[
          _state$ctrl.stream,
          _evictState$ctrl.stream,
          _stateProvider$ctrl.stream
        ]),
        new rx.Observable<List<StateContainer>>(_aggregatedState$ctrl.stream)
            .startWith(snapshot),
        (dynamic /*StateContainer|Tuple2<String, String>*/ incoming,
            List<StateContainer> aggregated) {
      if (incoming is StateContainer) {
        final List<StateContainer> copy =
            new List<StateContainer>.from(aggregated);

        copy.removeWhere((StateContainer container) =>
            container.group == incoming.group && container.id == incoming.id);

        copy.add(incoming);

        return copy;
      } else if (incoming is Tuple2<String, String>) {
        final List<StateContainer> copy =
            new List<StateContainer>.from(aggregated);

        copy.removeWhere((StateContainer container) =>
            container.group == incoming.item1 &&
            (incoming.item2 == null || container.id == incoming.item2));

        return copy;
      } else if (incoming is StateProvider) {
        _snapshot.putIfAbsent(
            '${incoming.state}|${incoming.stateId}',
            () => aggregated.firstWhere(
                (StateContainer container) =>
                    container.group == incoming.state &&
                    container.id == incoming.stateId,
                orElse: () => null));
      }

      return aggregated;
    }).listen(_aggregatedState$ctrl.add);

    _ready$ctrl.add(true);

    isReady = true;
  }

  List<StateContainer> _getSnapshot() {
    if (window.localStorage.containsKey(stateName)) {
      try {
        print('Loading existing state...');

        lastEncodedState = window.localStorage[stateName];

        return _factory
            .spawn(_serializer.incoming(lastEncodedState), _serializer)
            .where((dynamic entity) => entity is StateContainer)
            .cast<StateContainer>()
            .toList(growable: false);
      } catch (error) {
        exceptionHandler.call(error, error.stackTrace,
            'Failed to reopen last state: ${window.localStorage[stateName]}');
      }
    }

    return <StateContainer>[];
  }
}
