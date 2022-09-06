import 'package:flutter/cupertino.dart';

class ThemeService extends ChangeNotifier {
  bool onDarkMode = false;

  void toggleThemeMode() {
    onDarkMode = !onDarkMode;
    notifyListeners();
  }
}
