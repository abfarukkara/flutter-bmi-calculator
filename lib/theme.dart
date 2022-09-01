import 'package:bmicalculator/presentation/shared/constants.dart';
import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static final ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: appBackgroundColor,
    appBarTheme: const AppBarTheme(
      elevation: 0,
      centerTitle: true,
      titleTextStyle: TextStyle(fontSize: 18),
      backgroundColor: appBackgroundColor,
    ),
  );

  static final ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
      elevation: 0,
      centerTitle: true,
      titleTextStyle: TextStyle(fontSize: 18),
      backgroundColor: Colors.blue,
    ),
    textButtonTheme: TextButtonThemeData(
      style: ElevatedButton.styleFrom(
        shadowColor: Colors.grey,
        primary: Colors.white,
        onPrimary: Colors.blue,
        elevation: 10,
        textStyle: const TextStyle(
          color: Colors.blue,
        ),
      ),
    ),
    buttonTheme: ButtonThemeData(
      buttonColor: Colors.white,
    ),
  );
}
