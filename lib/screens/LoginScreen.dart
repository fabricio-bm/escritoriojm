

import 'dart:io';

import 'package:escritorio_jm/screens/user/cadastro_usuario.dart';
import 'package:escritorio_jm/screens/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final TextEditingController _idController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();


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
                        const Icon(
                          Icons.bookmark,
                          size: 64,
                          color: Colors.greenAccent,
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
                            controller: _idController,
                            decoration:  InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12.0)),
                              prefixIcon: Icon(Icons.supervised_user_circle),
                              label: Text("ID"),
                            ),
                            keyboardType: TextInputType.number,
                          ),
                        ),
                        SizedBox(height: 30,),
                        SizedBox(
                          height: 100,
                          child: TextFormField(
                            controller: _passwordController,
                            decoration:  InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12.0)),
                                label: Text("Senha"),
                                prefixIcon: Icon(Icons.password_outlined)),
                            keyboardType: TextInputType.number,
                            maxLength: 16,
                            obscureText: true,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomeScreen()));
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



  void showExceptionDialog(BuildContext context, dynamic exception) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Erro'),
          content: Text('Ocorreu um erro: $exception'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  Future<void> showConfirmationDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirmação'),
          content: Text('Tem certeza que deseja continuar?'),
          actions: <Widget>[
            TextButton(
              child: Text('Cancelar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Sim'),
              onPressed: () {
                // Faça algo quando o usuário confirmar.
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
