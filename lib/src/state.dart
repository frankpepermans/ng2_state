library ng2_state.state;

import 'package:angular/angular.dart';

import 'package:ng2_state/src/stateful_component.dart' show StatefulComponent;
import 'package:ng2_state/src/state_service.dart' show StateService;
import 'package:ng2_state/src/state_provider.dart' show StateProvider;

@Directive(
    selector: '[state]',
    providers: const <Type>[StateService, StateProvider]
)
class State implements OnDestroy, OnInit {

  bool _hasState = false, _hasStateId = false, _isProvided = false;

  final StatefulComponent _component;

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

  State(
    @Inject(StatefulComponent) this._component,
    @Inject(StateProvider) this._stateProvider);

  @override void ngOnInit() {
    _stateProvider.initStreams(_component);

    _provide();
  }

  @override void ngOnDestroy() => _stateProvider.flush();

  void _provide() {
    if (!_isProvided && _hasState && _hasStateId) {
      _isProvided = true;

      _stateProvider.provide(_component, state, stateId, directive: this);
    }
  }
}