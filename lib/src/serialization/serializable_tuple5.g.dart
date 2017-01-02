// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// Generator: OpticsGenerator
// Target: abstract class SerializableTuple5
// **************************************************************************

import 'dart:collection';

import 'package:optics/optics.dart';

import 'serializable_tuple5.dart';
import 'serializable_tuple.g.dart';

export 'serializable_tuple5.dart';

/// All public properties for [SerializableTuple5]
abstract class SerializableTuple5Props<A, B, C, D, E> {
  static const String item1 = 'item1';

  static const String item2 = 'item2';

  static const String item3 = 'item3';

  static const String item4 = 'item4';

  static const String item5 = 'item5';
}

/// The immutable implementation of [SerializableTuple5]
class SerializableTuple5Immutable<A, B, C, D, E>
    extends SerializableTupleImmutable
    implements SerializableTuple5<A, B, C, D, E>, Comparable {
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
  const SerializableTuple5Immutable(
      {this.item1, this.item2, this.item3, this.item4, this.item5})
      : super();

  factory SerializableTuple5Immutable.fromMap(Map<String, dynamic> source) {
    final A item1 = source['item1'];
    final B item2 = source['item2'];
    final C item3 = source['item3'];
    final D item4 = source['item4'];
    final E item5 = source['item5'];
    return new SerializableTuple5Immutable(
        item1: item1, item2: item2, item3: item3, item4: item4, item5: item5);
  }

  factory SerializableTuple5Immutable.fromLens(
      void predicate(
          SerializableTuple5Template<SerializableTuple5<A, B, C, D, E>, A, B, C,
              D, E> template)) {
    final SerializableTuple5Template<SerializableTuple5<A, B, C, D, E>, A, B, C,
            D, E> template =
        new SerializableTuple5Template<SerializableTuple5<A, B, C, D, E>, A, B,
            C, D, E>(null);
    predicate(template);
    return new SerializableTuple5Immutable.fromMap(template.mutations);
  }

  @override
  SerializableTuple5Immutable lens(
      void predicate(
          SerializableTuple5Template<SerializableTuple5<A, B, C, D, E>, A, B, C,
              D, E> template)) {
    final SerializableTuple5Template<SerializableTuple5<A, B, C, D, E>, A, B, C,
            D, E> template =
        new SerializableTuple5Template<SerializableTuple5<A, B, C, D, E>, A, B,
            C, D, E>(this);
    predicate(template);
    return new SerializableTuple5Immutable.fromMap(template.mutations);
  }

  @override
  Map<String, dynamic> toJson() => super.toJson()
    ..addAll(<String, dynamic>{
      'item1': this.item1,
      'item2': this.item2,
      'item3': this.item3,
      'item4': this.item4,
      'item5': this.item5
    });
  @override
  int compareTo(dynamic other) {
    if (other is SerializableTuple5 && super.compareTo(other) == 0) {
      return (compareObjects(item1, other?.item1) == 0 &&
              compareObjects(item2, other?.item2) == 0 &&
              compareObjects(item3, other?.item3) == 0 &&
              compareObjects(item4, other?.item4) == 0 &&
              compareObjects(item5, other?.item5) == 0)
          ? 0
          : 1;
    }
    return -1;
  }
}

/// The mutable interface for [SerializableTuple5]
abstract class SerializableTuple5Mutable<A, B, C, D, E>
    extends SerializableTuple5<A, B, C, D, E>
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
}

/// The template implementation of [SerializableTuple5Mutable]
class SerializableTuple5Template<T extends SerializableTuple5, A, B, C, D, E>
    extends SerializableTupleTemplate<T>
    implements SerializableTuple5Mutable<A, B, C, D, E>, Comparable {
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

  SerializableTuple5Template(T source) : super(source) {
    mutations['item1'] = source?.item1;
    mutations['item2'] = source?.item2;
    mutations['item3'] = source?.item3;
    mutations['item4'] = source?.item4;
    mutations['item5'] = source?.item5;
  }

  @override
  Map<String, dynamic> toJson() => super.toJson()
    ..addAll(<String, dynamic>{
      'item1': mutations['item1'],
      'item2': mutations['item2'],
      'item3': mutations['item3'],
      'item4': mutations['item4'],
      'item5': mutations['item5']
    });
  @override
  int compareTo(dynamic other) => -1;
}
