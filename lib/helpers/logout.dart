import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

logout(BuildContext context) {
  SharedPreferences.getInstance().then((prefs) {
    prefs.clear();
    Navigator.pushReplacementNamed(context, "LoginScreen");
  });
}