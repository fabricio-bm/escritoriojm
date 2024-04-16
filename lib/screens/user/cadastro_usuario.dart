import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:escritorio_jm/components/my_snackbar.dart';
import 'package:escritorio_jm/components/my_textFormFieldFormaters.dart';
import 'package:escritorio_jm/screens/login/LoginScreen.dart';
import 'package:escritorio_jm/servicos/autenticacao_servico.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class CadastroUsuario extends StatefulWidget {
  @override
  State<CadastroUsuario> createState() => _CadastroUsuarioState();
}

class _CadastroUsuarioState extends State<CadastroUsuario> {
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();
  final TextEditingController _telefoneController = TextEditingController();
  final TextEditingController _cargoController = TextEditingController();

  String get username => _emailController.text;

  String get senha => _senhaController.text;

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
                      Image.asset(
                        "assets/images/logo-jm-2023.png",
                        height: 100,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      MyTextFormField(
                          controller: _nomeController,
                          icon: Icon(Icons.edit_rounded),
                          label: "Nome"),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        // autofocus: true,
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12.0)),
                          labelText: "Email",
                          prefixIcon: Icon(Icons.email_outlined),
                          labelStyle: TextStyle(
                            //color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                          ),
                        ),
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        // autofocus: true,
                        controller: _senhaController,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12.0)),
                          labelText: "Senha",
                          prefixIcon: Icon(Icons.password_outlined),
                          labelStyle: TextStyle(
                            //color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                          ),
                        ),
                        style: TextStyle(
                          fontSize: 20,
                          // color: Theme.of(context).primaryColor,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      MyTextFormFieldPhone(controller: _telefoneController),
                      SizedBox(
                        height: 20,
                      ),
                      MyTextFormField(
                          controller: _cargoController,
                          icon: Icon(Icons.work_rounded),
                          label: "Cargo"),
                      SizedBox(
                        height: 20,
                      ),
                      TextButton(
                        onPressed: () {
                          _registrar(context);
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
                          'Confirmar Cadastro',
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
    );
  }

  void _registrar(BuildContext context) async {
    AutenticacaoServico autenticacaoServico = new AutenticacaoServico();
    autenticacaoServico
        .cadastrarUsuario(
          senha: senha,
          email: _emailController.text,
        )
        .then((value) => (String? erro) {
              if (erro != null) {
                mostrarSnackBar(
                    context: context,
                    texto: "Falha ao cadastrar o usuário",
                    isErro: true);
              } else {
                mostrarSnackBar(
                    context: context,
                    texto: "Cadastro Efetuado",
                    isErro: false);
                Map<String, dynamic> novoUsuario = new Map<String, dynamic>();
                novoUsuario["nome"] = _nomeController.text;
                novoUsuario["email"] = _emailController.text;
                novoUsuario["senha"] = _senhaController.text;
                novoUsuario["cargo"] = _cargoController.text;
                FirebaseFirestore.instance
                    .collection("usuario")
                    .add(novoUsuario)
                    .whenComplete(() => Navigator.of(context).pop());
              }
            });
  }
}
