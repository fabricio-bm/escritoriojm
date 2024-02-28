import 'package:mysql1/mysql1.dart';
import 'package:escritorio_jm/models/sql_conexao.dart';

import '../prefs/sql_conexao_preferences.dart';

class MySQLConexao {
  late MySqlConnection _mysqlConnection;

  Future<MySqlConnection> getConnection() async {
    var conPrefs = await SQLConexaoPreferences().getSQLConexao();

    checkSettingsOrThrowException(conPrefs);

    final settings = new ConnectionSettings(
        host: conPrefs.servidor,
        port: conPrefs.porta,
        user: conPrefs.usuario,
        password: conPrefs.senha,
        db: conPrefs.banco,
        timeout: const Duration(seconds: 7));

    if (_mysqlConnection == null) {
      _mysqlConnection = await MySqlConnection.connect(settings);
    }

    return _mysqlConnection;
  }

  void checkSettingsOrThrowException(SQLConexao conPrefs) {
    if (conPrefs.servidor == null) {
      throw Exception(
          'Servidor do banco de dados não informado, verifique as configurações!');
    }
    if (conPrefs.porta == null) {
      throw Exception(
          'Porta do banco de dados não informado, verifique as configurações!');
    }
    if (conPrefs.banco == null) {
      throw Exception(
          'Nome do banco de dados não informado, verifique as configurações!');
    }
    if (conPrefs.usuario == null) {
      throw Exception(
          'Usuário do banco de dados não informado, verifique as configurações!');
    }
  }

  Future<Results> execQuery(String sql, [List<Object>? values]) async {
    final conn = await getConnection();
    //await new Future.delayed(const Duration(seconds: 2));
    return conn.query(sql, values);
  }

  void close() async {
    _mysqlConnection.close();
  }
}