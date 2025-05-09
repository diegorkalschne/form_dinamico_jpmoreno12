import 'package:flutter/material.dart';
import 'package:formulario_dynamico/screens/models/field_model.dart';

class FieldWidget extends StatefulWidget {
  //para esta classe ser instanciada os tais parametros sao obrigatorios
  const FieldWidget({
    required this.field,
    required this.onRemove,
    super.key,
  });

  //instancia criada para a classe FieldModel
  final FieldModel field;

  //funcao que sera usada para remover o meu campo
  final void Function(FieldModel)? onRemove;

  @override
  
  State<FieldWidget> createState() => _FieldWidgetState();
}

class _FieldWidgetState extends State<FieldWidget> {
  final controller = TextEditingController();

  @override
    /* Sobre o initState, ele 'e um inicializador, quando eu defino uma variavel fora dele,
      a partir do momento que ela atender uma certa condicao ela seria inicializada
      dentro do initState
   */
  void initState() {
    super.initState();

    /*  
      
      ELE E O METODO A SER UTILIZADO QUANDO FOR PRECISO INICIALIZAR UM NOVO WIDGET
      NA ARVORE DE WIDGETS E GERENCIAR SEU ESTADO, POIS ELE PRECISA TER UM VALOR/ESTADO INICIAL



    if invertido
  
    if widget.field.text == null{
    controller.text = " ";
    } else {
    controller.text = widget.field.text;
  }
  */

    controller.text = widget.field.text ?? '';
  }

  //=================================================================================================

  /* 
    ENTAO QUANDO EU TENHO UM INIT STATE COM UM VARIAVEL DO WIDGET DINAMICO OU ALGO 
    DO TIPO EU ESTOU DIZENDO QUE AQUELE WIDGET VAI TER TAL VALOR INICIAL E SER 
    GERENCIADO A PARTIR DAQUELE ESTADO INCIAL, E O DIPOSE IRA GARANTIR QUE QUANDO O
    WIDGET NAO ESTIVER SENDO USADO NA ARVORE ELE NAO IRA RECEBER NENHUM TIPO DADOS 
  
   */
  @override
  /* E O METODO QUE E CHAMADO QUANDO E PRECISO REMOVER UM WIDGET DA ARVORE DE WIDGETS PERMANENTEMENTE
      QUANDO UTILIZA-LO: UTILIZA-LO PARA QUE O WIDGET NAO CONTINUE RECEBENDO ATUALIZACOES QUANDO
      ELE NAO ESTIVER MAIS NA ARVORE  */

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
    //recebendo o textEditing controller que ira controllar o texto  
      controller: controller,
    //quando ele estiver em alteracao ira recebendo a String que esta dentro
    // do TextFormField
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
          /* Se o onRemove for == null ele retornara valor nullo
            senao ele ira retornar a funcao onRemove dentro do callback 
            garantindo que aquela funcao nao e nulla passando o field como parametro*/
          onPressed: widget.onRemove == null ? null : () => widget.onRemove!(widget.field),
          icon: const Icon(Icons.remove_circle),
        ),
        helperText: 'Digite algo...',
        icon: const Icon(Icons.sell),
      ),
    );
  }
}
