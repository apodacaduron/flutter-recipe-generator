import 'package:flutter/material.dart';

ThemeData appTheme() {
  return ThemeData(
      primarySwatch: Colors.green,
      buttonTheme: ButtonThemeData(
        buttonColor: Color.fromRGBO(16, 172, 132, 1),
        shape: RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(5.0),
            side: BorderSide(color: Color.fromRGBO(16, 172, 132, 1),)),
        textTheme: ButtonTextTheme.primary,
      ),
      fontFamily: 'Raleway');
}
