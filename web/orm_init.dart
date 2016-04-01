library orm_init;

import 'package:angular2/angular2.dart';

import 'package:ng2_form_components/ng2_form_components.dart';

import 'package:ng2_state/ng2_state.dart';

void ormInitialize() {
  try {
    ListItem.DO_SCAN();
    StateContainer.DO_SCAN();
    SerializableTuple2.DO_SCAN();
    SerializableTuple3.DO_SCAN();
    SerializableTuple4.DO_SCAN();
  } catch (error) {
    print('orm failed...');
  }
}