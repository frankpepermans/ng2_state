library ng2_state.common.common_providers;

import 'package:ng2_state/ng2_state.dart';

export 'package:ng2_state/src/state_service.dart';
export 'package:ng2_state/src/state_provider.dart';

const List<List<Type>> COMMON_PROVIDERS = const [
  STATE_PROVIDERS
];

const List<Type> STATE_PROVIDERS = const [
  StateService,
  StateProvider
];