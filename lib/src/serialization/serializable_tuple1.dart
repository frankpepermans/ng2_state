import 'package:optics/optics.dart';

import 'serializable_tuple.dart';

@optics
abstract class SerializableTuple1<A> extends SerializableTuple {
  A get item1;
}