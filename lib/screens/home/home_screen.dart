import 'package:flutter/material.dart';
import 'package:formulario_dynamico/screens/states/field_controller.dart';
import 'package:formulario_dynamico/screens/widgets/form_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final FieldController fieldController = FieldController([]);

  Field fields = Field();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Formulario Dinamico',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.purple,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(70),
            bottomRight: Radius.circular(30),
          ),
        ),
        actions: [
          IconButton(
            onPressed: _addingFields,
            icon: const Icon(
              Icons.add_circle_rounded,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Container(
          child: Center(
            child: Column(
              children: [
                const Text(
                  'Forms',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                ),
                const SizedBox(
                  height: 15,
                ),
                Expanded(
                  child: Form(
                    child: ValueListenableBuilder(
                        valueListenable: fieldController,
                        builder: (context, value, child) {
                          return ListView.builder(
                            itemCount: fieldController.value.length,
                            itemBuilder: (context, index) => Field(),
                          );
                        }),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _addingFields() {
    fieldController.increment(fields);
    setState(() {});
  }


}
