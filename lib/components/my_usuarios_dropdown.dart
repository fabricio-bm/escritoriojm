import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/usuario.dart';
import '../res/my_colors.dart';
import '../ws/dao/usuario_dao.dart';
import 'dialog.dart';

class MyUsuariosDropdownPage extends StatefulWidget {
  final String hint;
  final IconData icon;
  final ValueChanged<Usuario> onUsuarioSelected;
  final Usuario initialValue;

  MyUsuariosDropdownPage(
  this.hint,this.icon,this.initialValue,
      {
    required this.onUsuarioSelected,
  });

  @override
  _MyUsuariosDropdownPageState createState() => _MyUsuariosDropdownPageState();
}

class _MyUsuariosDropdownPageState extends State<MyUsuariosDropdownPage> {
  late Future<List<Usuario>> _usuarios;
   late Usuario _usuarioSelecionado;

  @override
  void initState() {
    super.initState();
    _usuarios = _getUsuariosFuture();
    _usuarioSelecionado = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return _getLocalizacaoWidget();
  }

  Future<List<Usuario>> _getUsuariosFuture() async {
    var dao = UsuarioDAO();
//    var localizacao = (await UsuarioPreferences().getUsuario()).nome;
    try {
      return await dao.getUsuarios();
    } catch (e) {
      exibirMensagem(context, 'Erro', e.toString());
      return Future.error(e.toString());
    }
  }

  Widget _getLocalizacaoWidget() {
    return FutureBuilder(
        future: _usuarios,
        builder: (BuildContext context, AsyncSnapshot<List<Usuario>> snapshot) {
          if (snapshot.hasData) {
            return _exibirDropdownUsuarios(snapshot.data!);
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }

          return Center(child: CircularProgressIndicator());
        });
  }

  Widget _exibirDropdownUsuarios(List<Usuario> usuarios) {
    return Padding(
      padding: const EdgeInsets.only(left: 24, top: 8, right: 8, bottom: 8),
      child: Row(
        children: <Widget>[
          Icon(
            widget.icon,
            color: MyColors.accent,
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(left: 16, right: 8),
              child: DropdownButton<Usuario>(
                hint: Text(widget.hint),
                icon: Icon(Icons.keyboard_arrow_down, color: MyColors.grey),
                isExpanded: true,
                value: _usuarioSelecionado,
                items: usuarios.map((Usuario value) {
                  return new DropdownMenuItem<Usuario>(
                    value: value,
                    child: new Text(value.nome),
                  );
                }).toList(),
                onChanged: (newValue) {
                  this.setState(() {
                    _usuarioSelecionado = newValue!;
                  });
                  widget.onUsuarioSelected(newValue!);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
