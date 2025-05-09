import 'package:flutter/material.dart';
import 'package:formulario_dynamico/screens/models/field_model.dart';
import 'package:formulario_dynamico/screens/states/field_controller.dart';
import 'package:formulario_dynamico/screens/widgets/form_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //Instancia gerada do Gerenciador de Estado
  final fieldsController = FieldController();

  /* Esta funcao esta sendo usada para passar uma instancia unica da minha classe
  para a lista do ValueNotifier  */
  void addNewField() {
    fieldsController.addField(FieldModel(UniqueKey()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Formulário Dinâmico',
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
            onPressed: addNewField,
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
                /* cada vez que e criada uma instancia unica de field usando a key
                  o valueListenable junto ao listBuilder acaba retornando um novo campo
                  na tela  */
                  child: ValueListenableBuilder<List<FieldModel>>(
                    valueListenable: fieldsController,
                    builder: (_, fields, __) {
                      return ListView.builder(
                        itemCount: fields.length,
                        itemBuilder: (_, index) {
                          final field = fields[index];

                          return FieldWidget(
                            //Key que esta tornando cada campo unico junto a instancia  
                            key: field.key,
                            //field == value
                            field: field,
                            onRemove: (field) {
                              FocusManager.instance.primaryFocus?.unfocus();
                              fieldsController.removeField(field);
                            },
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
}
