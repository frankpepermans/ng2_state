library ng2_state.serializable_tuple4;

import 'package:dorm/dorm.dart';

@Ref('ng2_state.serializableTuple4')
class SerializableTuple4<Q, R, S, T> extends Entity {

  String get refClassName => 'ng2_state.serializableTuple4';

  //-----------------------------
  // public properties
  //-----------------------------

  @Property(ITEM1_SYMBOL, 'item1', dynamic, 'item1')
  static const String ITEM1 = 'item1';
  static const Symbol ITEM1_SYMBOL = const Symbol('ng2_state.serializableTuple4.item1');

  Q item1;

  @Property(ITEM2_SYMBOL, 'item2', dynamic, 'item2')
  static const String ITEM2 = 'item2';
  static const Symbol ITEM2_SYMBOL = const Symbol('ng2_state.serializableTuple4.item2');

  R item2;

  @Property(ITEM3_SYMBOL, 'item3', dynamic, 'item3')
  static const String ITEM3 = 'item3';
  static const Symbol ITEM3_SYMBOL = const Symbol('ng2_state.serializableTuple4.item3');

  S item3;

  @Property(ITEM4_SYMBOL, 'item4', dynamic, 'item4')
  static const String ITEM4 = 'item4';
  static const Symbol ITEM4_SYMBOL = const Symbol('ng2_state.serializableTuple4.item4');

  T item4;

  //-----------------------------
  // constructor
  //-----------------------------

  SerializableTuple4() : super();

  static SerializableTuple4 construct() => new SerializableTuple4();
}