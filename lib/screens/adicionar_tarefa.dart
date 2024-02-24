import 'package:escritorio_jm/services/tarefa_services.dart';
import 'package:flutter/material.dart';
import '../helpers/weekday.dart';
import '../models/tarefa.dart';

class AdicionarTarefa extends StatefulWidget {
  final Tarefa tarefa;
  final bool isEditing;
  const AdicionarTarefa({
    Key? key,
    required this.tarefa,
    required this.isEditing,
  }) : super(key: key);

  @override
  State<AdicionarTarefa> createState() => _AdicionarTarefa();
}

class _AdicionarTarefa extends State<AdicionarTarefa> {
  TextEditingController tituloController = TextEditingController();

  @override
  void initState() {
    tituloController.text = widget.tarefa.titulo;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(WeekDay(widget.tarefa.dataInicio).toString()),
        actions: [
          IconButton(
            onPressed: () {
              registrarTarefa(context);
            },
            icon: const Icon(Icons.check),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: TextField(
          controller: tituloController,
          keyboardType: TextInputType.multiline,
          style: const TextStyle(fontSize: 24),
          expands: true,
          maxLines: null,
          minLines: null,
        ),
      ),
    );
  }

  registrarTarefa(BuildContext context) async {
    TarefaService tarefaService = TarefaService();
    widget.tarefa.titulo = tituloController.text;

    if (widget.isEditing) {
      tarefaService.edit(widget.tarefa.id, widget.tarefa).then((value) {
        if (value) {
          Navigator.pop(context, DisposeStatus.success);
        } else {
          Navigator.pop(context, DisposeStatus.error);
        }
      });
    } else {
      tarefaService.register(widget.tarefa).then((value) {
        if (value) {
          Navigator.pop(context, DisposeStatus.success);
        } else {
          Navigator.pop(context, DisposeStatus.error);
        }
      });
    }
  }
}

enum DisposeStatus { exit, error, success }