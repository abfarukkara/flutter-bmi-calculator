import 'package:bmicalculator/business/theme_service.dart';
import 'package:bmicalculator/presentation/input_page/input_page.dart';
import 'package:bmicalculator/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: ((context) => ThemeService()),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeService>(builder: (context, themeService, child) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        darkTheme: AppTheme.darkTheme,
        theme: AppTheme.lightTheme,
        themeMode: themeService.onDarkMode ? ThemeMode.dark : ThemeMode.light,
        home: const InputPage(),
      );
    });
  }
}
