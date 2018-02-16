// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// Generator: CodeGenerator
// Target: abstract class SerializableTuple3
// **************************************************************************

import 'package:dorm/dorm.dart';

import 'serializable_tuple3.dart' as sup;

class SerializableTuple3<R, S, T> extends Entity
    with sup.SerializableTuple3<R, S, T> {
  /// refClassName
  @override
  String get refClassName =>
      'i112ng2_state_lib_src_serialization_serializable_tuple3';

  /// Public properties
  /// item1
  static const String ITEM1 = 'item1';
  static const Symbol ITEM1_SYMBOL =
      #i112ng2_state_lib_src_serialization_serializable_tuple3_item1;

  final DormProxy<R> _item1 = new DormProxy<R>(ITEM1, ITEM1_SYMBOL);
  @override
  R get item1 => _item1.value;
  set item1(R value) {
    _item1.value = value;
  }

  /// item2
  static const String ITEM2 = 'item2';
  static const Symbol ITEM2_SYMBOL =
      #i112ng2_state_lib_src_serialization_serializable_tuple3_item2;

  final DormProxy<S> _item2 = new DormProxy<S>(ITEM2, ITEM2_SYMBOL);
  @override
  S get item2 => _item2.value;
  set item2(S value) {
    _item2.value = value;
  }

  /// item3
  static const String ITEM3 = 'item3';
  static const Symbol ITEM3_SYMBOL =
      #i112ng2_state_lib_src_serialization_serializable_tuple3_item3;

  final DormProxy<T> _item3 = new DormProxy<T>(ITEM3, ITEM3_SYMBOL);
  @override
  T get item3 => _item3.value;
  set item3(T value) {
    _item3.value = value;
  }

  /// DO_SCAN
  static void DO_SCAN<R, S, T>([String _R, Entity _C()]) {
    _R ??= 'i112ng2_state_lib_src_serialization_serializable_tuple3';
    _C ??= () => new SerializableTuple3<R, S, T>();
    Entity.DO_SCAN(_R, _C);
    Entity.ASSEMBLER.scan(_R, _C, const <PropertyData>[
      const PropertyData(
          symbol: SerializableTuple3.ITEM1_SYMBOL,
          name: 'item1',
          type: dynamic,
          metatags: const <dynamic>[]),
      const PropertyData(
          symbol: SerializableTuple3.ITEM2_SYMBOL,
          name: 'item2',
          type: dynamic,
          metatags: const <dynamic>[]),
      const PropertyData(
          symbol: SerializableTuple3.ITEM3_SYMBOL,
          name: 'item3',
          type: dynamic,
          metatags: const <dynamic>[]),
    ]);
  }

  /// Constructor
  SerializableTuple3() : super() {
    Entity.ASSEMBLER
        .registerProxies(this, <DormProxy<dynamic>>[_item1, _item2, _item3]);
  }

  /// Internal constructor
  static SerializableTuple3<R, S, T>
      construct<R, S, T>() => new SerializableTuple3<R, S, T>();

  /// Duplicates the [SerializableTuple3] and any recusrive entities to a new [SerializableTuple3]
  @override
  SerializableTuple3<R, S, T> duplicate({List<Symbol> ignoredSymbols: null}) =>
      super.duplicate(ignoredSymbols: ignoredSymbols) as SerializableTuple3<R, S, T>;
}
