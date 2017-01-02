import 'package:optics/optics.dart';

import 'serializable_tuple.dart';

@optics
abstract class SerializableTuple5<A, B, C, D, E> extends SerializableTuple {
  A get item1;
  B get item2;
  C get item3;
  D get item4;
  E get item5;
}