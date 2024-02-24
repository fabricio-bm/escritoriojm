import 'package:escritorio_jm/screens/cadastro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class Login_Screen extends StatelessWidget {
  const Login_Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(24),
            child: Center(
                child: ConstrainedBox(
              constraints: BoxConstraints(
                maxHeight: 500,
                maxWidth: 500,
              ),
              child: Container(
                width: double.infinity,
                height: 410,
                padding: EdgeInsets.all(48),
                decoration: BoxDecoration(
                  color: Color(0xffD9D9D9),
                  borderRadius: BorderRadius.all(Radius.circular(24)),
                ),
                child: Column(children: [
                  Text(
                    'Login',
                    style: GoogleFonts.inter(
                      color: Color(0xff212121),
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20),
                  TextField(
                    style: GoogleFonts.inter(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 14,
                          vertical: 12,
                        ),
                        hintText: 'ID',
                        filled: true,
                        fillColor: Color(0xff818181),
                        hintStyle: TextStyle(
                          color: Colors.black.withOpacity(0.5),
                        )),
                  ),
                  SizedBox(height: 20),
                  TextField(
                    style: GoogleFonts.inter(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 14,
                          vertical: 12,
                        ),
                        hintText: 'Senha',
                        filled: true,
                        fillColor: Color(0xff818181),
                        hintStyle: TextStyle(
                          color: Colors.black.withOpacity(0.5),
                        )),
                  ),
                  SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    child: TextButton(
                      onPressed: () {
                        Navigator.pop(context, 'loginscreen');
                      },
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.symmetric(
                          horizontal: 30,
                          vertical: 25,
                        ),
                        textStyle: TextStyle(fontSize: 16),
                        backgroundColor: Colors.blueAccent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),

                      ),
                      child: Text(
                        'Entrar',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  SizedBox(height: 25),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Esqueceu sua senha?',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 12, color: Colors.black),
                      ),
                      Text(
                        ' Clique para suporte.',
                        textAlign: TextAlign.center,
                        style:
                            TextStyle(fontSize: 12, color: Colors.blueAccent),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                          onPressed: () {
                            Navigator.pushReplacement(context, 'cadastro' as Route<Object?>);
                          },
                          child: Text("Cadastro de Usuários"))
                    ],
                  ),
                ]),
              ),
            )),
          ),
        ));
  }
}
