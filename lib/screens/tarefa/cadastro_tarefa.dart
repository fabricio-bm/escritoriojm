import 'package:escritorio_jm/components/my_button.dart';
import 'package:escritorio_jm/components/my_card_button.dart';
import 'package:escritorio_jm/components/my_date.dart';
import 'package:escritorio_jm/components/my_textForm.dart';
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
  final TextEditingController _nome = TextEditingController();
  final TextEditingController _destinatario = TextEditingController();
  final TextEditingController _explicacao = TextEditingController();
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
                        MyTextForm(TextInputType.text,false, title: "Nome Da Tarefa", prefixicon: Icons.edit, controller: _nome,),
                        SizedBox(
                          height: 10,
                        ),
                        MyTextForm(TextInputType.text,false, title: "Destinatário", prefixicon: Icons.person, controller: _destinatario,),
                        SizedBox(
                          height: 10,
                        ),
                        MyDate(titulo: "Data Inicial", controller: _dataInicioController, prefixicon: Icons.calendar_today),
                        SizedBox(
                          height: 10,
                        ),
                        MyDate(titulo: "Data Final", controller: _dataFinalController, prefixicon: Icons.calendar_today),
                        SizedBox(
                          height: 10,
                        ),
                        MyTextForm(TextInputType.text, false,title: "Explicação", prefixicon: Icons.manage_search_rounded, controller: _explicacao,),
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
                              }, child: Text("Obrigatório")),
                              SizedBox(width: 20,),
                              CheckboxMenuButton(value: _recorrente, onChanged: (value){
                                setState(() {
                                  _recorrente = value!;
                                });
                              }, child: Text("Recorrente")),
                              SizedBox(width: 20,),

                            ]),
                        SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          height: 40,
                        ),
                          MyButton((){}, "Cadastrar Tarefa")
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
