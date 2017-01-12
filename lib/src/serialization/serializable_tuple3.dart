import 'package:dorm/dorm.dart';

@dorm
abstract class SerializableTuple3<R, S, T> extends Entity {
  R get item1;
  S get item2;
  T get item3;
}