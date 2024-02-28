class Cliente {
  final int codigo;
  final String razaoSocial;
  final String nomeFantasia;
  final String telefone;
  final String cnpj;
  final String email;

  Cliente({
    required this.email,required this.codigo,required this.cnpj,required this.nomeFantasia,required this.razaoSocial,required this.telefone
  });

  @override
  String toString() {
    return 'Cliente{codigo: $codigo, nome: $nomeFantasia}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is Cliente &&
              runtimeType == other.runtimeType &&
              codigo == other.codigo;

  @override
  int get hashCode => codigo.hashCode;
}