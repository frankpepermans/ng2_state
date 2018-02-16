// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// Generator: CodeGenerator
// Target: abstract class SerializableTuple2
// **************************************************************************

import 'package:dorm/dorm.dart';

import 'serializable_tuple2.dart' as sup;

class SerializableTuple2<S, T> extends Entity
    with sup.SerializableTuple2<S, T> {
  /// refClassName
  @override
  String get refClassName =>
      'i112ng2_state_lib_src_serialization_serializable_tuple2';

  /// Public properties
  /// item1
  static const String ITEM1 = 'item1';
  static const Symbol ITEM1_SYMBOL =
      #i112ng2_state_lib_src_serialization_serializable_tuple2_item1;

  final DormProxy<S> _item1 = new DormProxy<S>(ITEM1, ITEM1_SYMBOL);
  @override
  S get item1 => _item1.value;
  set item1(S value) {
    _item1.value = value;
  }

  /// item2
  static const String ITEM2 = 'item2';
  static const Symbol ITEM2_SYMBOL =
      #i112ng2_state_lib_src_serialization_serializable_tuple2_item2;

  final DormProxy<T> _item2 = new DormProxy<T>(ITEM2, ITEM2_SYMBOL);
  @override
  T get item2 => _item2.value;
  set item2(T value) {
    _item2.value = value;
  }

  /// DO_SCAN
  static void DO_SCAN<S, T>([String _R, Entity _C()]) {
    _R ??= 'i112ng2_state_lib_src_serialization_serializable_tuple2';
    _C ??= () => new SerializableTuple2<S, T>();
    Entity.DO_SCAN(_R, _C);
    Entity.ASSEMBLER.scan(_R, _C, const <PropertyData>[
      const PropertyData(
          symbol: SerializableTuple2.ITEM1_SYMBOL,
          name: 'item1',
          type: dynamic,
          metatags: const <dynamic>[]),
      const PropertyData(
          symbol: SerializableTuple2.ITEM2_SYMBOL,
          name: 'item2',
          type: dynamic,
          metatags: const <dynamic>[]),
    ]);
  }

  /// Constructor
  SerializableTuple2() : super() {
    Entity.ASSEMBLER
        .registerProxies(this, <DormProxy<dynamic>>[_item1, _item2]);
  }

  /// Internal constructor
  static SerializableTuple2<S, T>
      construct<S, T>() => new SerializableTuple2<S, T>();

  /// Duplicates the [SerializableTuple2] and any recusrive entities to a new [SerializableTuple2]
  @override
  SerializableTuple2<S, T> duplicate({List<Symbol> ignoredSymbols: null}) =>
      super.duplicate(ignoredSymbols: ignoredSymbols) as SerializableTuple2<S, T>;
}
