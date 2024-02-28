import 'package:escritorio_jm/components/my_usuarios_dropdown.dart';
import 'package:escritorio_jm/models/tarefa.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../models/usuario.dart';

class CadastroTarefa extends StatefulWidget {
  @override
  State<CadastroTarefa> createState() => _cadastrotarefaState();
}

class _cadastrotarefaState extends State<CadastroTarefa> {
  bool _obrigatorio = false;
  bool _recorrente = false;
  final TextEditingController _dataInicioController = TextEditingController();
  final TextEditingController _dataFinalController = TextEditingController();
  late Tarefa status;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white.withOpacity(0),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height
          ),
          child: Container(
            padding: EdgeInsets.only(
              top: 0,
              left: 20,
              right: 20,
              bottom: 40,
            ),
            child: Column(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      new BoxShadow(
                        color: Colors.black12,
                        offset: new Offset(1, 2.0),
                        blurRadius: 5,
                        spreadRadius: 1,
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: 15,
                      right: 15,
                      top: 60,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Image.asset(
                          "assets/images/logo-jm-2023.png",
                          height: 100,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          // autofocus: true,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.0)),
                            labelText: "Nome da Tarefa",
                            prefixIcon: Icon(Icons.edit),
                            labelStyle: TextStyle(
                              //color: Colors,
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                            ),
                          ),
                          style: TextStyle(
                            fontSize: 20,
                            //color: Theme.of(context).primaryColor,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          // autofocus: true,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.0)),
                            labelText: "Destinatário",
                            prefixIcon: Icon(Icons.person),
                            labelStyle: TextStyle(
                              //color: Colors,
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                            ),
                          ),
                          style: TextStyle(
                            fontSize: 20,
                            //color: Theme.of(context).primaryColor,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          keyboardType: TextInputType.datetime,
                          controller: _dataInicioController,
                          decoration: InputDecoration(
                            labelText: 'Data Início',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.0)),
                            hintText: "Data Início",
                            prefixIcon: IconButton(
                              icon: const Icon(Icons.calendar_today),
                              onPressed: () async {
                                // Show date picker and wait for the selected date
                                final selectedDate = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(2000),
                                  lastDate: DateTime(2030),
                                  keyboardType: TextInputType.datetime,
                                  fieldLabelText: 'Data Início',
                                );

                                if (selectedDate != null) {
                                  // Update the text field with the selected date
                                  _dataInicioController.text =
                                      DateFormat('dd/MM/yyyy')
                                          .format(selectedDate);
                                }
                              },
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Por favor, insira a data de início do processo';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          keyboardType: TextInputType.datetime,
                          controller: _dataFinalController,
                          decoration: InputDecoration(
                            labelText: 'Data Final',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.0)),
                            hintText: "Data Final",
                            prefixIcon: IconButton(
                              icon: const Icon(Icons.calendar_today),
                              onPressed: () async {
                                // Show date picker and wait for the selected date
                                final selectedDate = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(2000),
                                  lastDate: DateTime(2030),
                                  keyboardType: TextInputType.datetime,
                                  fieldLabelText: 'Data Final',
                                );

                                if (selectedDate != null) {
                                  // Update the text field with the selected date
                                  _dataFinalController.text =
                                      DateFormat('dd/MM/yyyy')
                                          .format(selectedDate);
                                }
                              },
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Por favor, insira a data final do processo';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          // autofocus: true,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.0)),
                            labelText: "Explicação",
                            prefixIcon: Icon(Icons.manage_search_rounded),
                            labelStyle: TextStyle(
                              //color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                            ),
                          ),
                          style: TextStyle(
                            fontSize: 20,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              CheckboxMenuButton(value: _obrigatorio, onChanged: (value){
                                setState(() {
                                  _obrigatorio = value!;
                                });
                              }, child: Text("Obrigatório:"))
                              /*CheckboxListTile(
                                title: Text('Obrigatório:'),
                               // controlAffinity: ListTileControlAffinity.leading,
                                value: _obrigatorio,
                                onChanged: (value) {
                                  setState(() {
                                    _obrigatorio = value!;
                                  });
                                },
                              ),
                                CheckboxListTile(
                                  title: Text('Recorrente:'),
                                 // controlAffinity: ListTileControlAffinity.leading,
                                  value: _recorrente,
                                  onChanged: (value) {
                                    setState(() {
                                      _recorrente = value!;
                                    });
                                  },
                                ),

                               */

                            ]),
                        SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        TextButton(
                          onPressed: () {
                            // Navigator.push(
                            //   context,
                            //  MaterialPageRoute(
                            //    builder: (context) => HomeScreen()));
                          },
                          style: TextButton.styleFrom(
                            elevation: 0,
                            padding: EdgeInsets.symmetric(
                              horizontal: 180,
                              vertical: 20,
                            ),
                            textStyle: TextStyle(fontSize: 16),
                            backgroundColor: Colors.black,
                            side: BorderSide(style: BorderStyle.solid),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: Text(
                            'Cadastrar Tarefa',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
