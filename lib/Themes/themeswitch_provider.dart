import 'package:flutter/material.dart';
import 'package:modernlogintute/Themes/Dark.dart';
import 'package:modernlogintute/Themes/Light.dart';

class ThemeSwitch with ChangeNotifier {
  ThemeData _themeData = lightMode; // Default theme is light mode

  // Getter for accessing the current theme data
  ThemeData get themeData => _themeData;

  // Getter to check if the current theme is dark mode
  bool get isDarkMode => _themeData == darkMode;

  // Setter for updating the theme data and notifying listeners
  set themeData(ThemeData themedata) {
    _themeData = themedata;
    notifyListeners(); // Notifies listeners about the theme change
  }

  // Method to toggle between light and dark modes
  void toggleTheme() {
    if (_themeData == lightMode) {
      themeData = darkMode; // Switch to dark mode if currently in light mode
    } else {
      themeData = lightMode; // Switch to light mode if currently in dark mode
    }
  }
}
