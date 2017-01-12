import 'package:dorm/dorm.dart';

@dorm
abstract class SerializableTuple4<Q, R, S, T> extends Entity {
  Q get item1;
  R get item2;
  S get item3;
  T get item4;
}