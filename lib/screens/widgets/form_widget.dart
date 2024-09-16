

import 'package:flutter/material.dart';
import 'package:formulario_dynamico/screens/states/field_controller.dart';

class Field extends StatelessWidget {
  @override
  
  FieldController fieldController = FieldController([]);

  Field({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(  
          decoration: InputDecoration(                            
          hintText: '...',
          filled: true,
          border: OutlineInputBorder(     
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(24),
        ),
              prefixIcon: const Icon(Icons.key),
              suffixIcon: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.remove_circle),
              ),
        helperText: 'Digite algo...',
        icon: const Icon(Icons.sell)
          ),              
        ),
      ],
    );
  }
  _removingFields() {
    for (int i = 0; i < fieldController.value.length; i++) {
      fieldController.decrement(fieldController.value[i]);
    }
  } 
}
