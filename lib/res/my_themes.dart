import 'package:flutter/material.dart';

import 'my_colors.dart';


//final darkTheme = ThemeData(
//  primarySwatch: Colors.grey,
//  primaryColor: Colors.black,
//  brightness: Brightness.dark,
//  backgroundColor: const Color(0xFF212121),
//  accentColor: Colors.white,
//  accentIconTheme: IconThemeData(color: Colors.black),
//  dividerColor: Colors.black12,
//);
//
//final lightTheme = ThemeData(
//  primarySwatch: Colors.grey,
//  primaryColor: Colors.white,
//  brightness: Brightness.light,
//  backgroundColor: const Color(0xFFE5E5E5),
//  accentColor: Colors.black,
//  accentIconTheme: IconThemeData(color: Colors.white),
//  dividerColor: Colors.white54,
//);

final darkTheme = ThemeData(
  primaryColor: MyColors.primary,
  hintColor: MyColors.accent,
  brightness: Brightness.dark,
//  backgroundColor: Colors.black26,
);

final lightTheme = ThemeData(
  primaryColor: MyColors.primary,
  hintColor: MyColors.accent,
  brightness: Brightness.light,
//  backgroundColor: Colors.white70,
);