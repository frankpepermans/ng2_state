import 'package:dorm/dorm.dart';

@dorm
abstract class SerializableTuple1<T> implements Entity {
  T get item1;
}