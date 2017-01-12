import 'package:dorm/dorm.dart';

@dorm
abstract class SerializableTuple5<P, Q, R, S, T> extends Entity {
  P get item1;
  Q get item2;
  R get item3;
  S get item4;
  T get item5;
}