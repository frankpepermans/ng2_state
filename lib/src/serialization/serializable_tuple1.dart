import 'package:dorm/dorm.dart';

@dorm
abstract class SerializableTuple1<T> extends Entity {
  T get item1;
}