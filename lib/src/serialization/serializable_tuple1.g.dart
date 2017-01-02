// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// Generator: OpticsGenerator
// Target: abstract class SerializableTuple1
// **************************************************************************

import 'dart:collection';

import 'package:optics/optics.dart';

import 'serializable_tuple1.dart';
import 'serializable_tuple.g.dart';

export 'serializable_tuple1.dart';

/// All public properties for [SerializableTuple1]
abstract class SerializableTuple1Props<A> {
  static const String item1 = 'item1';
}

/// The immutable implementation of [SerializableTuple1]
class SerializableTuple1Immutable<A> extends SerializableTupleImmutable
    implements SerializableTuple1<A>, Comparable {
  @override
  final A item1;
  const SerializableTuple1Immutable({this.item1}) : super();

  factory SerializableTuple1Immutable.fromMap(Map<String, dynamic> source) {
    final A item1 = source['item1'];
    return new SerializableTuple1Immutable(item1: item1);
  }

  factory SerializableTuple1Immutable.fromLens(
      void predicate(
          SerializableTuple1Template<SerializableTuple1<A>, A> template)) {
    final SerializableTuple1Template<SerializableTuple1<A>, A> template =
        new SerializableTuple1Template<SerializableTuple1<A>, A>(null);
    predicate(template);
    return new SerializableTuple1Immutable.fromMap(template.mutations);
  }

  @override
  SerializableTuple1Immutable lens(
      void predicate(
          SerializableTuple1Template<SerializableTuple1<A>, A> template)) {
    final SerializableTuple1Template<SerializableTuple1<A>, A> template =
        new SerializableTuple1Template<SerializableTuple1<A>, A>(this);
    predicate(template);
    return new SerializableTuple1Immutable.fromMap(template.mutations);
  }

  @override
  Map<String, dynamic> toJson() =>
      super.toJson()..addAll(<String, dynamic>{'item1': this.item1});
  @override
  int compareTo(dynamic other) {
    if (other is SerializableTuple1 && super.compareTo(other) == 0) {
      return (compareObjects(item1, other?.item1) == 0) ? 0 : 1;
    }
    return -1;
  }
}

/// The mutable interface for [SerializableTuple1]
abstract class SerializableTuple1Mutable<A> extends SerializableTuple1<A>
    with SerializableTupleMutable, Comparable {
  @override
  A get item1;
  set item1(A value);
}

/// The template implementation of [SerializableTuple1Mutable]
class SerializableTuple1Template<T extends SerializableTuple1, A>
    extends SerializableTupleTemplate<T>
    implements SerializableTuple1Mutable<A>, Comparable {
  @override
  A get item1 => mutations['item1'];
  @override
  set item1(A value) {
    mutations['item1'] = value;
  }

  SerializableTuple1Template(T source) : super(source) {
    mutations['item1'] = source?.item1;
  }

  @override
  Map<String, dynamic> toJson() =>
      super.toJson()..addAll(<String, dynamic>{'item1': mutations['item1']});
  @override
  int compareTo(dynamic other) => -1;
}
