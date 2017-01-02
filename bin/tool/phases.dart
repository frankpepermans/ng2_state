import 'package:build_runner/build_runner.dart';

import 'package:optics/src/optics_generator.dart';
import 'package:source_gen/source_gen.dart';

final PhaseGroup phases = new PhaseGroup.singleAction(
    new GeneratorBuilder(const <Generator>[
      const OpticsGenerator()
    ], isStandalone: true),
    new InputSet('ng2_state',
        const <String>['lib/src/*.dart', 'lib/src/serialization/*.dart']));