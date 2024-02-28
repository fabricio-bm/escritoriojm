import 'package:shared_preferences/shared_preferences.dart';

import '../models/usuario.dart';

class UsuarioPreferences {
  static const KEY_USUARIO_CODIGO = 'usuario_codigo';
  static const KEY_USUARIO_NOME = 'usuario_nome';
  static const KEY_USUARIO_SENHA = 'usuario_senha';
  static const KEY_USUARIO_NIVEL = 'usuario_cargo';
  static const KEY_USUARIO_TELEFONE = 'usuario_telefone';
  static const KEY_USUARIO_EMAIL= 'usuario_email';

  Future<Usuario> getUsuario() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    final usuario = Usuario(
      prefs.getInt(KEY_USUARIO_CODIGO)!.toInt(),
      prefs.getString(KEY_USUARIO_NOME).toString(),
      prefs.getString(KEY_USUARIO_SENHA).toString(),
      prefs.getString(KEY_USUARIO_NIVEL).toString(),
      prefs.getString(KEY_USUARIO_TELEFONE).toString(),
      prefs.getString(KEY_USUARIO_EMAIL).toString()
    );

    return usuario;
  }

  Future<bool> setUsuario(final Usuario usuario) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt(KEY_USUARIO_CODIGO, usuario.codigo);
    prefs.setString(KEY_USUARIO_NOME, usuario.nome);
    prefs.setString(KEY_USUARIO_SENHA, usuario.senha);
    prefs.setString(KEY_USUARIO_NIVEL, usuario.cargo);
    prefs.setString(KEY_USUARIO_EMAIL, usuario.email);
    prefs.setString(KEY_USUARIO_TELEFONE, usuario.telefone);

    return true;
  }

}