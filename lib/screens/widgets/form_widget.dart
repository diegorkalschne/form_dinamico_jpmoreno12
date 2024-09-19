import 'package:flutter/material.dart';
import 'package:formulario_dynamico/screens/models/field_model.dart';

class FieldWidget extends StatefulWidget {
  const FieldWidget({
    required this.field,
    required this.onRemove,
    super.key,
  });

  final FieldModel field;
  final void Function(FieldModel)? onRemove;

  @override
  State<FieldWidget> createState() => _FieldWidgetState();
}

class _FieldWidgetState extends State<FieldWidget> {
  final controller = TextEditingController();

  @override
  void initState() {
    super.initState();

    controller.text = widget.field.text ?? '';
  }

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onChanged: (text) {
        widget.field.text = text;
      },
      decoration: InputDecoration(
        hintText: '...',
        filled: true,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(24),
        ),
        prefixIcon: const Icon(Icons.key),
        suffixIcon: IconButton(
          onPressed: widget.onRemove == null ? null : () => widget.onRemove!(widget.field),
          icon: const Icon(Icons.remove_circle),
        ),
        helperText: 'Digite algo...',
        icon: const Icon(Icons.sell),
      ),
    );
  }
}
