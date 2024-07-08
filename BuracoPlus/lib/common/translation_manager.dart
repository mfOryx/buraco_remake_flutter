import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class TranslationManager with ChangeNotifier {
  String _languageCode;
  Map<String, String> _translations = {};

  TranslationManager(this._languageCode);

   String get languageCode => _languageCode;

  Future<void> loadTranslations() async {
    final String jsonString =
        await rootBundle.loadString('assets/translations/$_languageCode.json');
    Map<String, dynamic> jsonMap = json.decode(jsonString);

    _translations = jsonMap.map((key, value) {
      return MapEntry(key, value.toString());
    });

    notifyListeners(); // Notifica i widget in ascolto che qualcosa è cambiato
  }

  String translate(String key) {
    return _translations[key] ?? key;
  }

  Future<void> changeLanguage(String newLanguageCode) async {

    _languageCode = newLanguageCode;
     // storing the language key in shared prefrence
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('languagePreference', _languageCode);

    await loadTranslations();
    notifyListeners(); // Notifica i widget in ascolto che qualcosa è cambiato
  }
}
