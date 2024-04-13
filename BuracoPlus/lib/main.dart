import 'package:buracoplus/common/translation_manager.dart';
import 'package:buracoplus/helpers/user_preferences.dart';
import 'package:flutter/material.dart';
import 'package:buracoplus/splash.dart';
import 'package:buracoplus/login/views/login.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await UserPreferences().loadPreferences();
  final String languageCode = UserPreferences().languageCode;

  final TranslationManager translationManager =
      TranslationManager(languageCode);
  await translationManager.loadTranslations();

  runApp(
    ChangeNotifierProvider<TranslationManager>.value(
      value: translationManager,
      child: const StartApp(),
    ),
  );
}

class StartApp extends StatelessWidget {
  // Rimuovi il costruttore con languageCode, non è più necessario
  const StartApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeRight]);

    // Usa Provider.of o Consumer per accedere a TranslationManager se necessario qui
    final String languageCode =
        Provider.of<TranslationManager>(context).languageCode;

    return MaterialApp(
      locale:
          Locale(languageCode), // Qui utilizzi la lingua dal TranslationManager
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', ''),
        Locale('it', ''),
        Locale('es', ''),
        Locale('pt', ''),
        Locale('ar', ''),
      ],
      routes: {
        '/': (context) => const Splash(),
        '/login': (context) => const Login(),
      },
    );
  }
}
