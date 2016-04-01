// Copyright (c) 2016, <your name>. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'package:angular2/bootstrap.dart';

import 'package:angular2/angular2.dart';

import 'package:ng2_form_components/ng2_form_components.dart';

import 'package:ng2_state/ng2_state.dart';

import 'orm_init.dart';

void main() {
  ormInitialize();

  bootstrap(AppComponent, const [State]);
}

@Component(
    selector: 'my-app',
    templateUrl: 'app_component.html',
    directives: const [State, DropDown, AutoComplete]
)
class AppComponent {

  LabelHandler labelHandler = (String value) => value;
  List<ListItem<String>> dataProviderA;

  AppComponent() {
    ListItem<String> rootA = new ListItem<String>()
      ..data = 'root A'
      ..container = ''
      ..selectable = false;
    ListItem<String> rootB = new ListItem<String>()
      ..data = 'root B'
      ..container = ''
      ..selectable = false;
    ListItem<String> rootC = new ListItem<String>()
      ..data = 'root C'
      ..container = ''
      ..selectable = false;

    ListItem<String> level1A = new ListItem<String>()
      ..data = 'level 1 A'
      ..container = ''
      ..selectable = true;
    ListItem<String> level1B = new ListItem<String>()
      ..data = 'level 1 B'
      ..parent = rootA
      ..container = ''
      ..selectable = true;

    ListItem<String> level2A = new ListItem<String>()
      ..data = 'level 2 A'
      ..parent = level1A
      ..container = ''
      ..selectable = true;
    ListItem<String> level2B = new ListItem<String>()
      ..data = 'level 2 B'
      ..parent = level1A
      ..container = ''
      ..selectable = true;

    dataProviderA = new List<ListItem<String>>.unmodifiable(<ListItem<String>>[
      rootA,
      level1A,
      level2A, level2B,
      level1B,
      rootB, rootC
    ]);
  }

}
