import 'package:bmicalculator/presentation/shared/constants.dart';
import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static const _darkAppBarColor = Color.fromRGBO(10, 14, 33, 1);
  static const _darkIconCoor = Colors.white;
  static const _darkButtonColor = Color.fromRGBO(29, 30, 51, 1);
  static final _darkTextButtonStyle = TextButton.styleFrom(
    primary: Colors.white,
    onSurface: Colors.white,
    backgroundColor: _darkButtonColor,
    textStyle: const TextStyle(color: Colors.white, fontSize: 18),
    elevation: 1,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
  );

  static const _lightAppBarColor = Color.fromRGBO(235, 21, 85, 1);
  static const _lightIconColor = Color.fromRGBO(235, 21, 85, 1);
  static final _lightTextButtonStyle = _darkTextButtonStyle.copyWith(
    backgroundColor: MaterialStateProperty.all(
      const Color.fromRGBO(235, 21, 85, 1),
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: appBackgroundColor,
    appBarTheme: const AppBarTheme(
      elevation: 0,
      centerTitle: true,
      titleTextStyle: TextStyle(fontSize: 18),
      color: _darkAppBarColor,
    ),
    iconTheme: const IconThemeData(color: _darkIconCoor),
    textButtonTheme: TextButtonThemeData(
      style: _darkTextButtonStyle,
    ),
    dialogTheme: const DialogTheme(backgroundColor: _darkButtonColor),
  );

  static final ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
      elevation: 0,
      centerTitle: true,
      titleTextStyle: TextStyle(fontSize: 18),
      color: _lightAppBarColor,
    ),
    iconTheme: const IconThemeData(
      color: _lightIconColor,
    ),
    textButtonTheme: TextButtonThemeData(
      style: _lightTextButtonStyle,
    ),
    dialogTheme: const DialogTheme(backgroundColor: Colors.white),
  );
}
