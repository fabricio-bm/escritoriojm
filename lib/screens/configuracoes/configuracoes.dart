import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../components/my_card_button.dart';
import '../../components/my_editor.dart';
import '../../models/sql_conexao.dart';
import '../../notifier/theme_notifier.dart';
import '../../prefs/sql_conexao_preferences.dart';
import '../../res/my_themes.dart';

class ConfiguracoesPage extends StatefulWidget {
  const ConfiguracoesPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return ConfiguracoesPageState();
  }
}

class ConfiguracoesPageState extends State<ConfiguracoesPage> {
  final TextEditingController _controllerServidor = TextEditingController();
  final TextEditingController _controllerPorta = TextEditingController();
  final TextEditingController _controllerBanco = TextEditingController();
  final TextEditingController _controllerUsuario = TextEditingController();
  final TextEditingController _controllerSenha = TextEditingController();
  var _darkTheme;

  _carregarCamposSalvos() async {
    final SQLConexao usuario = await SQLConexaoPreferences().getSQLConexao();
    _controllerServidor.text = usuario.servidor;
    _controllerPorta.text = usuario.porta.toString();
    _controllerBanco.text = usuario.banco;
    _controllerUsuario.text = usuario.usuario;
    _controllerSenha.text = usuario.senha;
  }

  @override
  Widget build(BuildContext context) {
    _carregarCamposSalvos();
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    _darkTheme = (themeNotifier.getTheme() == darkTheme);

    return Scaffold(
      appBar: AppBar(
        title: Text('Configurações'),
//        actions: <Widget>[
//          IconButton(
//            icon: Icon(Icons.settings),
//            onPressed: () {
//              _abrirConfiguracoes();
//            },
//          ),
//        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center, // add this
          children: <Widget>[
            MyEditor(
              controlador: _controllerServidor,
              prefixIcon: Icons.wifi_tethering,
              rotulo: 'Servidor', onTap: (){},
            ),
            MyEditor(
              controlador: _controllerPorta,
              prefixIcon: Icons.wifi_tethering,
              rotulo: 'Porta',
              numeric: true, onTap: (){},
            ),
            MyEditor(
              controlador: _controllerBanco,
              prefixIcon: Icons.wifi_tethering,
              rotulo: 'Banco',
              onTap: (){},
            ),
            MyEditor(
              controlador: _controllerUsuario,
              prefixIcon: Icons.person,
              rotulo: 'Usuário', onTap: (){},
            ),
            MyEditor(
              controlador: _controllerSenha,
              prefixIcon: Icons.vpn_key,
              rotulo: 'Senha',
              maxLines: 1,
              ocultarConteudo: true, onTap: (){},
            ),
            SwitchListTile(
              title: Text('Ativar Modo Escuro'),
              value: _darkTheme,
              onChanged: (val) {
                setState(() {
                  _darkTheme = val;
                });
                onThemeChanged(val, themeNotifier);
              },
            ),
           // MyCardButton(
             // onTap: () => _salvar(),
              //icon: Icons.check,
             // title: 'Salvar',
            //),
          ],
        ),
      ),
    );
  }

  void onThemeChanged(bool value, ThemeNotifier themeNotifier) async {
    (value)
        ? themeNotifier.setTheme(darkTheme)
        : themeNotifier.setTheme(lightTheme);
    var prefs = await SharedPreferences.getInstance();
    prefs.setBool('darkMode', value);
  }

  void _salvar() async {
    var prefs = SQLConexaoPreferences();
    var conexaoPrefs = SQLConexao(
        servidor: _controllerServidor.text,
        porta: int.parse(_controllerPorta.text),
        banco: _controllerBanco.text,
        usuario: _controllerUsuario.text,
        senha: _controllerSenha.text);

    prefs.setSQLConexao(conexaoPrefs);

    Navigator.pop(context);
  }
}