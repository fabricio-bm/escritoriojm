import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:escritorio_jm/screens/login/LoginScreen.dart';
import 'package:flutter/material.dart';

class TelaAbertura extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _introScreen(context);
  }

  Widget _introScreen(BuildContext context) {
    return Stack(
      children: <Widget>[

      EasySplashScreen(
//          backgroundColor: Theme.of(context).backgroundColor,
      durationInSeconds: 2,
      navigator: LoginScreen(),
      loaderColor: Colors.transparent, logo: Image.asset("assets/images/logo-jm-2023.png", fit: BoxFit.fitWidth,height: double.maxFinite, width: double.maxFinite,),
      //logoWidth: double.maxFinite,
      //showLoader: true,
        backgroundColor: Colors.grey.shade400,
      ),
      ]);
  }
}
