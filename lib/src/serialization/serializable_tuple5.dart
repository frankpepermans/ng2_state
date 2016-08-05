library ng2_state.serializable_tuple5;

import 'package:dorm/dorm.dart';

@Ref('ng2_state.serializableTuple5')
class SerializableTuple5<P, Q, R, S, T> extends Entity {

  @override String get refClassName => 'ng2_state.serializableTuple5';

  //-----------------------------
  // public properties
  //-----------------------------

  @Property(ITEM1_SYMBOL, 'item1', dynamic, 'item1')
  static const String ITEM1 = 'item1';
  static const Symbol ITEM1_SYMBOL = const Symbol('ng2_state.serializableTuple5.item1');

  P item1;

  @Property(ITEM2_SYMBOL, 'item2', dynamic, 'item2')
  static const String ITEM2 = 'item2';
  static const Symbol ITEM2_SYMBOL = const Symbol('ng2_state.serializableTuple5.item2');

  Q item2;

  @Property(ITEM3_SYMBOL, 'item3', dynamic, 'item3')
  static const String ITEM3 = 'item3';
  static const Symbol ITEM3_SYMBOL = const Symbol('ng2_state.serializableTuple5.item3');

  R item3;

  @Property(ITEM4_SYMBOL, 'item4', dynamic, 'item4')
  static const String ITEM4 = 'item4';
  static const Symbol ITEM4_SYMBOL = const Symbol('ng2_state.serializableTuple5.item4');

  S item4;

  @Property(ITEM5_SYMBOL, 'item5', dynamic, 'item5')
  static const String ITEM5 = 'item5';
  static const Symbol ITEM5_SYMBOL = const Symbol('ng2_state.serializableTuple5.item5');

  T item5;

  //-----------------------------
  // constructor
  //-----------------------------

  SerializableTuple5() : super();

  static SerializableTuple5 construct() => new SerializableTuple5();
}