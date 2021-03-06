// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// Generator: CodeGenerator
// **************************************************************************

import 'package:dorm/dorm.dart';

import 'serializable_tuple5.dart' as sup;

class SerializableTuple5<P, Q, R, S, T> extends Entity
    with sup.SerializableTuple5<P, Q, R, S, T> {
  /// refClassName
  @override
  String get refClassName =>
      'i112ng2_state_lib_src_serialization_serializable_tuple5';

  /// Public properties
  /// item1
  static const String ITEM1 = 'item1';
  static const Symbol ITEM1_SYMBOL =
      #i112ng2_state_lib_src_serialization_serializable_tuple5_item1;

  final DormProxy<P> _item1 = new DormProxy<P>(ITEM1, ITEM1_SYMBOL);
  @override
  P get item1 => _item1.value;
  set item1(P value) {
    _item1.value = value;
  }

  /// item2
  static const String ITEM2 = 'item2';
  static const Symbol ITEM2_SYMBOL =
      #i112ng2_state_lib_src_serialization_serializable_tuple5_item2;

  final DormProxy<Q> _item2 = new DormProxy<Q>(ITEM2, ITEM2_SYMBOL);
  @override
  Q get item2 => _item2.value;
  set item2(Q value) {
    _item2.value = value;
  }

  /// item3
  static const String ITEM3 = 'item3';
  static const Symbol ITEM3_SYMBOL =
      #i112ng2_state_lib_src_serialization_serializable_tuple5_item3;

  final DormProxy<R> _item3 = new DormProxy<R>(ITEM3, ITEM3_SYMBOL);
  @override
  R get item3 => _item3.value;
  set item3(R value) {
    _item3.value = value;
  }

  /// item4
  static const String ITEM4 = 'item4';
  static const Symbol ITEM4_SYMBOL =
      #i112ng2_state_lib_src_serialization_serializable_tuple5_item4;

  final DormProxy<S> _item4 = new DormProxy<S>(ITEM4, ITEM4_SYMBOL);
  @override
  S get item4 => _item4.value;
  set item4(S value) {
    _item4.value = value;
  }

  /// item5
  static const String ITEM5 = 'item5';
  static const Symbol ITEM5_SYMBOL =
      #i112ng2_state_lib_src_serialization_serializable_tuple5_item5;

  final DormProxy<T> _item5 = new DormProxy<T>(ITEM5, ITEM5_SYMBOL);
  @override
  T get item5 => _item5.value;
  set item5(T value) {
    _item5.value = value;
  }

  /// DO_SCAN
  static void DO_SCAN<P, Q, R, S, T>([String _R, Entity _C()]) {
    _R ??= 'i112ng2_state_lib_src_serialization_serializable_tuple5';
    _C ??= () => new SerializableTuple5<P, Q, R, S, T>();
    Entity.DO_SCAN(_R, _C);
    Entity.ASSEMBLER.scan(_R, _C, const <PropertyData>[
      const PropertyData(
          symbol: SerializableTuple5.ITEM1_SYMBOL,
          name: 'item1',
          type: dynamic,
          metatags: const <dynamic>[]),
      const PropertyData(
          symbol: SerializableTuple5.ITEM2_SYMBOL,
          name: 'item2',
          type: dynamic,
          metatags: const <dynamic>[]),
      const PropertyData(
          symbol: SerializableTuple5.ITEM3_SYMBOL,
          name: 'item3',
          type: dynamic,
          metatags: const <dynamic>[]),
      const PropertyData(
          symbol: SerializableTuple5.ITEM4_SYMBOL,
          name: 'item4',
          type: dynamic,
          metatags: const <dynamic>[]),
      const PropertyData(
          symbol: SerializableTuple5.ITEM5_SYMBOL,
          name: 'item5',
          type: dynamic,
          metatags: const <dynamic>[]),
    ]);
  }

  /// Constructor
  SerializableTuple5() {
    Entity.ASSEMBLER.registerProxies(
        this, <DormProxy<dynamic>>[_item1, _item2, _item3, _item4, _item5]);
  }

  /// Internal constructor
  static SerializableTuple5<P, Q, R, S, T> construct<P, Q, R, S, T>() =>
      new SerializableTuple5<P, Q, R, S, T>();

  /// withItem1
  SerializableTuple5<P, Q, R, S, T> withItem1(P value) =>
      duplicate(ignoredSymbols: const <Symbol>[SerializableTuple5.ITEM1_SYMBOL])
        ..item1 = value;

  /// withItem2
  SerializableTuple5<P, Q, R, S, T> withItem2(Q value) =>
      duplicate(ignoredSymbols: const <Symbol>[SerializableTuple5.ITEM2_SYMBOL])
        ..item2 = value;

  /// withItem3
  SerializableTuple5<P, Q, R, S, T> withItem3(R value) =>
      duplicate(ignoredSymbols: const <Symbol>[SerializableTuple5.ITEM3_SYMBOL])
        ..item3 = value;

  /// withItem4
  SerializableTuple5<P, Q, R, S, T> withItem4(S value) =>
      duplicate(ignoredSymbols: const <Symbol>[SerializableTuple5.ITEM4_SYMBOL])
        ..item4 = value;

  /// withItem5
  SerializableTuple5<P, Q, R, S, T> withItem5(T value) =>
      duplicate(ignoredSymbols: const <Symbol>[SerializableTuple5.ITEM5_SYMBOL])
        ..item5 = value;

  /// Duplicates the [SerializableTuple5] and any recursive entities to a new [SerializableTuple5]
  @override
  SerializableTuple5<P, Q, R, S, T> duplicate({List<Symbol> ignoredSymbols}) =>
      super.duplicate(ignoredSymbols: ignoredSymbols)
          as SerializableTuple5<P, Q, R, S, T>;
  @override
  bool operator ==(Object other) =>
      other is SerializableTuple5<P, Q, R, S, T> &&
      other.hashCode == this.hashCode;
  @override
  int get hashCode => hash_finish(0);

  /// toString implementation for debugging purposes
  @override
  String toString() =>
      'i112ng2_state_lib_src_serialization_serializable_tuple5';
}
