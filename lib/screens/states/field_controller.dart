import 'package:flutter/material.dart';
import 'package:formulario_dynamico/screens/widgets/form_widget.dart';

class FieldController extends ValueNotifier<List<Field>> {


  FieldController() : super([]);


  increment(Field field){
    value.add(field);
    notifyListeners();
  }

  decrement(int index) {
    if (index >=0 && index < value.length) { 
      value.removeAt(index);
      notifyListeners();
    }
  }
  
}
