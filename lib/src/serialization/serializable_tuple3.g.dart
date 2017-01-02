// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// Generator: OpticsGenerator
// Target: abstract class SerializableTuple3
// **************************************************************************

import 'dart:collection';

import 'package:optics/optics.dart';

import 'serializable_tuple3.dart';
import 'serializable_tuple.g.dart';

export 'serializable_tuple3.dart';

/// All public properties for [SerializableTuple3]
abstract class SerializableTuple3Props<A, B, C> {
  static const String item1 = 'item1';

  static const String item2 = 'item2';

  static const String item3 = 'item3';
}

/// The immutable implementation of [SerializableTuple3]
class SerializableTuple3Immutable<A, B, C> extends SerializableTupleImmutable
    implements SerializableTuple3<A, B, C>, Comparable {
  @override
  final A item1;
  @override
  final B item2;
  @override
  final C item3;
  const SerializableTuple3Immutable({this.item1, this.item2, this.item3})
      : super();

  factory SerializableTuple3Immutable.fromMap(Map<String, dynamic> source) {
    final A item1 = source['item1'];
    final B item2 = source['item2'];
    final C item3 = source['item3'];
    return new SerializableTuple3Immutable(
        item1: item1, item2: item2, item3: item3);
  }

  factory SerializableTuple3Immutable.fromLens(
      void predicate(
          SerializableTuple3Template<SerializableTuple3<A, B, C>, A, B,
              C> template)) {
    final SerializableTuple3Template<SerializableTuple3<A, B, C>, A, B, C>
        template =
        new SerializableTuple3Template<SerializableTuple3<A, B, C>, A, B, C>(
            null);
    predicate(template);
    return new SerializableTuple3Immutable.fromMap(template.mutations);
  }

  @override
  SerializableTuple3Immutable lens(
      void predicate(
          SerializableTuple3Template<SerializableTuple3<A, B, C>, A, B,
              C> template)) {
    final SerializableTuple3Template<SerializableTuple3<A, B, C>, A, B, C>
        template =
        new SerializableTuple3Template<SerializableTuple3<A, B, C>, A, B, C>(
            this);
    predicate(template);
    return new SerializableTuple3Immutable.fromMap(template.mutations);
  }

  @override
  Map<String, dynamic> toJson() => super.toJson()
    ..addAll(<String, dynamic>{
      'item1': this.item1,
      'item2': this.item2,
      'item3': this.item3
    });
  @override
  int compareTo(dynamic other) {
    if (other is SerializableTuple3 && super.compareTo(other) == 0) {
      return (compareObjects(item1, other?.item1) == 0 &&
              compareObjects(item2, other?.item2) == 0 &&
              compareObjects(item3, other?.item3) == 0)
          ? 0
          : 1;
    }
    return -1;
  }
}

/// The mutable interface for [SerializableTuple3]
abstract class SerializableTuple3Mutable<A, B, C>
    extends SerializableTuple3<A, B, C>
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
}

/// The template implementation of [SerializableTuple3Mutable]
class SerializableTuple3Template<T extends SerializableTuple3, A, B, C>
    extends SerializableTupleTemplate<T>
    implements SerializableTuple3Mutable<A, B, C>, Comparable {
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

  SerializableTuple3Template(T source) : super(source) {
    mutations['item1'] = source?.item1;
    mutations['item2'] = source?.item2;
    mutations['item3'] = source?.item3;
  }

  @override
  Map<String, dynamic> toJson() => super.toJson()
    ..addAll(<String, dynamic>{
      'item1': mutations['item1'],
      'item2': mutations['item2'],
      'item3': mutations['item3']
    });
  @override
  int compareTo(dynamic other) => -1;
}
