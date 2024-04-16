import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
class CnpjInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.length > 14) {
      return oldValue;
    }
    return newValue;
  }
}

class PhoneInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.length > 15) {
      return oldValue;
    }
    return newValue;
  }
}

class MyTextFormFieldPhone extends StatelessWidget {
    TextEditingController? controller;

    MyTextFormFieldPhone({
      required this.controller,
});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        LengthLimitingTextInputFormatter(15),
        PhoneInputFormatter()
      ],
      // autofocus: true,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0)),
        prefixIcon: Icon(Icons.phone_rounded),
        labelText: "Telefone",
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
      controller: controller,
    );
  }
}


class MyTextFormFieldCNPJ extends StatelessWidget {
  TextEditingController? controller;

  MyTextFormFieldCNPJ({
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return  TextFormField(
      // autofocus: true,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0)),
        labelText: "CNPJ",
        prefixIcon: Icon(Icons.insert_drive_file_rounded),
        labelStyle: TextStyle(
          //color: Colors,
          fontWeight: FontWeight.w400,
          fontSize: 16,
        ),
      ),
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        LengthLimitingTextInputFormatter(14),
        CnpjInputFormatter()
      ],
      style: TextStyle(
        fontSize: 20,
        //color: Theme.of(context).primaryColor,
      ),
      controller: controller,
    );
  }
}

class MyTextFormField extends StatelessWidget {
  TextEditingController? controller;
  Icon? icon;
  String? label;


  MyTextFormField({
    required this.controller,
    required this.icon,
    required this.label
  });

  @override
  Widget build(BuildContext context) {
    return  TextFormField(
      // autofocus: true,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0)),
        labelText: label,
        prefixIcon: icon,
        labelStyle: TextStyle(
          //color: Colors,
          fontWeight: FontWeight.w400,
          fontSize: 16,
        ),
      ),
      style: TextStyle(
        fontSize: 20,
        //color: Theme.of(context).primaryColor,
      ),
      controller: controller,
    );
  }
}