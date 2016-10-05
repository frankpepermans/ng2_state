library ng2_state.state;

import 'dart:html';

import 'package:angular2/angular2.dart';

import 'package:ng2_state/src/stateful_component.dart' show StatefulComponent;
import 'package:ng2_state/src/state_service.dart' show StateService;
import 'package:ng2_state/src/state_provider.dart' show StateProvider;

@Directive(
    selector: '[state]',
    providers: const <Type>[StateService, StateProvider]
)
class State implements OnDestroy, OnInit {

  bool _hasState = false, _hasStateId = false, _isProvided = false;
  StatefulComponent _component;

  String _state;
  String get state => _state;
  @Input() set state(String value) {
    _state = value;
    _hasState = value != null;

    _stateProvider.state = value;

    _provide();
  }

  String _stateId;
  String get stateId => _stateId;
  @Input() set stateId(String value) {
    _stateId = value;
    _hasStateId = true;

    _stateProvider.stateId = value;

    _provide();
  }

  final StateProvider _stateProvider;
  final StateService _stateService;
  final ElementRef _element;

  State(
    @Inject(StateProvider) this._stateProvider,
    @Inject(StateService) this._stateService,
    @Inject(ElementRef) this._element);

  @override void ngOnInit() {
    _component = _stateService.getComponentForElementRef(_element);

    if (_component == null) throw new ArgumentError('Missing component reference on ${(_element.nativeElement as Element).outerHtml}');

    _stateProvider.initStreams(_component);

    _provide();
  }

  @override void ngOnDestroy() => _stateProvider.flush();

  void _provide() {
    if (!_isProvided && _hasState && _hasStateId && _component != null) {
      _isProvided = true;

      _stateProvider.provide(_component, state, stateId, directive: this);
    }
  }
}