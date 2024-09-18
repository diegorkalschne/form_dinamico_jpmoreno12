import 'package:flutter/material.dart';
import 'package:formulario_dynamico/screens/states/field_controller.dart';
import 'package:formulario_dynamico/screens/widgets/form_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final FieldController fieldController = FieldController();

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
            onPressed: _addingField,
            icon: const Icon(
              Icons.add_circle_rounded,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Center(
          child: Column(
            children: [
              const Text(
                'Forms',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
              const SizedBox(height: 15),
              Expanded(
                child: Form(
                  child: ValueListenableBuilder<List<Field>>(
                    valueListenable: fieldController,
                    builder: (context, listFields, child) {
                      return ListView.builder(
                        itemCount: listFields.length,
                        itemBuilder: (context, index) {  /*  como os field estao sendo passados usando o lenght,
                         pode gerar uma confusao entre o index e lenght,
                         entao a key garante uma identifiçao 
                         unica para cada item da lista baseado no index  */
                          return Field(
                            key: ValueKey(index), // GARANTE QUE CADA CAMPO TENHA UMA IDENTIFICAÇAO UNICA BASEADA NO INDEX
                            index: index,
                            fieldController: fieldController,
                          );
                        },
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _addingField() {
    // Passando o índice baseado na contagem atual de campos
    fieldController.increment(Field(index: fieldController.value.length, fieldController: fieldController));
  }
}
