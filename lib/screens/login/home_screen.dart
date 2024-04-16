import 'package:escritorio_jm/screens/cliente/cadastro_cliente.dart';
import 'package:escritorio_jm/screens/cliente/consulta_cliente.dart';
import 'package:escritorio_jm/screens/processos/cadastro_processos.dart';
import 'package:escritorio_jm/screens/tarefa/cadastro_tarefa.dart';
import 'package:escritorio_jm/screens/user/cadastro_usuario.dart';
import 'package:escritorio_jm/servicos/autenticacao_servico.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../models/cliente.dart';

class HomeScreen extends StatelessWidget {
   HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: Home());
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeScreen();
}

class _HomeScreen extends State<Home> {
  var cliente = Cliente(codigo: 0, nomeFantasia: "", telefone: "", cnpj: "", email: "", razaoSocial: "");

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: MenuBar(
                children: <Widget>[
                  SubmenuButton(
                    menuChildren: <Widget>[
                      MenuItemButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (
                              context) => CadastroUsuario())
                          );
                        },
                        child: MenuAcceleratorLabel('&Cadastro'),
                        leadingIcon: Icon(Icons.person_add_alt_1_rounded),
                      ),
                      MenuItemButton(
                        onPressed: () {
                          //Navigator.push(context,MaterialPageRoute(builder: (context)=>ConsultaCliente()));
                        },
                        child: const MenuAcceleratorLabel('&Consulta'),
                        leadingIcon: Icon(Icons.groups_rounded),
                      ),
                    ],
                    child: const MenuAcceleratorLabel('&Usuário'),
                    leadingIcon: Icon(Icons.supervised_user_circle_rounded),
                  ),
                  SubmenuButton(
                    menuChildren: <Widget>[
                      MenuItemButton(
                        leadingIcon: Icon(Icons.person_add_alt_rounded),
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (
                              context) => CadastroCliente(cliente))
                          );
                        },
                        child: const MenuAcceleratorLabel('&Cadastro'),
                      ),
                      MenuItemButton(
                        leadingIcon: Icon(Icons.person_search_rounded),
                        onPressed: () {
                          Navigator.push(context,MaterialPageRoute(builder: (context)=>ConsultaCliente()));
                        },
                        child: const MenuAcceleratorLabel('Consulta'),
                      ),
                    ],
                    child: const MenuAcceleratorLabel('&Cliente'),
                    leadingIcon: Icon(Icons.person_2_rounded),
                  ),
                  SubmenuButton(
                    menuChildren: <Widget>[
                      MenuItemButton(
                        leadingIcon: Icon(Icons.add_task_rounded),
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (
                              context) => CadastroTarefa())
                          );
                        },
                        child: const MenuAcceleratorLabel('&Cadastro'),
                      ),
                      MenuItemButton(
                        leadingIcon: Icon(Icons.task),
                        onPressed: () {},
                        child: const MenuAcceleratorLabel('Consulta'),
                      ),
                    ],
                    child: const MenuAcceleratorLabel('&Tarefas'),
                    leadingIcon: Icon(Icons.task_rounded),
                  ),
                  SubmenuButton(
                    menuChildren: <Widget>[
                      MenuItemButton(
                        leadingIcon: Icon(Icons.library_add_rounded),
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (
                              context) => CadastroProcessos())
                          );
                        },
                        child: const MenuAcceleratorLabel('&Cadastro'),
                      ),
                      MenuItemButton(
                        leadingIcon: Icon(Icons.library_add_check_rounded),
                        onPressed: () {},
                        child: const MenuAcceleratorLabel('Consulta'),
                      ),
                    ],
                    child: const MenuAcceleratorLabel('&Processos'),
                    leadingIcon: Icon(Icons.article_rounded),
                  ),
                  MenuItemButton(
                    leadingIcon: Icon(Icons.exit_to_app_rounded),
                    onPressed: () {
                      AutenticacaoServico().deslogar();
                    }, child: Text("Deslogar"),

                  ),
                ],
              ),
            ),
          ],
        ),
        Expanded(
          child: Image.asset(
            "assets/images/logo-jm-2023.png", height: MediaQuery
              .of(context)
              .size
              .shortestSide * 0.5,
            width: MediaQuery
                .of(context)
                .size
                .shortestSide * 0.5,
          ),
        ),
      ]
    );
  }
}

class MenuAcceleratorApp extends StatelessWidget {
  const MenuAcceleratorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Shortcuts(
        shortcuts: <ShortcutActivator, Intent>{
          const SingleActivator(LogicalKeyboardKey.keyT, control: true):
          VoidCallbackIntent(() {
            debugDumpApp();
          }),
        },
        child: const Scaffold(body: SafeArea(child: Home())),
      ),
    );
  }
}
