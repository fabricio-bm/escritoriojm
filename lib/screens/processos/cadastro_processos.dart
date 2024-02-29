import 'package:escritorio_jm/components/my_button.dart';
import 'package:escritorio_jm/components/my_date.dart';
import 'package:escritorio_jm/components/my_textForm.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CadastroProcessos extends StatelessWidget {
  const CadastroProcessos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController _nome= TextEditingController();
    final TextEditingController _destinatario= TextEditingController();
    final TextEditingController _etapa= TextEditingController();
    final TextEditingController _dataInicioController = TextEditingController();
    final TextEditingController _dataFinalController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white.withOpacity(0),
        elevation: 0,
      ),
      body: SingleChildScrollView(
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
                      MyTextForm(TextInputType.text,false, title: "Nome do Processo", prefixicon: Icons.article_rounded, controller: _nome,),
                      SizedBox(
                        height: 10,
                      ),
                      MyTextForm(TextInputType.text,false, title: "Destinatário", prefixicon: Icons.person_search_rounded, controller: _destinatario,),
                      SizedBox(
                        height: 10,
                      ),
                      MyDate(titulo: 'Data Inicial', controller: _dataInicioController, prefixicon: Icons.calendar_today),
                      SizedBox(
                        height: 10,
                      ),
                      MyDate(titulo: 'Data Final', controller: _dataFinalController, prefixicon: Icons.calendar_today),
                      SizedBox(
                        height: 10,
                      ),
                      MyTextForm(TextInputType.text,false, title: "Etapa", prefixicon: Icons.edit_note_rounded, controller: _etapa, ),
                      SizedBox(
                        height: 20,
                      ),
                      //DropdownButton(items: items, onChanged: (){}),
                      SizedBox(
                        height: 40,
                      ),
                      MyButton((){}, "Cadastrar Processo")
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
