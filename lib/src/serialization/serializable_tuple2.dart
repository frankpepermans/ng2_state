import 'package:dorm/dorm.dart';

@dorm
abstract class SerializableTuple2<S, T> implements Entity {
  S get item1;
  T get item2;
}