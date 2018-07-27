// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// Generator: CodeGenerator
// **************************************************************************

import 'package:dorm/dorm.dart';

import 'serializable_tuple4.dart' as sup;

class SerializableTuple4<Q, R, S, T> extends Entity
    with sup.SerializableTuple4<Q, R, S, T> {
  /// refClassName
  @override
  String get refClassName =>
      'i112ng2_state_lib_src_serialization_serializable_tuple4';

  /// Public properties
  /// item1
  static const String ITEM1 = 'item1';
  static const Symbol ITEM1_SYMBOL =
      #i112ng2_state_lib_src_serialization_serializable_tuple4_item1;

  final DormProxy<Q> _item1 = new DormProxy<Q>(ITEM1, ITEM1_SYMBOL);
  @override
  Q get item1 => _item1.value;
  set item1(Q value) {
    _item1.value = value;
  }

  /// item2
  static const String ITEM2 = 'item2';
  static const Symbol ITEM2_SYMBOL =
      #i112ng2_state_lib_src_serialization_serializable_tuple4_item2;

  final DormProxy<R> _item2 = new DormProxy<R>(ITEM2, ITEM2_SYMBOL);
  @override
  R get item2 => _item2.value;
  set item2(R value) {
    _item2.value = value;
  }

  /// item3
  static const String ITEM3 = 'item3';
  static const Symbol ITEM3_SYMBOL =
      #i112ng2_state_lib_src_serialization_serializable_tuple4_item3;

  final DormProxy<S> _item3 = new DormProxy<S>(ITEM3, ITEM3_SYMBOL);
  @override
  S get item3 => _item3.value;
  set item3(S value) {
    _item3.value = value;
  }

  /// item4
  static const String ITEM4 = 'item4';
  static const Symbol ITEM4_SYMBOL =
      #i112ng2_state_lib_src_serialization_serializable_tuple4_item4;

  final DormProxy<T> _item4 = new DormProxy<T>(ITEM4, ITEM4_SYMBOL);
  @override
  T get item4 => _item4.value;
  set item4(T value) {
    _item4.value = value;
  }

  /// DO_SCAN
  static void DO_SCAN<Q, R, S, T>([String _R, Entity _C()]) {
    _R ??= 'i112ng2_state_lib_src_serialization_serializable_tuple4';
    _C ??= () => new SerializableTuple4<Q, R, S, T>();
    Entity.DO_SCAN(_R, _C);
    Entity.ASSEMBLER.scan(_R, _C, const <PropertyData>[
      const PropertyData(
          symbol: SerializableTuple4.ITEM1_SYMBOL,
          name: 'item1',
          type: dynamic,
          metatags: const <dynamic>[]),
      const PropertyData(
          symbol: SerializableTuple4.ITEM2_SYMBOL,
          name: 'item2',
          type: dynamic,
          metatags: const <dynamic>[]),
      const PropertyData(
          symbol: SerializableTuple4.ITEM3_SYMBOL,
          name: 'item3',
          type: dynamic,
          metatags: const <dynamic>[]),
      const PropertyData(
          symbol: SerializableTuple4.ITEM4_SYMBOL,
          name: 'item4',
          type: dynamic,
          metatags: const <dynamic>[]),
    ]);
  }

  /// Constructor
  SerializableTuple4() {
    Entity.ASSEMBLER.registerProxies(
        this, <DormProxy<dynamic>>[_item1, _item2, _item3, _item4]);
  }

  /// Internal constructor
  static SerializableTuple4<Q, R, S, T> construct<Q, R, S, T>() =>
      new SerializableTuple4<Q, R, S, T>();

  /// withItem1
  SerializableTuple4<Q, R, S, T> withItem1(Q value) =>
      duplicate(ignoredSymbols: const <Symbol>[SerializableTuple4.ITEM1_SYMBOL])
        ..item1 = value;

  /// withItem2
  SerializableTuple4<Q, R, S, T> withItem2(R value) =>
      duplicate(ignoredSymbols: const <Symbol>[SerializableTuple4.ITEM2_SYMBOL])
        ..item2 = value;

  /// withItem3
  SerializableTuple4<Q, R, S, T> withItem3(S value) =>
      duplicate(ignoredSymbols: const <Symbol>[SerializableTuple4.ITEM3_SYMBOL])
        ..item3 = value;

  /// withItem4
  SerializableTuple4<Q, R, S, T> withItem4(T value) =>
      duplicate(ignoredSymbols: const <Symbol>[SerializableTuple4.ITEM4_SYMBOL])
        ..item4 = value;

  /// Duplicates the [SerializableTuple4] and any recursive entities to a new [SerializableTuple4]
  @override
  SerializableTuple4<Q, R, S, T> duplicate({List<Symbol> ignoredSymbols}) =>
      super.duplicate(ignoredSymbols: ignoredSymbols)
          as SerializableTuple4<Q, R, S, T>;
  @override
  bool operator ==(Object other) =>
      other is SerializableTuple4<Q, R, S, T> &&
      other.hashCode == this.hashCode;
  @override
  int get hashCode => hash_finish(0);

  /// toString implementation for debugging purposes
  @override
  String toString() =>
      'i112ng2_state_lib_src_serialization_serializable_tuple4';
}
