import 'package:flutter/material.dart';
import 'package:buracoplus/common/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {
  bool isDarkMode = false;

  ThemeProvider(BuildContext context) {
    loadThemePreference(context);
  }

  ThemeData get currentTheme => isDarkMode ? darkTheme : lightTheme;

  ThemeData get lightTheme {
    final themeColors = currentColors;

    return ThemeData(
      brightness: Brightness.light,
      primaryColor: themeColors.primary,
      hintColor: themeColors.secondary,
      scaffoldBackgroundColor: themeColors.surface,
      primarySwatch: Colors.blue,
      textTheme: GoogleFonts.titilliumWebTextTheme(
        ThemeData(brightness: Brightness.light).textTheme,
      ),
    );
  }

  ThemeData get darkTheme {
    final themeColors = currentColors;

    return ThemeData(
      brightness: Brightness.dark,
      primaryColor: themeColors.primary,
      hintColor: themeColors.secondary,
      scaffoldBackgroundColor: themeColors.surface,
      primarySwatch: Colors.blueGrey,
      textTheme: GoogleFonts.titilliumWebTextTheme(
        ThemeData(brightness: Brightness.dark).textTheme,
      ),
    );
  }

  ThemeColors get currentColors =>
      isDarkMode ? AppColors.darkThemeColors : AppColors.lightThemeColors;

  void toggleTheme() {
    isDarkMode = !isDarkMode;
    saveThemePreference();
    notifyListeners();
  }

  Future<void> loadThemePreference(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey('isDarkMode')) {
      isDarkMode = prefs.getBool('isDarkMode') ?? false;
    } else {
      isDarkMode = MediaQuery.of(context).platformBrightness == Brightness.dark;
    }
    notifyListeners();
  }

  Future<void> saveThemePreference() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isDarkMode', isDarkMode);
  }
}
