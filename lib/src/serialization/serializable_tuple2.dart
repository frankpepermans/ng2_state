import 'package:optics/optics.dart';

import 'serializable_tuple.dart';

@optics
abstract class SerializableTuple2<A, B> extends SerializableTuple {
  A get item1;
  B get item2;
}