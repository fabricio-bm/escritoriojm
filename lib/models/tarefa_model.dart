import 'dart:ffi';

import 'package:escritorio_jm/models/tarefa.dart';
import 'package:flutter/material.dart';

class TarefaProvider with ChangeNotifier {
  final List<Tarefa> _tarefa = [];

  List<Tarefa> get tarefas => tarefas;

  int get tarefaCount => _tarefa.length;

  void addItem(String titulo, String descricao, DateTime dataFinal, DateTime dataInicio, bool obrigatorio, int realizadorId, bool recorrente, String status, int userId ) {
    final int id = tarefaCount + 1;
    _tarefa.add(Tarefa(id: id, titulo: titulo, descricao: descricao, dataFinal: dataFinal, dataInicio: dataInicio, obrigatorio: obrigatorio, realizadorId: realizadorId, recorrente: recorrente, status: status, userId: userId));
    notifyListeners();
  }

  void updateItem(int id, String newName) {
    final Tarefa tarefa = _tarefa.firstWhere((tarefa) =>tarefa.id == id);
    tarefa.titulo = newName;
    notifyListeners();
  }

  void deleteItem(int id) {
    _tarefa.removeWhere((tarefa) => tarefa.id == id);
    notifyListeners();
  }
}