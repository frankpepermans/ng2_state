library ng2_state.serializable_tuple6;

import 'package:dorm/dorm.dart';

@Ref('ng2_state.serializableTuple6')
class SerializableTuple6<O, P, Q, R, S, T> extends Entity {

  @override String get refClassName => 'ng2_state.serializableTuple6';

  //-----------------------------
  // public properties
  //-----------------------------

  @Property(ITEM1_SYMBOL, 'item1', dynamic, 'item1')
  static const String ITEM1 = 'item1';
  static const Symbol ITEM1_SYMBOL = const Symbol('ng2_state.serializableTuple6.item1');

  O item1;

  @Property(ITEM2_SYMBOL, 'item2', dynamic, 'item2')
  static const String ITEM2 = 'item2';
  static const Symbol ITEM2_SYMBOL = const Symbol('ng2_state.serializableTuple6.item2');

  P item2;

  @Property(ITEM3_SYMBOL, 'item3', dynamic, 'item3')
  static const String ITEM3 = 'item3';
  static const Symbol ITEM3_SYMBOL = const Symbol('ng2_state.serializableTuple6.item3');

  Q item3;

  @Property(ITEM4_SYMBOL, 'item4', dynamic, 'item4')
  static const String ITEM4 = 'item4';
  static const Symbol ITEM4_SYMBOL = const Symbol('ng2_state.serializableTuple6.item4');

  R item4;

  @Property(ITEM5_SYMBOL, 'item5', dynamic, 'item5')
  static const String ITEM5 = 'item5';
  static const Symbol ITEM5_SYMBOL = const Symbol('ng2_state.serializableTuple6.item5');

  S item5;

  @Property(ITEM6_SYMBOL, 'item6', dynamic, 'item6')
  static const String ITEM6 = 'item6';
  static const Symbol ITEM6_SYMBOL = const Symbol('ng2_state.serializableTuple6.item6');

  T item6;

  //-----------------------------
  // constructor
  //-----------------------------

  SerializableTuple6() : super();

  static SerializableTuple6 construct() => new SerializableTuple6();
}