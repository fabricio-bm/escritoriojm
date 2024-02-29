import 'package:escritorio_jm/components/my_button.dart';
import 'package:escritorio_jm/components/my_editor.dart';
import 'package:escritorio_jm/components/my_textForm.dart';
import 'package:flutter/material.dart';

class CadastroUsuario extends StatefulWidget {
  @override
  State<CadastroUsuario> createState() => _CadastroUsuarioState();
}

class _CadastroUsuarioState extends State<CadastroUsuario> {

  final TextEditingController nomeController = TextEditingController();
  final TextEditingController senhaController = TextEditingController();
  final TextEditingController telefoneController = TextEditingController();
  final TextEditingController cargoController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //backgroundColor: Colors.white.withOpacity(0),
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
                      Image.asset("assets/images/logo-jm-2023.png",height: 100,),
                      SizedBox(height: 20,),
                      MyTextForm(TextInputType.text,false, title: "Nome", prefixicon: Icons.drive_file_rename_outline_rounded, controller: nomeController),
                      SizedBox(
                        height: 10,
                      ),
                      MyTextForm(TextInputType.emailAddress,false, title: "E-mail", prefixicon: Icons.email_outlined, controller: emailController),
                      SizedBox(
                        height: 10,
                      ),
                      MyTextForm(TextInputType.text, true,title: "Senha", prefixicon: Icons.password_outlined, controller: senhaController,),
                      SizedBox(
                        height: 10,
                      ),
                      MyTextForm(TextInputType.phone, false, title: "Telefone", prefixicon: Icons.phone_outlined, controller: telefoneController,),
                      SizedBox(height: 20,),
                      MyTextForm(TextInputType.text,false, title: "Cargo", prefixicon: Icons.work_outlined, controller: cargoController,),
                      SizedBox(height: 20,),
                      MyButton((){}, 'Confirmar Cadastro')
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