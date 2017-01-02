// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// Generator: OpticsGenerator
// Target: abstract class SerializableTuple
// **************************************************************************

import 'dart:collection';

import 'package:optics/optics.dart';

import 'serializable_tuple.dart';

export 'serializable_tuple.dart';

/// All public properties for [SerializableTuple]
abstract class SerializableTupleProps {}

/// The immutable implementation of [SerializableTuple]
class SerializableTupleImmutable implements SerializableTuple, Comparable {
  const SerializableTupleImmutable();

  factory SerializableTupleImmutable.fromMap(Map<String, dynamic> source) {
    ;
    return new SerializableTupleImmutable();
  }

  factory SerializableTupleImmutable.fromLens(
      void predicate(SerializableTupleTemplate<SerializableTuple> template)) {
    final SerializableTupleTemplate<SerializableTuple> template =
        new SerializableTupleTemplate<SerializableTuple>(null);
    predicate(template);
    return new SerializableTupleImmutable.fromMap(template.mutations);
  }

  SerializableTupleImmutable lens(
      void predicate(SerializableTupleTemplate<SerializableTuple> template)) {
    final SerializableTupleTemplate<SerializableTuple> template =
        new SerializableTupleTemplate<SerializableTuple>(this);
    predicate(template);
    return new SerializableTupleImmutable.fromMap(template.mutations);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{};
  @override
  int compareTo(dynamic other) => 0;
}

/// The mutable interface for [SerializableTuple]
abstract class SerializableTupleMutable extends SerializableTuple
    with Comparable {}

/// The template implementation of [SerializableTupleMutable]
class SerializableTupleTemplate<T extends SerializableTuple>
    implements SerializableTupleMutable, Comparable {
  final T source;
  final Map<String, dynamic> mutations = <String, dynamic>{};

  SerializableTupleTemplate(this.source) {
    ;
  }

  Map<String, dynamic> toJson() => <String, dynamic>{};
  @override
  int compareTo(dynamic other) => -1;
}
