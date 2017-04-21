library ng2_state.state_provider;

import 'dart:async';

import 'package:angular2/angular2.dart';
import 'package:dorm/dorm.dart';
import 'package:rxdart/rxdart.dart' as rx;

import 'package:ng2_state/src/stateful_component.dart' show StatefulComponent;
import 'package:ng2_state/src/state_service.dart' show StateService;
import 'package:ng2_state/src/state.dart';

enum StatePhase { REPLAY, LOAD }

@Injectable()
class StateProvider {
  String _state;
  String get state => _state;
  @Input()
  set state(String value) {
    _state = value;

    if (component != null) component.stateGroup = value;

    _triggerLoadState();
  }

  String _stateId;
  String get stateId => _stateId;
  @Input()
  set stateId(String value) {
    _stateId = value;

    if (component != null) component.stateId = value;

    _triggerLoadState();
  }

  final StateService stateService;
  final ExceptionHandler exceptionHandler;

  StatefulComponent _component;
  StatefulComponent get component => _component;
  set component(StatefulComponent value) {
    _component = value;

    _providerPipeSubscription?.cancel();

    if (value != null)
      _providerPipeSubscription = value.provideState().listen(
          _providerStream.add,
          onError: (Error error, StackTrace stackTrace) =>
              _providerStream.addError(error, stackTrace), onDone: () {
        _providerStream.close();

        _providerPipeSubscription?.cancel();
        _provideStateSubscription?.cancel();
      });
  }

  State directive;

  bool _isLoadStateTriggered = false,
      _isProvided = false,
      _isStateLoaded = false;

  final rx.BehaviorSubject<Entity> _providerStream =
      new rx.BehaviorSubject<Entity>();

  StreamSubscription<Entity> _providerPipeSubscription;
  StreamSubscription<Entity> _provideStateSubscription;
  StreamSubscription<bool> _componentDestroySubscription;
  StreamSubscription<bool> _loadStateSubscription;

  StateProvider(@Inject(StateService) this.stateService,
      @Inject(ExceptionHandler) this.exceptionHandler);

  void provide(StatefulComponent component, String stateGroup, String stateId,
      {State directive: null}) {
    this.directive = directive;
    this.component = component;
    this.state = stateGroup;
    this.stateId = stateId;

    stateService.registerState(this);

    _isProvided = true;

    _triggerLoadState();
  }

  void flush() {
    _providerStream.close();

    _providerPipeSubscription?.cancel();
    _provideStateSubscription?.cancel();
    _componentDestroySubscription?.cancel();
    _loadStateSubscription?.cancel();

    stateService.unregisterState(this);

    //stateService.close();
  }

  void initStreams(StatefulComponent component) {
    _componentDestroySubscription =
        component.onDestroy.take(1).listen((_) => flush());
  }

  void _triggerLoadState() {
    if (_isProvided &&
        !_isLoadStateTriggered &&
        state != null &&
        stateId != null &&
        component != null) {
      _isLoadStateTriggered = true;

      if (stateService.isReady)
        _loadState();
      else
        stateService.ready$.take(1).listen((_) => _loadState());
    }
  }

  void _loadState() {
    if (stateService.isFullyRegistered(this))
      _commitState(true);
    else {
      _loadStateSubscription = new rx.Observable<bool>.amb(<Stream<bool>>[
        rx
            .observable(stateService.updated$)
            .startWith(true)
            .where((_) => stateService.isFullyRegistered(this)),
        new Future<Null>.delayed(const Duration(seconds: 1))
            .asStream()
            .map((_) => true)
      ]).take(1).listen(_commitState);
    }
  }

  void _commitState(bool _) {
    final Entity stateParts = stateService.getComponentState(state, stateId);

    if (stateParts != null) {
      try {
        component.stateGroup = state;
        component.stateId = stateId;

        component.receiveState(stateParts, StatePhase.LOAD);
      } catch (error) {
        exceptionHandler.call(error, error.stackTrace);
      }
    }

    _isStateLoaded = true;

    _provideStateSubscription = rx
        .observable(_providerStream.stream)
        .debounce(const Duration(milliseconds: 20))
        .listen((Entity state) {
      if (_state == null || _stateId == null || state == null)
        throw new ArgumentError(
            'unable to provide state! stateGroup: $_state, stateId: $_stateId, component null? ${state == null}');

      stateService.registerComponentState(_state, _stateId, state);
    });
  }
}
