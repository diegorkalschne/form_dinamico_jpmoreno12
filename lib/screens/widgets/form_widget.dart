// O widget Field
import 'package:flutter/material.dart';
import 'package:formulario_dynamico/screens/states/field_controller.dart';

class Field extends StatelessWidget {
  final int index;
  final FieldController fieldController;

  const Field({
    super.key,
    required this.index,
    required this.fieldController,
  });

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
              onPressed: _removingField,
              icon: const Icon(Icons.remove_circle),
            ),
            helperText: 'Digite algo...',
            icon: const Icon(Icons.sell),
          ),
        ),
      ],
    );
  }

  void _removingField() {
    fieldController.decrement(index);
  }
}
