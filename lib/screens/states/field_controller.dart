import 'package:flutter/material.dart';
import 'package:formulario_dynamico/screens/models/field_model.dart';

class FieldController extends ValueNotifier<List<FieldModel>> {
  FieldController() : super([]);

  // esta adicionando fields dentro da lista de fields
  void addField(FieldModel field) {
    value.add(field);
    notifyListeners();
  }

  //esta removendo fields de dentro da lista de fields
  void removeField(FieldModel field) {
    value.remove(field);
    notifyListeners();
  }
}
