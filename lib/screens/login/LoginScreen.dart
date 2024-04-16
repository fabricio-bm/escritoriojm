// ignore_for_file: use_build_context_synchronously

import 'dart:io';
import 'package:escritorio_jm/components/my_snackbar.dart';
import 'package:escritorio_jm/firebase_options.dart';
import 'package:escritorio_jm/screens/login/home_screen.dart';
import 'package:escritorio_jm/screens/user/cadastro_usuario.dart';
import 'package:escritorio_jm/servicos/autenticacao_servico.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../../components/dialog.dart';
import '../../models/usuario.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String get username => _emailController.text;
  String get senha => _senhaController.text;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(24),
          child: Container(
            //padding: const EdgeInsets.all(16),
            //margin: const EdgeInsets.all(32),
            decoration: BoxDecoration(
                border: Border.all(width: 8), color: Colors.white),
            child: Form(
              child: Center(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    maxHeight: 500,
                    maxWidth: 500,
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                         IconButton(
                          icon: Icon(Icons.bookmark, size: 64,),
                          color: Colors.greenAccent, onPressed: () {
                        }
                        ),
                        const Text(
                          "Escritório JM",
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        const Text("Por Agência Zanotto",
                            style: TextStyle(fontStyle: FontStyle.italic)),
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Divider(thickness: 2),
                        ),
                        TextButton(onPressed: () {
                          Navigator.push(context, MaterialPageRoute(
                              builder: (context) => CadastroUsuario()));
                        }, child: Text("Cadastre-se",
                          style: TextStyle(color: Colors.black),)),
                        SizedBox(
                          height: 50,
                          child: TextFormField(
                            controller: _emailController,
                            decoration: const InputDecoration(
                              icon: Icon(Icons.supervised_user_circle),
                              label: Text("E-Mail"),
                            ),
                            keyboardType: TextInputType.number,
                          ),
                        ),
                        SizedBox(
                          height: 100,
                          child: TextFormField(
                            controller: _senhaController,
                            decoration: const InputDecoration(
                                label: Text("Senha"),
                                icon: Icon(Icons.password_outlined)),
                            keyboardType: TextInputType.number,
                            maxLength: 16,
                          ),
                        ),
                        TextButton(
                          onPressed: ()  {
                             _entrar(context);
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
                            'Entrar',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        SizedBox(height: 20,),

                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );

  }
void _entrar(BuildContext context) async {
    String email = _emailController.text;
    String senha = _senhaController.text;
    AutenticacaoServico autenticacaoServico = new AutenticacaoServico();
    autenticacaoServico.logarUsuario(senha: senha, email: email).then((value) {
      if (value != null) {
        return mostrarSnackBar(context: context, texto: "E-mail ou senha incorreta",isErro: true);
      } else {
        Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
      }
    });
  }
}
