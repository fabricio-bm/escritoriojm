import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../components/my_textFormFieldFormaters.dart';
import '../../models/cliente.dart';

class CadastroCliente extends StatefulWidget {
  CadastroCliente(this.cliente);

  final Cliente cliente;

  @override
  State<CadastroCliente> createState() => _CadastroClienteState();
}

class _CadastroClienteState extends State<CadastroCliente> {
  late TextEditingController _razaoSocialController;
  late TextEditingController _cnpjController;
  late TextEditingController _nomeFantasiaController;
  late TextEditingController _emailController;
  late TextEditingController _telefoneSocialController;

  @override
  void initState() {
    _razaoSocialController =
        TextEditingController(text: widget.cliente.razaoSocial);
    _cnpjController = TextEditingController(text: widget.cliente.cnpj);
    _nomeFantasiaController =
        TextEditingController(text: widget.cliente.nomeFantasia);
    _telefoneSocialController =
        TextEditingController(text: widget.cliente.telefone);
    _emailController = TextEditingController(text: widget.cliente.email);
    super.initState();
  }

  @override
  void dispose() {
    _razaoSocialController.dispose();
    _cnpjController.dispose();
    _emailController.dispose();
    _telefoneSocialController.dispose();
    _nomeFantasiaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white.withOpacity(0),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(
            top: 0,
            left: 20,
            right: 20,
            bottom: 40,
          ),
          child: Column(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    new BoxShadow(
                      color: Colors.black12,
                      offset: new Offset(1, 2.0),
                      blurRadius: 5,
                      spreadRadius: 1,
                    ),
                  ],
                ),
                child: Padding(
                  padding: EdgeInsets.only(
                    left: 15,
                    right: 15,
                    top: 60,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Image.asset(
                        "assets/images/logo-jm-2023.png",
                        height: 100,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      MyTextFormField(controller: _razaoSocialController, icon:  Icon(Icons.broadcast_on_personal_rounded), label: "Razão Social"),
                      SizedBox(
                        height: 10,
                      ),
                      MyTextFormField(controller: _nomeFantasiaController, icon:  Icon(Icons.drive_file_rename_outline_rounded), label: "Nome Fantasia"),
                      SizedBox(
                        height: 10,
                      ),
                     MyTextFormFieldCNPJ(controller: _cnpjController),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}')),
                        ],
                        // autofocus: true,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12.0)),
                          labelText: "Email",
                          prefixIcon: Icon(Icons.email_outlined),
                          labelStyle: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                          ),
                        ),
                        style: TextStyle(
                          fontSize: 20,
                        ),
                        controller: _emailController,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      MyTextFormFieldPhone(
                          controller: _telefoneSocialController),
                      SizedBox(
                        height: 40,
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                          elevation: 0,
                          padding: EdgeInsets.symmetric(
                            horizontal: 180,
                            vertical: 20,
                          ),
                          textStyle: TextStyle(fontSize: 16),
                          backgroundColor: Colors.black,
                          side: BorderSide(style: BorderStyle.solid),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        onPressed: () {
                          Map<String, dynamic> novoCliente =
                              new Map<String, dynamic>();
                          novoCliente["razao"] = _razaoSocialController.text;
                          novoCliente["fantasia"] =
                              _nomeFantasiaController.text;
                          novoCliente["telefone"] =
                              _telefoneSocialController.text;
                          novoCliente["email"] = _emailController.text;
                          novoCliente["cnpj"] = _cnpjController.text;
                          FirebaseFirestore.instance
                              .collection("clientes")
                              .add(novoCliente)
                              .whenComplete(() => Navigator.of(context).pop());
                        },
                        child: Text(
                          'Confirmar Cadastro',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
