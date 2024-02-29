import 'package:escritorio_jm/res/my_themes.dart';
import 'package:escritorio_jm/screens/home_screen.dart';
import 'package:escritorio_jm/screens/login/LoginScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'notifier/theme_notifier.dart';
void main() {
  SharedPreferences.getInstance().then((prefs){
    var darkModeOn = prefs.getBool('darkMode') ?? false;
    runApp(ChangeNotifierProvider(
      create: (_) => ThemeNotifier(darkModeOn ? darkTheme : lightTheme),
      child: MyApp(),),
    );
  });
}

  /*
  WidgetsFlutterBinding.ensureInitialized();

  SharedPreferences.getInstance().then((prefs) {
    var darkModeOn = prefs.getBool('darkMode') ?? false;
    runApp(
      ChangeNotifierProvider<ThemeNotifier>(
        create: (_) => ThemeNotifier(darkModeOn ? darkTheme : lightTheme),
        child: MyApp(),
      ),
    );
  });
}
*/
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Escritório JM',
      theme: themeNotifier.getTheme(),
         home: LoginScreen(),
    );
  }
}