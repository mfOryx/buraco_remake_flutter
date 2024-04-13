import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  static final UserPreferences _instance = UserPreferences._internal();
  String languageCode = 'en'; // Default a 'en'

  factory UserPreferences() {
    return _instance;
  }

  UserPreferences._internal();

  Future<void> loadPreferences() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    languageCode = prefs.getString('language_code') ??
        'en'; // Assicurati che 'en' sia il default se non impostato
  }

  Future<void> setLanguage(String newLanguageCode) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('language_code', newLanguageCode);
    languageCode = newLanguageCode; // Aggiorna la variabile locale
  }
}
