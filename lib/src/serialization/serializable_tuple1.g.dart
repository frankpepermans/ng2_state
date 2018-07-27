// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// Generator: CodeGenerator
// **************************************************************************

import 'package:dorm/dorm.dart';

import 'serializable_tuple1.dart' as sup;

class SerializableTuple1<T> extends Entity with sup.SerializableTuple1<T> {
  /// refClassName
  @override
  String get refClassName =>
      'i112ng2_state_lib_src_serialization_serializable_tuple1';

  /// Public properties
  /// item1
  static const String ITEM1 = 'item1';
  static const Symbol ITEM1_SYMBOL =
      #i112ng2_state_lib_src_serialization_serializable_tuple1_item1;

  final DormProxy<T> _item1 = new DormProxy<T>(ITEM1, ITEM1_SYMBOL);
  @override
  T get item1 => _item1.value;
  set item1(T value) {
    _item1.value = value;
  }

  /// DO_SCAN
  static void DO_SCAN<T>([String _R, Entity _C()]) {
    _R ??= 'i112ng2_state_lib_src_serialization_serializable_tuple1';
    _C ??= () => new SerializableTuple1<T>();
    Entity.DO_SCAN(_R, _C);
    Entity.ASSEMBLER.scan(_R, _C, const <PropertyData>[
      const PropertyData(
          symbol: SerializableTuple1.ITEM1_SYMBOL,
          name: 'item1',
          type: dynamic,
          metatags: const <dynamic>[]),
    ]);
  }

  /// Constructor
  SerializableTuple1() {
    Entity.ASSEMBLER.registerProxies(this, <DormProxy<dynamic>>[_item1]);
  }

  /// Internal constructor
  static SerializableTuple1<T> construct<T>() => new SerializableTuple1<T>();

  /// withItem1
  SerializableTuple1<T> withItem1(T value) =>
      duplicate(ignoredSymbols: const <Symbol>[SerializableTuple1.ITEM1_SYMBOL])
        ..item1 = value;

  /// Duplicates the [SerializableTuple1] and any recursive entities to a new [SerializableTuple1]
  @override
  SerializableTuple1<T> duplicate({List<Symbol> ignoredSymbols}) =>
      super.duplicate(ignoredSymbols: ignoredSymbols) as SerializableTuple1<T>;
  @override
  bool operator ==(Object other) =>
      other is SerializableTuple1<T> && other.hashCode == this.hashCode;
  @override
  int get hashCode => hash_finish(0);

  /// toString implementation for debugging purposes
  @override
  String toString() =>
      'i112ng2_state_lib_src_serialization_serializable_tuple1';
}
