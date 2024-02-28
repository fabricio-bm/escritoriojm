class SQLConexao {
  final String servidor;
  final int porta;
  final String banco;
  final String usuario;
  final String senha;

  SQLConexao({required this.servidor, required this.porta, required this.banco, required this.usuario, required this.senha});
}