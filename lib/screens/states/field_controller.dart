import 'package:flutter/material.dart';
import 'package:formulario_dynamico/screens/widgets/form_widget.dart';

class FieldController extends ValueNotifier<List<Field>> {


  FieldController(super.value);


  increment(Field field){
    value.add(field);
    print(value);
  }

  decrement(Field field) {
    if (value.isNotEmpty) 
    {
      value.removeAt(value.length-1);
      print(value);
    } else 
    { 
      print('Lista vazia');
    }
  }
}
