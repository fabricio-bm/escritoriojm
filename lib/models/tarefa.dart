import 'package:uuid/data.dart';
import 'package:uuid/uuid.dart';

class Tarefa {
  int id;
  String titulo;
  DateTime dataInicio;
  DateTime dataFinal;
  int userId;
  int realizadorId;
  String descricao;
  String status;
  bool obrigatorio;
  bool recorrente;

  //

  Tarefa({
    required this.id,
    required this.titulo,
    required this.dataInicio,
    required this.dataFinal,
    required this.userId,
    required this.realizadorId,
    required this.obrigatorio,
    required this.recorrente,
    required this.status,
    required this.descricao,
  });


  Tarefa.empty({required this.userId, required this.realizadorId})
        : id = 1,
        titulo = "",
        dataInicio = DateTime.now(),
        dataFinal = DateTime.now(),
        obrigatorio = false,
        recorrente = false,
        status = "",
        descricao = "";

  Tarefa.fromMap(Map<String, dynamic> map)
      : id = map['id'],
        titulo = map['titulo'],
        dataInicio = DateTime.parse(map['dataInicio']),
        dataFinal = DateTime.parse(map['dataFinal']),
        userId = int.parse(map['userId']),
        realizadorId = int.parse(map['realizadorId']),
        status = map['status'].toString(),
        descricao = map['descricao'].toString(),
        obrigatorio = bool.parse(map['obrigatorio']),
        recorrente = bool.parse(map['recorrente']);

  @override
  String toString() {
    return "titulo:$titulo\dataInicio:$dataInicio\dataFinal:$dataFinal\nuser_id:$userId\nrealizadorId:$realizadorId\nobrigatorio:$obrigatorio\nrecorrente:$recorrente\nstatus:$status\ndescricao:$descricao";
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'titulo': titulo,
      'dataInicio': dataInicio.toString(),
      'dataFinal': dataFinal.toString(),
      'userId': userId,
      'realizadorId': realizadorId,
      'obrigatorio': obrigatorio.toString(),
      'recorrente': recorrente.toString(),
      'status': status.toString(),
      'descricao': descricao.toString(),
    };
  }
}
