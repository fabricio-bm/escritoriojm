import 'package:escritorio_jm/components/my_button.dart';
import 'package:escritorio_jm/components/my_textForm.dart';
import 'package:flutter/material.dart';

class CadastroCliente extends StatelessWidget {
  final TextEditingController _razaoSocial = TextEditingController();
  final TextEditingController _cnpj = TextEditingController();
  final TextEditingController _fantasia = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _telefone = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white.withOpacity(0),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(
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
                  padding: const EdgeInsets.only(
                    left: 15,
                    right: 15,
                    top: 60,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Image.asset(
                        "assets/images/logo-jm-2023.png",height: 100,),
                      const SizedBox(height: 20,),
                       MyTextForm(TextInputType.text,false, title: "Razão Social", prefixicon: Icons.broadcast_on_personal_rounded, controller: _razaoSocial,),
                      const SizedBox(
                        height: 10,
                      ),
                       MyTextForm(TextInputType.text,false, title: "Nome Fantasia", prefixicon: Icons.add_home_work_outlined, controller: _fantasia,),
                      const SizedBox(
                        height: 10,
                      ),
                       MyTextForm(TextInputType.text,false, title: "CNPJ", prefixicon: Icons.insert_drive_file_outlined, controller: _cnpj,),
                      const SizedBox(
                        height: 10,
                      ),
                       MyTextForm(TextInputType.emailAddress, false, title: "E-mail", prefixicon: Icons.email_outlined, controller: _email,),
                      const SizedBox(
                        height: 10,
                      ),
                       MyTextForm(TextInputType.text,false, title: "Telefone", prefixicon: Icons.phone_outlined, controller: _telefone,),
                      const SizedBox(height: 40,),
                      MyButton((){}, "Cadastrar Cliente"
                          "")
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