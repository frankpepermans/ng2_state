import 'package:angular/angular.dart';

import 'package:ng2_state/src/stateful_component.dart' show StatefulComponent;
import 'package:ng2_state/src/state_service.dart' show StateService;
import 'package:ng2_state/src/state_provider.dart' show StateProvider;

@Directive(
    selector: '[state]', providers: const <Type>[StateService, StateProvider])
class State implements OnDestroy {
  bool _hasState = false, _hasStateId = false, _hasComponent = false, _isProvided = false;

  String _state;
  String get state => _state;
  @Input('state')
  set state(String value) {
    _state = value;
    _hasState = value != null;

    _stateProvider.state = value;

    _provide();
  }

  String _stateId;
  String get stateId => _stateId;
  @Input('stateId')
  set stateId(String value) {
    _stateId = value;
    _hasStateId = true;

    _stateProvider.stateId = value;

    _provide();
  }

  StatefulComponent _statefulComponent;
  StatefulComponent get statefulComponent => _statefulComponent;
  @Input('statefulComponent')
  set statefulComponent(StatefulComponent value) {
    _statefulComponent = value;

    if (value != null) {
      _hasComponent = true;
      _stateProvider.initStreams(value);

      _provide();
    }
  }

  final StateProvider _stateProvider;

  State(@Inject(StateProvider) this._stateProvider);

  @override
  void ngOnDestroy() => _stateProvider.flush();

  void _provide() {
    if (!_isProvided && _hasState && _hasStateId && _hasComponent) {
      _isProvided = true;

      _stateProvider.provide(_statefulComponent, state, stateId,
          directive: this);
    }
  }
}
