library ng2_state.state_provider;

import 'dart:async';

import 'package:angular2/angular2.dart';
import 'package:dorm/dorm.dart';

import 'package:ng2_state/src/stateful_component.dart' show StatefulComponent;
import 'package:ng2_state/src/state_service.dart' show StateService;
import 'package:ng2_state/src/state.dart';

enum StatePhase {
  REPLAY,
  LOAD
}

@Injectable()
class StateProvider {

  String _state;
  String get state => _state;
  @Input() void set state(String value) {
    _state = value;

    if (component != null) component.stateGroup = value;

    _triggerLoadState();
  }

  String _stateId;
  String get stateId => _stateId;
  @Input() void set stateId(String value) {
    _stateId = value;

    if (component != null) component.stateId = value;

    _triggerLoadState();
  }

  final StateService stateService;
  final ExceptionHandler exceptionHandler;

  StatefulComponent component;
  State directive;

  bool _isLoadStateTriggered = false, _isProvided = false;

  StreamSubscription _provideStateSubscription;
  StreamSubscription _componentDestroySubscription;

  StateProvider(
    @Inject(StateService) this.stateService,
    @Inject(ExceptionHandler) this.exceptionHandler);

  void provide(StatefulComponent component, String stateGroup, String stateId, {State directive: null}) {
    this.directive = directive;
    this.component = component;

    stateService.registerState(this);

    _initStreams();

    _isProvided = true;

    this.state = stateGroup;
    this.stateId = stateId;
  }

  void flush() {
    _provideStateSubscription?.cancel();
    _componentDestroySubscription?.cancel();

    stateService.unregisterState(this);
  }

  void _initStreams() {
    _provideStateSubscription = component
      .provideState()
      .listen((Entity state) => stateService.registerComponentState(_state, _stateId, state));

    _componentDestroySubscription = component.onDestroy
      .take(1)
      .listen((_) =>  flush());
  }

  void _triggerLoadState() {
    if (_isProvided && !_isLoadStateTriggered && state != null && stateId != null && component != null) {
      _isLoadStateTriggered = true;

      if (stateService.isReady) _loadState();
      else stateService.ready$
        .take(1)
        .listen((_) => _loadState());
    }
  }

  void _loadState() {
    final Entity stateParts = stateService.getComponentState(state, stateId);

    if (stateParts != null) {
      try {
        component.receiveState(stateParts, StatePhase.LOAD);
      } catch (error) {
        exceptionHandler.call(error, error.stackTrace);
      }
    }
  }
}