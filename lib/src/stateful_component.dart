library ng2_state.stateful_component;

import 'dart:async';

import 'package:dorm/dorm.dart';

import 'package:ng2_state/src/state_provider.dart' show StatePhase;

abstract class StatefulComponent {

  String stateGroup, stateId;

  Stream<bool> get onDestroy;

  Stream<Entity> provideState();

  void receiveState(covariant Entity state, StatePhase phase);

}