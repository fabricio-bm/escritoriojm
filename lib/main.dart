//import 'package:app_diario/screens/login_screen/login_screen_old.dart';
import 'package:escritorio_jm/screens/LoginScreen.dart';
import 'package:escritorio_jm/screens/adicionar_tarefa.dart';
import 'package:escritorio_jm/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'models/tarefa.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

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
      initialRoute: (isLogged) ? "home" : "login",
      routes: {
        "home": (context) => HomeScreen(),
        "login": (context) => LoginScreen(),
      },
      onGenerateRoute: (settings) {
        if (settings.name == "add-tarefa") {
          Map<String, dynamic> map = settings.arguments as Map<String, dynamic>;

          final Tarefa tarefa = map['tarefa'] as Tarefa;
          final bool isEditing = map['is_editing'];

          return MaterialPageRoute(
            builder: (context) {
              return AdicionarTarefa(tarefa: tarefa, isEditing: isEditing);
            },
          );
        }
        return null;
      },
    );
  }

}
