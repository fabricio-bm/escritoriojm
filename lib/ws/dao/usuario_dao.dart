import 'package:mysql1/mysql1.dart';

import '../../models/usuario.dart';
import '../mysql_conexao.dart';

class UsuarioDAO {
  final _sqlConnection = MySQLConexao();

  Future<Usuario> checkIfExists(
      String codigoUsuario, String senhaUsuario) async {
    String query = "SELECT *,"
        "FROM usuario "
        "WHERE codigo=?";

    Results results =
    await _sqlConnection.execQuery(query, [codigoUsuario]);

    if (results.isEmpty) {
      throw Exception('Nenhum Usuário encontrado para os dados informados!');
    }
    var row = results.last;
    final usuario = Usuario(
        row['codigo'], row['nome'], row['senha'], row['telefone'], row['cargo'], row['email']);

    //validar senha
    if (usuario.senha != senhaUsuario) {
      throw Exception('Senha inválida, verifique!');
    }
    return usuario;
  }

  Future<List<Usuario>> getUsuarios() async {
    String query = "SELECT *,"
        "FROM clientes"
        "WHERE status<>? "
        "ORDER BY nome";
    Results results =
    await _sqlConnection.execQuery(query, [kUsuarioStatusInativo]);

    if (results.isEmpty) {
      throw Exception('Nenhum Usuário encontrado!');
    }

    List<Usuario> usuarios = [];
    for (var row in results) {
      usuarios.add(Usuario(
          row['codigo'], row['nome'], row['senha'], row['telefone'],
          row['cargo'], row['email']));
    }
    _sqlConnection.close();
    return usuarios;
  }

}
