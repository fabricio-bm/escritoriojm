import 'dart:js_interop';

import 'package:escritorio_jm/firebase_options.dart';
import 'package:escritorio_jm/screens/login/LoginScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
   await Firebase.initializeApp(
     options: DefaultFirebaseOptions.currentPlatform
   );
  bool isLogged = await verifyToken();
  runApp(MyApp(
    isLogged: isLogged,
  ));
}

Future<bool> verifyToken() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? token = prefs.getString("accesToken");
  if (token != null) {
    return true;
  }
  return false;
}

class MyApp extends StatelessWidget {
  final bool isLogged;

  const MyApp({Key? key, required this.isLogged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Escritório JM',
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.light,
      initialRoute: (isLogged) ? "home" : "login",
      theme: ThemeData(
        primarySwatch: Colors.grey,
        appBarTheme: const AppBarTheme(
          elevation: 0,
          backgroundColor: Colors.black,
          titleTextStyle: TextStyle(color: Colors.white),
          actionsIconTheme: IconThemeData(color: Colors.white),
          iconTheme: IconThemeData(color: Colors.white),
        ),
        textTheme: GoogleFonts.bitterTextTheme(),
      ),
      home: LoginScreen(),
      routes: {
        "/principal": (BuildContext context) => LoginScreen(),
      },
    );
  }
}
