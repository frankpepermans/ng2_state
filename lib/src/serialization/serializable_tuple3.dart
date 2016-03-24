library ng2_state.serializable_tuple3;

import 'package:dorm/dorm.dart';

@Ref('ng2_state.serializableTuple3')
class SerializableTuple3<R, S, T> extends Entity {

  String get refClassName => 'ng2_state.serializableTuple3';

  //-----------------------------
  // public properties
  //-----------------------------

  @Property(ITEM1_SYMBOL, 'item1', dynamic, 'item1')
  static const String ITEM1 = 'item1';
  static const Symbol ITEM1_SYMBOL = const Symbol('ng2_state.serializableTuple3.item1');

  R item1;

  @Property(ITEM2_SYMBOL, 'item2', dynamic, 'item2')
  static const String ITEM2 = 'item2';
  static const Symbol ITEM2_SYMBOL = const Symbol('ng2_state.serializableTuple3.item2');

  S item2;

  @Property(ITEM3_SYMBOL, 'item3', dynamic, 'item3')
  static const String ITEM3 = 'item3';
  static const Symbol ITEM3_SYMBOL = const Symbol('ng2_state.serializableTuple3.item3');

  T item3;

  //-----------------------------
  // constructor
  //-----------------------------

  SerializableTuple3() : super();

  static SerializableTuple3 construct() => new SerializableTuple3();
}