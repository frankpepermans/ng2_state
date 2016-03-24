library ng2_state.state_recording_session;

import 'dart:async';

import 'package:tuple/tuple.dart';

import 'package:ng2_state/src/state_container.dart';

class StateRecordingSession {

  final List<Tuple2<StateContainer, int>> aggregatedStates = <Tuple2<StateContainer, int>>[];

  StreamSubscription<Tuple2<StateContainer, int>> subscription;

  void add(Tuple2<StateContainer, int> container) => aggregatedStates.add(container);

}