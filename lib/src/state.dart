library ng2_state.state;

import 'dart:async';

import 'package:angular2/angular2.dart';
import 'package:dorm/dorm.dart';

import 'package:ng2_state/src/stateful_component.dart' show StatefulComponent;
import 'package:ng2_state/src/state_service.dart' show StateService;

enum StatePhase {
  REPLAY,
  LOAD
}

@Directive(
    selector: '[state]',
    providers: const [StateService]
)
class State implements OnChanges {

  String _state;
  String get state => _state;
  @Input() void set state(String value) {
    _state = _component.stateGroup =  value;
  }

  String _stateId;
  String get stateId => _stateId;
  @Input() void set stateId(String value) {
    _stateId = _component.stateId =  value;
  }

  StatefulComponent get component => _component;

  final StateService _stateService;
  final ElementRef _element;
  final AppViewManager _appView;
  final ExceptionHandler _exceptionHandler;

  StatefulComponent _component;
  StreamSubscription _provideStateSubscription;

  State(@Inject(StateService) this._stateService, @Inject(ElementRef) this._element, @Inject(AppViewManager) this._appView, @Inject(ExceptionHandler) this._exceptionHandler) {
    dynamic component = _appView.getComponent(_element);

    if (component is! StatefulComponent) {
      final Error error = new Error();

      _exceptionHandler.call(error, error.stackTrace, '$component does not implement Stateful');
    }

    this._component = component as StatefulComponent;

    _stateService.registerState(this);

    _initStreams();
  }

  void _initStreams() {
    _provideStateSubscription = _component.provideState().listen((dynamic state) {
      _stateService.registerComponentState(_state, stateId, state);
    });

    _component.onDestroy.take(1).listen((_) {
      _provideStateSubscription.cancel();

      _stateService.unregisterState(this);
    });
  }

  void ngOnChanges(Map<String, SimpleChange> changes) {
    if (state != null && stateId != null) {
      if (_stateService.isReady) _loadState();
      else _stateService.ready$
        .take(1)
        .listen((_) => _loadState());
    }
  }

  void _loadState() {
    final Entity stateParts = _stateService.getComponentState(state, stateId);

    if (stateParts != null) {
      try {
        _component.receiveState(stateParts, StatePhase.LOAD);
      } catch (error) {
        _exceptionHandler.call(error, error.stackTrace);
      }
    }
  }
}