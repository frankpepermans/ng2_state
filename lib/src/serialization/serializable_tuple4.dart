import 'package:optics/optics.dart';

import 'serializable_tuple.dart';

@optics
abstract class SerializableTuple4<A, B, C, D> extends SerializableTuple {
  A get item1;
  B get item2;
  C get item3;
  D get item4;
}