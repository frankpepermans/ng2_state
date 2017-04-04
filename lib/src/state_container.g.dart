// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// Generator: CodeGenerator
// Target: abstract class StateContainer
// **************************************************************************

import 'package:dorm/dorm.dart';

import 'state_container.dart' as sup;

class StateContainer extends Entity with sup.StateContainer {
  /// refClassName
  @override
  String get refClassName => 'i112ng2_state_lib_src_state_container';

  /// Public properties
  /// group
  static const String GROUP = 'group';
  static const Symbol GROUP_SYMBOL =
      #i112ng2_state_lib_src_state_container_group;

  final DormProxy<String> _group = new DormProxy<String>(GROUP, GROUP_SYMBOL);
  @override
  String get group => _group.value;
  set group(String value) {
    _group.value = value;
  }

  /// id
  static const String ID = 'id';
  static const Symbol ID_SYMBOL = #i112ng2_state_lib_src_state_container_id;

  final DormProxy<String> _id = new DormProxy<String>(ID, ID_SYMBOL);
  @override
  String get id => _id.value;
  set id(String value) {
    _id.value = value;
  }

  /// stateParts
  static const String STATEPARTS = 'stateParts';
  static const Symbol STATEPARTS_SYMBOL =
      #i112ng2_state_lib_src_state_container_stateParts;

  final DormProxy<Entity> _stateParts =
      new DormProxy<Entity>(STATEPARTS, STATEPARTS_SYMBOL);
  @override
  Entity get stateParts => _stateParts.value;
  set stateParts(Entity value) {
    _stateParts.value = value;
  }

  /// DO_SCAN
  static void DO_SCAN([String _R, Entity _C()]) {
    _R ??= 'i112ng2_state_lib_src_state_container';
    _C ??= () => new StateContainer();
    Entity.DO_SCAN(_R, _C);
    Entity.ASSEMBLER.scan(_R, _C, const <PropertyData>[
      const PropertyData(
          symbol: StateContainer.GROUP_SYMBOL,
          name: 'group',
          type: String,
          metatags: const <dynamic>[
            const Id(''),
          ]),
      const PropertyData(
          symbol: StateContainer.ID_SYMBOL,
          name: 'id',
          type: String,
          metatags: const <dynamic>[
            const Id(''),
          ]),
      const PropertyData(
          symbol: StateContainer.STATEPARTS_SYMBOL,
          name: 'stateParts',
          type: Entity,
          metatags: const <dynamic>[]),
    ]);
  }

  /// Constructor
  StateContainer() : super() {
    Entity.ASSEMBLER
        .registerProxies(this, <DormProxy<dynamic>>[_group, _id, _stateParts]);
  }

  /// Internal constructor
  static StateContainer construct() => new StateContainer();

  /// Duplicates the [StateContainer] and any recusrive entities to a new [StateContainer]
  @override
  StateContainer duplicate({List<Symbol> ignoredSymbols: null}) =>
      super.duplicate(ignoredSymbols: ignoredSymbols);
}
