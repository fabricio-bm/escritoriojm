const String kUsuarioStatusAtivo = "S";
const String kUsuarioStatusInativo = "I";
const String kUsuarioNivelAdm = "ADM";
const String kUsuarioNivelUsuario = "USU";

class Usuario {
  final int codigo;
  final String nome;
  final String senha;
  final String telefone;
  final String cargo;
  final String email;

  Usuario(this.codigo,
      this.nome,
      this.senha,
      this.telefone, this.cargo,
      this.email);


  @override
  String toString() {
    return 'Usuario{codigo: $codigo, nome: $nome, senha: $senha,telefone:$telefone,cargo:$cargo,email:$email}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is Usuario &&
              runtimeType == other.runtimeType &&
              codigo == other.codigo;

  @override
  int get hashCode => codigo.hashCode;


  bool ehAdm() {
    return cargo == kUsuarioNivelAdm;
  }

  bool ehUsuario() {
    return cargo == kUsuarioNivelUsuario;
  }



}