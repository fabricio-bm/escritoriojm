import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MyDate extends StatelessWidget {
  final TextEditingController controller;
  final String titulo;
  final IconData prefixicon;

  MyDate({super.key, required, required this.titulo, required this.controller, required this.prefixicon});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
    keyboardType: TextInputType.datetime,
    controller: controller,
    decoration: InputDecoration(
      labelText: titulo,
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0)),
      hintText: titulo,
      prefixIcon: IconButton(
        icon: Icon(prefixicon),
        onPressed: () async {
          // Show date picker and wait for the selected date
          final selectedDate = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2000),
            lastDate: DateTime(2030),
            keyboardType: TextInputType.datetime,
            fieldLabelText: titulo,
          );

          if (selectedDate != null) {
            // Update the text field with the selected date
            controller.text =
                DateFormat('dd/MM/yyyy')
                    .format(selectedDate);
          }
        },
      ),
    ),
    validator: (value) {
      if (value!.isEmpty) {
        return 'Por favor, insira a data do processo';
      }
      return null;
    },
    );
  }
}
