// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// Generator: OpticsGenerator
// Target: abstract class SerializableTuple2
// **************************************************************************

import 'dart:collection';

import 'package:optics/optics.dart';

import 'serializable_tuple2.dart';
import 'serializable_tuple.g.dart';

export 'serializable_tuple2.dart';

/// All public properties for [SerializableTuple2]
abstract class SerializableTuple2Props<A, B> {
  static const String item1 = 'item1';

  static const String item2 = 'item2';
}

/// The immutable implementation of [SerializableTuple2]
class SerializableTuple2Immutable<A, B> extends SerializableTupleImmutable
    implements SerializableTuple2<A, B>, Comparable {
  @override
  final A item1;
  @override
  final B item2;
  const SerializableTuple2Immutable({this.item1, this.item2}) : super();

  factory SerializableTuple2Immutable.fromMap(Map<String, dynamic> source) {
    final A item1 = source['item1'];
    final B item2 = source['item2'];
    return new SerializableTuple2Immutable(item1: item1, item2: item2);
  }

  factory SerializableTuple2Immutable.fromLens(
      void predicate(
          SerializableTuple2Template<SerializableTuple2<A, B>, A,
              B> template)) {
    final SerializableTuple2Template<SerializableTuple2<A, B>, A, B> template =
        new SerializableTuple2Template<SerializableTuple2<A, B>, A, B>(null);
    predicate(template);
    return new SerializableTuple2Immutable.fromMap(template.mutations);
  }

  @override
  SerializableTuple2Immutable lens(
      void predicate(
          SerializableTuple2Template<SerializableTuple2<A, B>, A,
              B> template)) {
    final SerializableTuple2Template<SerializableTuple2<A, B>, A, B> template =
        new SerializableTuple2Template<SerializableTuple2<A, B>, A, B>(this);
    predicate(template);
    return new SerializableTuple2Immutable.fromMap(template.mutations);
  }

  @override
  Map<String, dynamic> toJson() => super.toJson()
    ..addAll(<String, dynamic>{'item1': this.item1, 'item2': this.item2});
  @override
  int compareTo(dynamic other) {
    if (other is SerializableTuple2 && super.compareTo(other) == 0) {
      return (compareObjects(item1, other?.item1) == 0 &&
              compareObjects(item2, other?.item2) == 0)
          ? 0
          : 1;
    }
    return -1;
  }
}

/// The mutable interface for [SerializableTuple2]
abstract class SerializableTuple2Mutable<A, B> extends SerializableTuple2<A, B>
    with SerializableTupleMutable, Comparable {
  @override
  A get item1;
  set item1(A value);

  @override
  B get item2;
  set item2(B value);
}

/// The template implementation of [SerializableTuple2Mutable]
class SerializableTuple2Template<T extends SerializableTuple2, A, B>
    extends SerializableTupleTemplate<T>
    implements SerializableTuple2Mutable<A, B>, Comparable {
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

  SerializableTuple2Template(T source) : super(source) {
    mutations['item1'] = source?.item1;
    mutations['item2'] = source?.item2;
  }

  @override
  Map<String, dynamic> toJson() => super.toJson()
    ..addAll(<String, dynamic>{
      'item1': mutations['item1'],
      'item2': mutations['item2']
    });
  @override
  int compareTo(dynamic other) => -1;
}
