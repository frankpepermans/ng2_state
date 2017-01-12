import 'package:dorm/dorm.dart';

@dorm
abstract class SerializableTuple6<O, P, Q, R, S, T> implements Entity {
  O get item1;
  P get item2;
  Q get item3;
  R get item4;
  S get item5;
  T get item6;
}