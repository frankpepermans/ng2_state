library ng2_state.serializable_tuple2;

import 'package:dorm/dorm.dart';

@Ref('ng2_state.serializableTuple2')
class SerializableTuple2<S, T> extends Entity {

  String get refClassName => 'ng2_state.serializableTuple2';

  //-----------------------------
  // public properties
  //-----------------------------

  @Property(ITEM1_SYMBOL, 'item1', dynamic, 'item1')
  static const String ITEM1 = 'item1';
  static const Symbol ITEM1_SYMBOL = const Symbol('ng2_state.serializableTuple2.item1');

  S item1;

  @Property(ITEM2_SYMBOL, 'item2', dynamic, 'item2')
  static const String ITEM2 = 'item2';
  static const Symbol ITEM2_SYMBOL = const Symbol('ng2_state.serializableTuple2.item2');

  T item2;

  //-----------------------------
  // constructor
  //-----------------------------

  SerializableTuple2() : super();

  static SerializableTuple2 construct() => new SerializableTuple2();
}