import 'package:flutter/material.dart';

ThemeData appTheme() {
  return ThemeData(
    primaryColor: Color.fromRGBO(237, 28, 36, 1),
    // accentColor: Colors.orange,
    // hintColor: Colors.white,
    // dividerColor: Colors.white,
    scaffoldBackgroundColor: Color.fromRGBO(245, 245, 245, 1),
    buttonTheme: ButtonThemeData(
      buttonColor: Color.fromRGBO(237, 28, 36, 1),     //  <-- dark color
      textTheme: ButtonTextTheme.primary, //  <-- this auto selects the right color
    ),
    // canvasColor: Color.fromRGBO(237, 28, 36, 1),
    fontFamily: 'Poppins'
  );
}