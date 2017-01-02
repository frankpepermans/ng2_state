// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// Generator: OpticsGenerator
// Target: abstract class SerializableTuple6
// **************************************************************************

import 'dart:collection';

import 'package:optics/optics.dart';

import 'serializable_tuple6.dart';
import 'serializable_tuple.g.dart';

export 'serializable_tuple6.dart';

/// All public properties for [SerializableTuple6]
abstract class SerializableTuple6Props<A, B, C, D, E, F> {
  static const String item1 = 'item1';

  static const String item2 = 'item2';

  static const String item3 = 'item3';

  static const String item4 = 'item4';

  static const String item5 = 'item5';

  static const String item6 = 'item6';
}

/// The immutable implementation of [SerializableTuple6]
class SerializableTuple6Immutable<A, B, C, D, E, F>
    extends SerializableTupleImmutable
    implements SerializableTuple6<A, B, C, D, E, F>, Comparable {
  @override
  final A item1;
  @override
  final B item2;
  @override
  final C item3;
  @override
  final D item4;
  @override
  final E item5;
  @override
  final F item6;
  const SerializableTuple6Immutable(
      {this.item1, this.item2, this.item3, this.item4, this.item5, this.item6})
      : super();

  factory SerializableTuple6Immutable.fromMap(Map<String, dynamic> source) {
    final A item1 = source['item1'];
    final B item2 = source['item2'];
    final C item3 = source['item3'];
    final D item4 = source['item4'];
    final E item5 = source['item5'];
    final F item6 = source['item6'];
    return new SerializableTuple6Immutable(
        item1: item1,
        item2: item2,
        item3: item3,
        item4: item4,
        item5: item5,
        item6: item6);
  }

  factory SerializableTuple6Immutable.fromLens(
      void predicate(
          SerializableTuple6Template<SerializableTuple6<A, B, C, D, E, F>, A, B,
              C, D, E, F> template)) {
    final SerializableTuple6Template<SerializableTuple6<A, B, C, D, E, F>, A, B,
            C, D, E, F> template =
        new SerializableTuple6Template<SerializableTuple6<A, B, C, D, E, F>, A,
            B, C, D, E, F>(null);
    predicate(template);
    return new SerializableTuple6Immutable.fromMap(template.mutations);
  }

  @override
  SerializableTuple6Immutable lens(
      void predicate(
          SerializableTuple6Template<SerializableTuple6<A, B, C, D, E, F>, A, B,
              C, D, E, F> template)) {
    final SerializableTuple6Template<SerializableTuple6<A, B, C, D, E, F>, A, B,
            C, D, E, F> template =
        new SerializableTuple6Template<SerializableTuple6<A, B, C, D, E, F>, A,
            B, C, D, E, F>(this);
    predicate(template);
    return new SerializableTuple6Immutable.fromMap(template.mutations);
  }

  @override
  Map<String, dynamic> toJson() => super.toJson()
    ..addAll(<String, dynamic>{
      'item1': this.item1,
      'item2': this.item2,
      'item3': this.item3,
      'item4': this.item4,
      'item5': this.item5,
      'item6': this.item6
    });
  @override
  int compareTo(dynamic other) {
    if (other is SerializableTuple6 && super.compareTo(other) == 0) {
      return (compareObjects(item1, other?.item1) == 0 &&
              compareObjects(item2, other?.item2) == 0 &&
              compareObjects(item3, other?.item3) == 0 &&
              compareObjects(item4, other?.item4) == 0 &&
              compareObjects(item5, other?.item5) == 0 &&
              compareObjects(item6, other?.item6) == 0)
          ? 0
          : 1;
    }
    return -1;
  }
}

/// The mutable interface for [SerializableTuple6]
abstract class SerializableTuple6Mutable<A, B, C, D, E, F>
    extends SerializableTuple6<A, B, C, D, E, F>
    with SerializableTupleMutable, Comparable {
  @override
  A get item1;
  set item1(A value);

  @override
  B get item2;
  set item2(B value);

  @override
  C get item3;
  set item3(C value);

  @override
  D get item4;
  set item4(D value);

  @override
  E get item5;
  set item5(E value);

  @override
  F get item6;
  set item6(F value);
}

/// The template implementation of [SerializableTuple6Mutable]
class SerializableTuple6Template<T extends SerializableTuple6, A, B, C, D, E, F>
    extends SerializableTupleTemplate<T>
    implements SerializableTuple6Mutable<A, B, C, D, E, F>, Comparable {
  @override
  A get item1 => mutations['item1'];
  @override
  set item1(A value) {
    mutations['item1'] = value;
  }

  @override
  B get item2 => mutations['item2'];
  @override
  set item2(B value) {
    mutations['item2'] = value;
  }

  @override
  C get item3 => mutations['item3'];
  @override
  set item3(C value) {
    mutations['item3'] = value;
  }

  @override
  D get item4 => mutations['item4'];
  @override
  set item4(D value) {
    mutations['item4'] = value;
  }

  @override
  E get item5 => mutations['item5'];
  @override
  set item5(E value) {
    mutations['item5'] = value;
  }

  @override
  F get item6 => mutations['item6'];
  @override
  set item6(F value) {
    mutations['item6'] = value;
  }

  SerializableTuple6Template(T source) : super(source) {
    mutations['item1'] = source?.item1;
    mutations['item2'] = source?.item2;
    mutations['item3'] = source?.item3;
    mutations['item4'] = source?.item4;
    mutations['item5'] = source?.item5;
    mutations['item6'] = source?.item6;
  }

  @override
  Map<String, dynamic> toJson() => super.toJson()
    ..addAll(<String, dynamic>{
      'item1': mutations['item1'],
      'item2': mutations['item2'],
      'item3': mutations['item3'],
      'item4': mutations['item4'],
      'item5': mutations['item5'],
      'item6': mutations['item6']
    });
  @override
  int compareTo(dynamic other) => -1;
}
