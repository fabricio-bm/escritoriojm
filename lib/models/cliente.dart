import 'package:cloud_firestore/cloud_firestore.dart';
class Cliente {
  int codigo;
  String razaoSocial;
  String nomeFantasia;
  String telefone;
  String cnpj;
  String email;

  Cliente({
    required this.codigo,
    required this.nomeFantasia,
    required this.telefone,
    required this.cnpj,
    required this.email,
    required this.razaoSocial
  });

  @override
  toMap() {
    var map = new Map<String, dynamic>();
    map['razao'] = this.razaoSocial;
    map['fantasia'] = this.nomeFantasia;
    map['telefone'] = this.telefone;
    map['email'] = this.email;
    map['cnpj'] = this.cnpj;
    return map;
  }
}