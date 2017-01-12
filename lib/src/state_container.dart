import 'package:dorm/dorm.dart';

@dorm
abstract class StateContainer extends Entity {
  @Id('')
  String get group;
  @Id('')
  String get id;
  Entity get stateParts;
}