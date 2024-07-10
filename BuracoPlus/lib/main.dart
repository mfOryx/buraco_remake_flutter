import 'dart:io';
import 'package:buracoplus/common/settingsManager.dart';
import 'package:buracoplus/common/translation_manager.dart';
import 'package:buracoplus/helpers/user_preferences.dart';
import 'package:buracoplus/providers/theme_provider.dart';
import 'package:buracoplus/sockets/socket_service.dart';
import 'package:flutter/material.dart';
import 'package:buracoplus/splash.dart';
import 'package:buracoplus/login/views/login.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:toastification/toastification.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await UserPreferences().loadPreferences();
  final String languageCode = UserPreferences().languageCode;
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  final TranslationManager translationManager =
      TranslationManager(languageCode);
  await translationManager.loadTranslations();

  runApp(MainApp(translationManager: translationManager));
}

class MainApp extends StatelessWidget {
  final TranslationManager translationManager;

  const MainApp({super.key, required this.translationManager});

  @override
  Widget build(BuildContext context) {


    return ToastificationWrapper(
      child: MultiProvider(
        providers: [

          ChangeNotifierProvider(create: (_) => SettingsManager()),
          ChangeNotifierProvider(create: (context) => ThemeProvider(context)),
          ChangeNotifierProvider<TranslationManager>.value(
              value: translationManager),
        ],
        child: const StartApp(),
      )
    );

  }
}

class StartApp extends StatelessWidget {
  // Rimuovi il costruttore con languageCode, non è più necessario
  const StartApp({super.key});
  bool isIOS() {
    return Platform.isIOS;
  }

  bool isAndroid() {
    return Platform.isAndroid;
  }

  @override
  Widget build(BuildContext context) {
    // connecting to websocket at the start of the app before login
    

    if (isIOS()) {
      SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeRight]);
    } else if (isAndroid()) {
      SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft]);
    } else {
      SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft]);
    }

    // Usa Provider.of o Consumer per accedere a TranslationManager se necessario qui
    final String languageCode =
        Provider.of<TranslationManager>(context).languageCode;
    final ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (_) => SocketService('ws://15.160.133.85:3001')),
      ],
      child: MaterialApp(
        theme: themeProvider.currentTheme, // Usato per la modalità light
        darkTheme: themeProvider.currentTheme, // Usato per la modalità dark
        themeMode: themeProvider.isDarkMode
            ? ThemeMode.dark
            : ThemeMode.light, // Usa il tema dal provider
        locale: Locale(
            languageCode), // Qui utilizzi la lingua dal TranslationManager
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
      ),
    );
  }
}
