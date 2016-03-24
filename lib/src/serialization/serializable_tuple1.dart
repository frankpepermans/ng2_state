library ng2_state.serializable_tuple1;

import 'package:dorm/dorm.dart';

@Ref('ng2_state.serializableTuple1')
class SerializableTuple1<T> extends Entity {

  String get refClassName => 'ng2_state.serializableTuple1';

  //-----------------------------
  // public properties
  //-----------------------------

  @Property(ITEM1_SYMBOL, 'item1', dynamic, 'item1')
  static const String ITEM1 = 'item1';
  static const Symbol ITEM1_SYMBOL = const Symbol('ng2_state.serializableTuple1.item1');

  T item1;

  //-----------------------------
  // constructor
  //-----------------------------

  SerializableTuple1() : super();

  static SerializableTuple1 construct() => new SerializableTuple1();
}