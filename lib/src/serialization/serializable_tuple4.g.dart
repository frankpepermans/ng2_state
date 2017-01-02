// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// Generator: OpticsGenerator
// Target: abstract class SerializableTuple4
// **************************************************************************

import 'dart:collection';

import 'package:optics/optics.dart';

import 'serializable_tuple4.dart';
import 'serializable_tuple.g.dart';

export 'serializable_tuple4.dart';

/// All public properties for [SerializableTuple4]
abstract class SerializableTuple4Props<A, B, C, D> {
  static const String item1 = 'item1';

  static const String item2 = 'item2';

  static const String item3 = 'item3';

  static const String item4 = 'item4';
}

/// The immutable implementation of [SerializableTuple4]
class SerializableTuple4Immutable<A, B, C, D> extends SerializableTupleImmutable
    implements SerializableTuple4<A, B, C, D>, Comparable {
  @override
  final A item1;
  @override
  final B item2;
  @override
  final C item3;
  @override
  final D item4;
  const SerializableTuple4Immutable(
      {this.item1, this.item2, this.item3, this.item4})
      : super();

  factory SerializableTuple4Immutable.fromMap(Map<String, dynamic> source) {
    final A item1 = source['item1'];
    final B item2 = source['item2'];
    final C item3 = source['item3'];
    final D item4 = source['item4'];
    return new SerializableTuple4Immutable(
        item1: item1, item2: item2, item3: item3, item4: item4);
  }

  factory SerializableTuple4Immutable.fromLens(
      void predicate(
          SerializableTuple4Template<SerializableTuple4<A, B, C, D>, A, B, C,
              D> template)) {
    final SerializableTuple4Template<SerializableTuple4<A, B, C, D>, A, B, C, D>
        template = new SerializableTuple4Template<
            SerializableTuple4<A, B, C, D>, A, B, C, D>(null);
    predicate(template);
    return new SerializableTuple4Immutable.fromMap(template.mutations);
  }

  @override
  SerializableTuple4Immutable lens(
      void predicate(
          SerializableTuple4Template<SerializableTuple4<A, B, C, D>, A, B, C,
              D> template)) {
    final SerializableTuple4Template<SerializableTuple4<A, B, C, D>, A, B, C, D>
        template = new SerializableTuple4Template<
            SerializableTuple4<A, B, C, D>, A, B, C, D>(this);
    predicate(template);
    return new SerializableTuple4Immutable.fromMap(template.mutations);
  }

  @override
  Map<String, dynamic> toJson() => super.toJson()
    ..addAll(<String, dynamic>{
      'item1': this.item1,
      'item2': this.item2,
      'item3': this.item3,
      'item4': this.item4
    });
  @override
  int compareTo(dynamic other) {
    if (other is SerializableTuple4 && super.compareTo(other) == 0) {
      return (compareObjects(item1, other?.item1) == 0 &&
              compareObjects(item2, other?.item2) == 0 &&
              compareObjects(item3, other?.item3) == 0 &&
              compareObjects(item4, other?.item4) == 0)
          ? 0
          : 1;
    }
    return -1;
  }
}

/// The mutable interface for [SerializableTuple4]
abstract class SerializableTuple4Mutable<A, B, C, D>
    extends SerializableTuple4<A, B, C, D>
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
}

/// The template implementation of [SerializableTuple4Mutable]
class SerializableTuple4Template<T extends SerializableTuple4, A, B, C, D>
    extends SerializableTupleTemplate<T>
    implements SerializableTuple4Mutable<A, B, C, D>, Comparable {
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

  SerializableTuple4Template(T source) : super(source) {
    mutations['item1'] = source?.item1;
    mutations['item2'] = source?.item2;
    mutations['item3'] = source?.item3;
    mutations['item4'] = source?.item4;
  }

  @override
  Map<String, dynamic> toJson() => super.toJson()
    ..addAll(<String, dynamic>{
      'item1': mutations['item1'],
      'item2': mutations['item2'],
      'item3': mutations['item3'],
      'item4': mutations['item4']
    });
  @override
  int compareTo(dynamic other) => -1;
}
