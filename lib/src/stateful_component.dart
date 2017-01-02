library ng2_state.stateful_component;

import 'dart:async';

import 'package:angular2/angular2.dart';

import 'package:ng2_state/src/state_provider.dart' show StatePhase;

abstract class StatefulComponent {

  String stateGroup, stateId;

  Stream<bool> get onDestroy;

  Stream<Comparable<dynamic>> provideState();

  void receiveState(Comparable<dynamic> state, StatePhase phase);

}