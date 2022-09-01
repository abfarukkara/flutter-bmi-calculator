import 'package:bmicalculator/presentation/input_page/input_page.dart';
import 'package:bmicalculator/presentation/result_page/result_page.dart';
import 'package:bmicalculator/theme.dart';
import 'package:flutter/material.dart';

import 'presentation/shared/constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      darkTheme: AppTheme.darkTheme,
      theme: AppTheme.lightTheme,
      themeMode: ThemeMode.dark,
      home: const InputPage(),
    );
  }
}
