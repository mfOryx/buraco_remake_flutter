import 'package:flutter/material.dart';

class AppColors {
  static final lightThemeColors = ThemeColors(
    primary: Colors.blue.shade300,
    secondary: Colors.green.shade300,
    popupExternalBackground: Colors.white,
    popupBackground: Colors.grey.withOpacity(0.2),
    popupTitleBackground: const Color.fromRGBO(99, 86, 134, 1),
    optionTextColor: const Color.fromRGBO(99, 86, 134, 1),
    background: Colors.white,
    surface: Colors.grey.shade200,
    // Aggiungi altri colori qui
    gradient: const LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Color.fromRGBO(114, 60, 125, 1.0), // Colore medio lato sinistro
        Color.fromRGBO(141, 107, 147, 1.0), // Colore medio lato superiore
        Color.fromRGBO(96, 132, 166, 1.0), // Colore medio lato inferiore
        Color.fromRGBO(88, 104, 147, 1.0), // Colore medio lato destro
      ],
      stops: [0.0, 0.33, 0.66, 1.0], // Regola questi valori per i tuoi bisogni
    ),
    // Definisci altri gradienti se necessario
  );

  static final darkThemeColors = ThemeColors(
    primary: Colors.blueGrey.shade800,
    secondary: Colors.teal.shade700,
    background: Colors.grey.shade900,
    popupExternalBackground: const Color.fromRGBO(53, 60, 64, 1),
    popupBackground: const Color.fromRGBO(53, 60, 64, 0.4),
    popupTitleBackground: const Color.fromRGBO(53, 60, 64, 0.4),
    optionTextColor: Colors.white,
    surface: Colors.grey.shade800,
    // Aggiungi altri colori qui
    gradient: const LinearGradient(
      begin: Alignment
          .topLeft, // 147 gradi approssimativamente da sinistra in alto a destra in basso
      end: Alignment.bottomRight,
      colors: [
        Color(0xFF4d4855), // Colore di inizio al 0%
        Color(0xFF000000), // Colore di fine al 74%
      ],
      stops: [0.0, 0.74], // Punti percentuali dei colori nel gradiente
    ),
    // Definisci altri gradienti se necessario
  );
}

class ThemeColors {
  final Color primary;
  final Color secondary;
  final Color background;
  final Color popupBackground;
  final Color popupExternalBackground;
  final Color popupTitleBackground;
  final Color optionTextColor;
  final Color surface;
  // Aggiungi altri attributi di colore qui
  final LinearGradient gradient;
  // Aggiungi altri gradienti se necessario

  ThemeColors({
    required this.primary,
    required this.secondary,
    required this.background,
    required this.popupBackground,
    required this.popupExternalBackground,
    required this.popupTitleBackground,
    required this.optionTextColor,
    required this.surface,
    required this.gradient,
    // Inizializza altri campi qui
  });
}
