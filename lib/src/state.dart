library ng2_state.state;

import 'dart:async';
import 'dart:html';

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
class State implements OnChanges, OnDestroy {

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
  final ExceptionHandler _exceptionHandler;
  final StatefulComponent _component;

  StreamSubscription _provideStateSubscription;
  StreamSubscription _componentDestroySubscription;

  State(
    @Inject(StateService) StateService stateService,
    @Inject(ElementRef) ElementRef element,
    @Inject(ExceptionHandler) this._exceptionHandler) :
      this._stateService = stateService,
      this._element = element,
      this._component = stateService.getComponentForElementRef(element) {
        if (_component == null) throw new ArgumentError('Missing component reference on ${(element.nativeElement as Element).outerHtml}');

        _stateService.registerState(this);

        _initStreams();
      }

  void _initStreams() {
    _provideStateSubscription = _component
      .provideState()
      .listen((Entity state) => _stateService.registerComponentState(_state, stateId, state));

    _componentDestroySubscription = _component.onDestroy
      .take(1)
      .listen((_) =>  _remove());
  }

  @override void ngOnChanges(Map<String, SimpleChange> changes) {
    if (state != null && stateId != null) {
      if (_stateService.isReady) _loadState();
      else _stateService.ready$
        .take(1)
        .listen((_) => _loadState());
    }
  }

  @override void ngOnDestroy() => _remove();

  void _remove() {
    _provideStateSubscription?.cancel();
    _componentDestroySubscription?.cancel();

    _stateService.unregisterState(this);
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