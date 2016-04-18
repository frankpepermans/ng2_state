library ng2_state.state_recording_session;

import 'dart:async';

import 'package:tuple/tuple.dart';

import 'package:ng2_state/src/state_container.dart';

class StateRecordingSession {

  final List<Tuple2<List<StateContainer>, int>> aggregatedStates = <Tuple2<List<StateContainer>, int>>[];

  StreamSubscription<Tuple2<List<StateContainer>, int>> subscription;

  void add(Tuple2<List<StateContainer>, int> container) => aggregatedStates.add(container);

}