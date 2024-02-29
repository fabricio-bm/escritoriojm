// ignore_for_file: use_build_context_synchronously

import 'dart:io';
import 'package:escritorio_jm/firebase/meu_firebase.dart';
import 'package:escritorio_jm/prefs/usuario_preferences.dart';
import 'package:escritorio_jm/screens/configuracoes/configuracoes.dart';
import 'package:escritorio_jm/screens/home_screen.dart';
import 'package:escritorio_jm/screens/user/cadastro_usuario.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../models/usuario.dart';
import '../../ws/dao/usuario_dao.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isloading = false;

  _carregarCamposSalvos() async {
    final Usuario usuario = await UsuarioPreferences().getUsuario();
    _idController.text = usuario.codigo as String;
    _passwordController.text = usuario.senha;
  }

  void initState(){
    super.initState();
   // _checkFirebaseNotificationPermission();
    _carregarCamposSalvos();
  }
  //void _checkFirebaseNotificationPermission() {
    //MeuFirebaseMessagingService().requestNotificationPermission();
 // }
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
                            icon: Icon(
                              Icons.bookmark,
                              size: 64,
                            ),
                            color: Colors.greenAccent,
                            onPressed: () {
                              _abrirConfiguracoes();
                            }),
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
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => CadastroUsuario()));
                            },
                            child: Text(
                              "Cadastre-se",
                              style: TextStyle(color: Colors.black),
                            )),
                        SizedBox(
                          height: 50,
                          child: TextFormField(
                            controller: _idController,
                            decoration: const InputDecoration(
                              icon: Icon(Icons.supervised_user_circle),
                              label: Text("ID"),
                            ),
                            keyboardType: TextInputType.number,
                          ),
                        ),
                        SizedBox(
                          height: 100,
                          child: TextFormField(
                            controller: _passwordController,
                            decoration: const InputDecoration(
                                label: Text("Senha"),
                                icon: Icon(Icons.password_outlined)),
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
                        SizedBox(
                          height: 20,
                        ),
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
  void _entrar() async {
    _exibirLoading(true);
    final usuarioDao = UsuarioDAO();
    Usuario usuario;

    try {
      usuario = await usuarioDao.checkIfExists(
          _idController.text, _passwordController.text);

      await UsuarioPreferences().setUsuario(usuario);

      await Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) {
            return HomeScreen();
          }));
    } catch (e) {
      print(e);
    } finally {
      _exibirLoading(false);
    }
  }

  _exibirLoading(bool exibe){
    if(!mounted){
      return;
    }
    setState(() {
      _isloading=exibe;
    });
  }

  void _abrirConfiguracoes(){
    Navigator.push(context, MaterialPageRoute(builder: (context){
      return ConfiguracoesPage();
    }));
  }
}
