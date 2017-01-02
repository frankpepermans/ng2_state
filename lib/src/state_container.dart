import 'package:optics/optics.dart';

@optics
abstract class StateContainer extends Comparable<dynamic> {
  String get group;
  String get id;
  dynamic get stateParts;
}