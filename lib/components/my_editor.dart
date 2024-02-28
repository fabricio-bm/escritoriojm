import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../res/my_colors.dart';

class MyEditor extends StatelessWidget {
  final TextEditingController controlador;
  final IconData prefixIcon;
  final String rotulo;
  final String dica;
  final bool enabled;
  final bool ocultarConteudo;
  final int maxLines;
  final bool numeric;
  final bool autoFocus;
  final Function onTap;

  MyEditor({
    required this.controlador,
    required this.prefixIcon,
    this.rotulo = "",
    this.dica = "",
    this.enabled = true,
    this.ocultarConteudo = false,
    this.maxLines=50,
    this.numeric = false,
    this.autoFocus = false,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: _getOnTapWidgetOrTextFieldOnly(),
    );
  }

  TextField _getTextField() {
    return TextField(
      autofocus: autoFocus,
      keyboardType: numeric ? TextInputType.number : TextInputType.multiline,
      inputFormatters: !numeric
          ? null
          : <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],

      // Only numbers can be entered
      controller: controlador,
      //style: TextStyle(fontSize: 16.0),
      decoration: InputDecoration(
        prefixIcon: prefixIcon != null
            ? Icon(
          prefixIcon,
          color: MyColors.accent,
        )
            : null,
       // suffixIcon: suffixIcon != null ? Icon(suffixIcon) : null,
        labelText: rotulo,
        hintText: dica,
        enabled: enabled,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: MyColors.accent),
          borderRadius: BorderRadius.all(
            Radius.circular(5.0),
          ),
        ),
      ),
      obscureText: ocultarConteudo,
      maxLines: ocultarConteudo ? 1 : maxLines,
    );
  }

  Widget _getOnTapWidgetOrTextFieldOnly() {
    if (onTap != null && !enabled) {
      return InkWell(
        onTap: onTap(),
        child: Container(
          color: Colors.transparent,
          child: _getTextField(),
        ),
      );
    }
    return _getTextField();
  }
}
