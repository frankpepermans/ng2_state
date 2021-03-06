// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// Generator: CodeGenerator
// **************************************************************************

import 'package:dorm/dorm.dart';

import 'serializable_tuple6.dart' as sup;

class SerializableTuple6<O, P, Q, R, S, T> extends Entity
    with sup.SerializableTuple6<O, P, Q, R, S, T> {
  /// refClassName
  @override
  String get refClassName =>
      'i112ng2_state_lib_src_serialization_serializable_tuple6';

  /// Public properties
  /// item1
  static const String ITEM1 = 'item1';
  static const Symbol ITEM1_SYMBOL =
      #i112ng2_state_lib_src_serialization_serializable_tuple6_item1;

  final DormProxy<O> _item1 = new DormProxy<O>(ITEM1, ITEM1_SYMBOL);
  @override
  O get item1 => _item1.value;
  set item1(O value) {
    _item1.value = value;
  }

  /// item2
  static const String ITEM2 = 'item2';
  static const Symbol ITEM2_SYMBOL =
      #i112ng2_state_lib_src_serialization_serializable_tuple6_item2;

  final DormProxy<P> _item2 = new DormProxy<P>(ITEM2, ITEM2_SYMBOL);
  @override
  P get item2 => _item2.value;
  set item2(P value) {
    _item2.value = value;
  }

  /// item3
  static const String ITEM3 = 'item3';
  static const Symbol ITEM3_SYMBOL =
      #i112ng2_state_lib_src_serialization_serializable_tuple6_item3;

  final DormProxy<Q> _item3 = new DormProxy<Q>(ITEM3, ITEM3_SYMBOL);
  @override
  Q get item3 => _item3.value;
  set item3(Q value) {
    _item3.value = value;
  }

  /// item4
  static const String ITEM4 = 'item4';
  static const Symbol ITEM4_SYMBOL =
      #i112ng2_state_lib_src_serialization_serializable_tuple6_item4;

  final DormProxy<R> _item4 = new DormProxy<R>(ITEM4, ITEM4_SYMBOL);
  @override
  R get item4 => _item4.value;
  set item4(R value) {
    _item4.value = value;
  }

  /// item5
  static const String ITEM5 = 'item5';
  static const Symbol ITEM5_SYMBOL =
      #i112ng2_state_lib_src_serialization_serializable_tuple6_item5;

  final DormProxy<S> _item5 = new DormProxy<S>(ITEM5, ITEM5_SYMBOL);
  @override
  S get item5 => _item5.value;
  set item5(S value) {
    _item5.value = value;
  }

  /// item6
  static const String ITEM6 = 'item6';
  static const Symbol ITEM6_SYMBOL =
      #i112ng2_state_lib_src_serialization_serializable_tuple6_item6;

  final DormProxy<T> _item6 = new DormProxy<T>(ITEM6, ITEM6_SYMBOL);
  @override
  T get item6 => _item6.value;
  set item6(T value) {
    _item6.value = value;
  }

  /// DO_SCAN
  static void DO_SCAN<O, P, Q, R, S, T>([String _R, Entity _C()]) {
    _R ??= 'i112ng2_state_lib_src_serialization_serializable_tuple6';
    _C ??= () => new SerializableTuple6<O, P, Q, R, S, T>();
    Entity.DO_SCAN(_R, _C);
    Entity.ASSEMBLER.scan(_R, _C, const <PropertyData>[
      const PropertyData(
          symbol: SerializableTuple6.ITEM1_SYMBOL,
          name: 'item1',
          type: dynamic,
          metatags: const <dynamic>[]),
      const PropertyData(
          symbol: SerializableTuple6.ITEM2_SYMBOL,
          name: 'item2',
          type: dynamic,
          metatags: const <dynamic>[]),
      const PropertyData(
          symbol: SerializableTuple6.ITEM3_SYMBOL,
          name: 'item3',
          type: dynamic,
          metatags: const <dynamic>[]),
      const PropertyData(
          symbol: SerializableTuple6.ITEM4_SYMBOL,
          name: 'item4',
          type: dynamic,
          metatags: const <dynamic>[]),
      const PropertyData(
          symbol: SerializableTuple6.ITEM5_SYMBOL,
          name: 'item5',
          type: dynamic,
          metatags: const <dynamic>[]),
      const PropertyData(
          symbol: SerializableTuple6.ITEM6_SYMBOL,
          name: 'item6',
          type: dynamic,
          metatags: const <dynamic>[]),
    ]);
  }

  /// Constructor
  SerializableTuple6() {
    Entity.ASSEMBLER.registerProxies(this,
        <DormProxy<dynamic>>[_item1, _item2, _item3, _item4, _item5, _item6]);
  }

  /// Internal constructor
  static SerializableTuple6<O, P, Q, R, S, T> construct<O, P, Q, R, S, T>() =>
      new SerializableTuple6<O, P, Q, R, S, T>();

  /// withItem1
  SerializableTuple6<O, P, Q, R, S, T> withItem1(O value) =>
      duplicate(ignoredSymbols: const <Symbol>[SerializableTuple6.ITEM1_SYMBOL])
        ..item1 = value;

  /// withItem2
  SerializableTuple6<O, P, Q, R, S, T> withItem2(P value) =>
      duplicate(ignoredSymbols: const <Symbol>[SerializableTuple6.ITEM2_SYMBOL])
        ..item2 = value;

  /// withItem3
  SerializableTuple6<O, P, Q, R, S, T> withItem3(Q value) =>
      duplicate(ignoredSymbols: const <Symbol>[SerializableTuple6.ITEM3_SYMBOL])
        ..item3 = value;

  /// withItem4
  SerializableTuple6<O, P, Q, R, S, T> withItem4(R value) =>
      duplicate(ignoredSymbols: const <Symbol>[SerializableTuple6.ITEM4_SYMBOL])
        ..item4 = value;

  /// withItem5
  SerializableTuple6<O, P, Q, R, S, T> withItem5(S value) =>
      duplicate(ignoredSymbols: const <Symbol>[SerializableTuple6.ITEM5_SYMBOL])
        ..item5 = value;

  /// withItem6
  SerializableTuple6<O, P, Q, R, S, T> withItem6(T value) =>
      duplicate(ignoredSymbols: const <Symbol>[SerializableTuple6.ITEM6_SYMBOL])
        ..item6 = value;

  /// Duplicates the [SerializableTuple6] and any recursive entities to a new [SerializableTuple6]
  @override
  SerializableTuple6<O, P, Q, R, S, T> duplicate(
          {List<Symbol> ignoredSymbols}) =>
      super.duplicate(ignoredSymbols: ignoredSymbols)
          as SerializableTuple6<O, P, Q, R, S, T>;
  @override
  bool operator ==(Object other) =>
      other is SerializableTuple6<O, P, Q, R, S, T> &&
      other.hashCode == this.hashCode;
  @override
  int get hashCode => hash_finish(0);

  /// toString implementation for debugging purposes
  @override
  String toString() =>
      'i112ng2_state_lib_src_serialization_serializable_tuple6';
}
