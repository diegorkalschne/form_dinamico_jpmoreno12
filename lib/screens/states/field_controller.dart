import 'package:flutter/material.dart';
import 'package:formulario_dynamico/screens/models/field_model.dart';

class FieldController extends ValueNotifier<List<FieldModel>> {
  FieldController() : super([]);

  void addField(FieldModel field) {
    value.add(field);
    notifyListeners();
  }

  void removeField(FieldModel field) {
    value.remove(field);
    notifyListeners();
  }
}
