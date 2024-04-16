import 'package:flutter/material.dart';

class MyTextForm extends StatelessWidget {
  final String title;
  final IconData prefixicon;
  final bool esconder;
  final TextInputType tipoTeclado;
  final TextEditingController controller;

 const MyTextForm(
     this.tipoTeclado, this.esconder,
     {super.key, required this.title, required this.prefixicon, required this.controller,}
     );
  @override
  Widget build(BuildContext context) {
    return
      TextFormField(
        controller: controller,
        keyboardType: tipoTeclado,
        obscureText: esconder,
        decoration: InputDecoration(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0)),
          prefixIcon: Icon(prefixicon),
          labelText: title,
          labelStyle: TextStyle(
            // color: Theme.of(context).primaryColor,
            fontWeight: FontWeight.w400,
            fontSize: 16,
          ),
        ),
        style: TextStyle(
          fontSize: 20,
          // color: Theme.of(context).primaryColor,
        ),
      );
  }
}
