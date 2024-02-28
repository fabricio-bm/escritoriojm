import '../../models/cliente.dart';
import '../mysql_conexao.dart';

class ClientesDAO {
  final _sqlConnection = MySQLConexao();

  Future<List<Cliente>?> getClientesResumido() async {
    print('Executando query para buscar clientes...');
    String query = "SELECT *"
        "FROM clientes "
        "WHERE status = 'A' "
        "ORDER by nomeFantasia";
    var results;

    results = await _sqlConnection.execQuery(query);

    List<Cliente>? _clientes;
    for (var row in results) {
      _clientes!.add(
        Cliente(
          codigo: row['codigo'],
          nomeFantasia: row['nomeFantasia'],
          razaoSocial: row['razaoSocial'],
          cnpj: row['cnpj'],
          email: row['email'],
          telefone: row['telefone'],
        ),
      );
    }

    _sqlConnection.close();
    return _clientes;
  }

  Future<Cliente> getCliente(final String codigo) async {
    print('Executando query para busca cliente pelo código $codigo...');
    String query = "SELECT * "
        "FROM CLIENTES"
        "WHERE clicod = ? "
        "ORDER by clinom";
    var results;

    results = await _sqlConnection.execQuery(query, [codigo]);

    if (results.isEmpty) {
      throw Exception('Nenhum Cliente encontrado com o código $codigo!');
    }

    var row = results.last;

    Cliente _cliente = Cliente(
      codigo: row['codigo'],
      nomeFantasia: row['nomeFantasia'],
      razaoSocial: row['razaoSocial'],
      cnpj: row['cnpj'],
      telefone: row['telefone'],
      email: row['email'],
    );

    _sqlConnection.close();
    return _cliente;
  }
}
