import 'package:shared_preferences/shared_preferences.dart';
import 'package:escritorio_jm/models/sql_conexao.dart';

import '../models/sql_conexao.dart';

class SQLConexaoPreferences {
  static const KEY_SQL_SERVIDOR = 'sql_servidor';
  static const KEY_SQL_PORTA = 'sql_porta';
  static const KEY_SQL_BANCO = 'sql_banco';
  static const KEY_SQL_USUARIO = 'sql_usuario';
  static const KEY_SQL_SENHA = 'sql_senha';

  Future<SQLConexao> getSQLConexao() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    final conexao = SQLConexao(

      servidor: prefs.getString(KEY_SQL_SERVIDOR).toString(),
      porta: prefs.getInt(KEY_SQL_PORTA)!.toInt(),
      banco: prefs.getString(KEY_SQL_BANCO).toString(),
      usuario: prefs.getString(KEY_SQL_USUARIO).toString(),
      senha: prefs.getString(KEY_SQL_SENHA).toString(),
    );

    return conexao;
  }

  Future<bool> setSQLConexao(final SQLConexao conexao) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setString(KEY_SQL_SERVIDOR, conexao.servidor);
    prefs.setInt(KEY_SQL_PORTA, conexao.porta);
    prefs.setString(KEY_SQL_BANCO, conexao.banco);
    prefs.setString(KEY_SQL_USUARIO, conexao.usuario);
    prefs.setString(KEY_SQL_SENHA, conexao.senha);

    return true;
  }
}