import 'package:flutter/material.dart';

void exibirMensagem(BuildContext context, String titulo, String descricao) {
  // flutter defined function
  showDialog(
    context: context,
    builder: (BuildContext context) {
      // return object of type Dialog
      return AlertDialog(
        title: new Text(titulo),
        content: new Text(descricao),
        actions: <Widget>[
          // usually buttons at the bottom of the dialog
          new ElevatedButton(
            child: new Text("OK"),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
