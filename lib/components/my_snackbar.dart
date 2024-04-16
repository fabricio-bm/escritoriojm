import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

mostrarSnackBar(
    {required BuildContext context,
    required String texto,
    bool isErro = true}) {
  SnackBar snackBar = SnackBar(
    content: Text(texto),
    backgroundColor: (isErro) ? Colors.red : Colors.green,
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
      top: Radius.circular(16),
    )),
    duration: Duration(seconds: 4),
    //action: SnackBarAction(
     // label: "OK",
      //textColor: Colors.white,
     // onPressed: () {
      //  ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
      //},
    );
  //);
ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
