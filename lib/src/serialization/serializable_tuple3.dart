import 'package:optics/optics.dart';

import 'serializable_tuple.dart';

@optics
abstract class SerializableTuple3<A, B, C> extends SerializableTuple {
  A get item1;
  B get item2;
  C get item3;
}