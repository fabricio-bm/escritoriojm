import 'package:flutter/material.dart';

class CadastroUsuario extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //backgroundColor: Colors.white.withOpacity(0),
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
                      Image.asset("logo-jm-2023.png",height: 100,),
                      SizedBox(height: 20,),
                      TextFormField(
                        // autofocus: true,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12.0)),
                          labelText: "Nome",
                          prefixIcon: Icon(Icons.drive_file_rename_outline_rounded),
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
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        // autofocus: true,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12.0)),
                          labelText: "Email",
                          prefixIcon:Icon(Icons.email_outlined),
                          labelStyle: TextStyle(
                            //color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                          ),
                        ),
                        style: TextStyle(
                          fontSize: 20,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        // autofocus: true,
                        keyboardType: TextInputType.text,
                        obscureText: true,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12.0)),
                          labelText: "Password",
                          prefixIcon: Icon(Icons.password_outlined),
                          labelStyle: TextStyle(
                            //color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                          ),
                        ),
                        style: TextStyle(
                          fontSize: 20,
                          // color: Theme.of(context).primaryColor,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        // autofocus: true,
                        keyboardType: TextInputType.phone,
                        obscureText: true,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12.0)),
                          hintText: "(DDD)00000-0000",
                          prefixIcon: Icon(Icons.phone_outlined),
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
                      ),
                      SizedBox(height: 20,),
                      TextFormField(
                        // autofocus: true,
                        keyboardType: TextInputType.text,
                        obscureText: true,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12.0)),
                          prefixIcon: Icon(Icons.work_outlined),
                          labelText: "Cargo",
                          labelStyle: TextStyle(
                            //color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                          ),
                        ),
                        style: TextStyle(
                          fontSize: 20,
                          // color: Theme.of(context).primaryColor,
                        ),
                      ),
                      SizedBox(height: 20,),

                      TextButton(
                        onPressed: () {
                          // Navigator.push(
                          //   context,
                          //  MaterialPageRoute(
                          //    builder: (context) => HomeScreen()));
                        },
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