import 'package:escritorio_jm/screens/cadastro.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Cadastro())
                          );
                        },
                        child:  MenuAcceleratorLabel('&Cadastro'),
                        leadingIcon: Icon(Icons.person_add_alt_1_rounded),
                      ),
                      MenuItemButton(
                        onPressed: () {
                          //Navigator.push(context,MaterialPageRoute(builder: (context)=>ListagemUsuario()));
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

                        },
                        child: const MenuAcceleratorLabel('&Cadastro'),
                      ),
                      MenuItemButton(
                        leadingIcon: Icon(Icons.person_search_rounded),
                        onPressed: () {
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

                        },
                        child: const MenuAcceleratorLabel('&Cadastro'),
                      ),
                      MenuItemButton(
                        leadingIcon: Icon(Icons.task),
                        onPressed: () {
                        },
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

                        },
                        child: const MenuAcceleratorLabel('&Cadastro'),
                      ),
                      MenuItemButton(
                        leadingIcon: Icon(Icons.library_add_check_rounded),
                        onPressed: () {
                        },
                        child: const MenuAcceleratorLabel('Consulta'),
                      ),
                    ],
                    child: const MenuAcceleratorLabel('&Processos'),
                    leadingIcon: Icon(Icons.article_rounded),
                  ),
                ],
              ),
            ),
          ],
        ),
        Expanded(
          child: Image.asset(
            "logo-jm-2023.png",height: MediaQuery.of(context).size.shortestSide*0.5,
            width: MediaQuery.of(context).size.shortestSide * 0.5,
          ),
        ),
      ],
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
        child: const Scaffold(body: SafeArea(child: HomeScreen())),
      ),
    );
  }
}
