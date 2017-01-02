// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// Generator: OpticsGenerator
// Target: abstract class StateContainer
// **************************************************************************

import 'dart:collection';

import 'package:optics/optics.dart';

import 'state_container.dart';

export 'state_container.dart';

/// All public properties for [StateContainer]
abstract class StateContainerProps {
  static const String group = 'group';

  static const String id = 'id';

  static const String stateParts = 'stateParts';
}

/// The immutable implementation of [StateContainer]
class StateContainerImmutable implements StateContainer, Comparable {
  @override
  final String group;
  @override
  final String id;
  @override
  final dynamic stateParts;
  const StateContainerImmutable({this.group, this.id, this.stateParts});

  factory StateContainerImmutable.fromMap(Map<String, dynamic> source) {
    final String group = source['group'];
    final String id = source['id'];
    final dynamic stateParts = source['stateParts'];
    return new StateContainerImmutable(
        group: group, id: id, stateParts: stateParts);
  }

  factory StateContainerImmutable.fromLens(
      void predicate(StateContainerTemplate<StateContainer> template)) {
    final StateContainerTemplate<StateContainer> template =
        new StateContainerTemplate<StateContainer>(null);
    predicate(template);
    return new StateContainerImmutable.fromMap(template.mutations);
  }

  StateContainerImmutable lens(
      void predicate(StateContainerTemplate<StateContainer> template)) {
    final StateContainerTemplate<StateContainer> template =
        new StateContainerTemplate<StateContainer>(this);
    predicate(template);
    return new StateContainerImmutable.fromMap(template.mutations);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'group': this.group,
        'id': this.id,
        'stateParts': this.stateParts
      };
  @override
  int compareTo(dynamic other) {
    if (other is StateContainer) {
      return (compareObjects(group, other?.group) == 0 &&
              compareObjects(id, other?.id) == 0 &&
              compareObjects(stateParts, other?.stateParts) == 0)
          ? 0
          : 1;
    }
    return -1;
  }
}

/// The mutable interface for [StateContainer]
abstract class StateContainerMutable extends StateContainer with Comparable {
  @override
  String get group;
  set group(String value);

  @override
  String get id;
  set id(String value);

  @override
  dynamic get stateParts;
  set stateParts(dynamic value);
}

/// The template implementation of [StateContainerMutable]
class StateContainerTemplate<T extends StateContainer>
    implements StateContainerMutable, Comparable {
  final T source;
  final Map<String, dynamic> mutations = <String, dynamic>{};

  @override
  String get group => mutations['group'];
  @override
  set group(String value) {
    mutations['group'] = value;
  }

  @override
  String get id => mutations['id'];
  @override
  set id(String value) {
    mutations['id'] = value;
  }

  @override
  dynamic get stateParts => mutations['stateParts'];
  @override
  set stateParts(dynamic value) {
    mutations['stateParts'] = value;
  }

  StateContainerTemplate(this.source) {
    mutations['group'] = source?.group;
    mutations['id'] = source?.id;
    mutations['stateParts'] = source?.stateParts;
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'group': mutations['group'],
        'id': mutations['id'],
        'stateParts': mutations['stateParts']
      };
  @override
  int compareTo(dynamic other) => -1;
}
