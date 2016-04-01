library ng2_state.state_container;

import 'package:dorm/dorm.dart';

@Ref('ng2_state.stateContainer')
class StateContainer extends Entity {

  @override String get refClassName => 'ng2_state.stateContainer';

  //-----------------------------
  // public properties
  //-----------------------------

  @Id('')
  @Property(GROUP_SYMBOL, 'group', String, 'group')
  static const String GROUP = 'group';
  static const Symbol GROUP_SYMBOL = const Symbol('ng2_state.stateContainer.group');

  String group;

  @Id('')
  @Property(ID_SYMBOL, 'id', String, 'id')
  static const String ID = 'id';
  static const Symbol ID_SYMBOL = const Symbol('ng2_state.stateContainer.id');

  String id;

  @Property(STATEPARTS_SYMBOL, 'stateParts', Entity, 'stateParts')
  static const String STATEPARTS = 'stateParts';
  static const Symbol STATEPARTS_SYMBOL = const Symbol('ng2_state.stateContainer.stateParts');

  Entity stateParts;

  //-----------------------------
  // constructor
  //-----------------------------

  StateContainer() : super();

  static StateContainer construct() => new StateContainer();
}