library ng2_state.state_recording_session;

import 'dart:async';

import 'package:tuple/tuple.dart';

import 'package:ng2_state/src/state_container.g.dart';

class StateRecordingSession {

  final List<Tuple2<Map<String, StateContainer>, int>> aggregatedStates = <Tuple2<Map<String, StateContainer>, int>>[];

  StreamSubscription<Tuple2<Map<String, StateContainer>, int>> subscription;

  void add(Tuple2<Map<String, StateContainer>, int> container) => aggregatedStates.add(container);

}