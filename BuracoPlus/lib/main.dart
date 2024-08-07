import 'dart:io' show Platform;
import 'package:buracoplus/common/settings_manager.dart' show SettingsManager;
import 'package:buracoplus/common/translation_manager.dart'
    show TranslationManager;
import 'package:buracoplus/helpers/user_preferences.dart' show UserPreferences;
import 'package:buracoplus/providers/create_table_provider.dart';
import 'package:buracoplus/providers/dialog_provider.dart';
import 'package:buracoplus/providers/ranking_provider.dart';
import 'package:buracoplus/providers/theme_provider.dart' show ThemeProvider;
import 'package:buracoplus/services/unique_identifier.dart';
import 'package:buracoplus/sockets/socket_service.dart' show SocketService;
import 'package:flutter/material.dart'
    show
        BuildContext,
        Locale,
        MaterialApp,
        StatelessWidget,
        ThemeMode,
        Widget,
        WidgetsBinding,
        WidgetsFlutterBinding,
        runApp;
import 'package:buracoplus/splash.dart' show Splash;
import 'package:buracoplus/login/views/login.dart' show Login;
import 'package:flutter/services.dart'
    show DeviceOrientation, PlatformException, SystemChrome;
import 'package:flutter_localizations/flutter_localizations.dart'
    show
        GlobalCupertinoLocalizations,
        GlobalMaterialLocalizations,
        GlobalWidgetsLocalizations;
import 'package:provider/provider.dart'
    show ChangeNotifierProvider, MultiProvider, Provider;
import 'package:firebase_core/firebase_core.dart' show Firebase;
import 'firebase_options.dart' show DefaultFirebaseOptions;

//import 'package:flutter_jailbreak_detection/flutter_jailbreak_detection.dart';
import 'package:jailbreak_root_detection/jailbreak_root_detection.dart';
import 'package:toastification/toastification.dart';

bool jailbroken = false;
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
  //  ************************************ CHECK JAIL BREAK  *************************

  // Platform messages may fail, so we use a try/catch PlatformException.
  try {
    jailbroken = await JailbreakRootDetection.instance.isJailBroken;
  } on PlatformException {
    jailbroken = true;
  }
  //  ************************************ END OF CHECK JAIL BREAK  *************************
  //*****************************************************************************************
  //  ************************************ Check unique Identifier  *************************
  UniqueIdentifierService uniqueIdentifierService = UniqueIdentifierService();
  uniqueIdentifierService.initPlatformState();
  //  ************************************ END OF Check unique Identifier  *************************
  //*****************************************************************************************

  //connecting to the socket server singleton in the start of the app..
  // if(!SocketServiceSingleton().isConnected()) {
  //   SocketServiceSingleton().initSocket('ws://15.160.133.85:3001');
  // } else{
  //   if (kDebugMode) {
  //     print("already connected to sockets [main.dart] !!!");
  //   }
  // }

  runApp(MainApp(translationManager: translationManager,));
}

class MainApp extends StatelessWidget {
  final TranslationManager translationManager;

  const MainApp({super.key, required this.translationManager});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (jailbroken) {
        // PopUps.popUpWarningWithButton(
        //   "Access Denied",
        //   "Jailbroken devices are not allowed!",
        //   autocloseDuration: 0,
        //   onPressed: () {
        //     //close the app here...
        //   },
        // );
      }
    });

    return ToastificationWrapper(
        child: MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SettingsManager()),
        ChangeNotifierProvider(create: (_) => RankingProvider()),
        ChangeNotifierProvider(create: (_) => DialogProvider()),
        ChangeNotifierProvider(create: (_) => CreateTableProvider()),
        ChangeNotifierProvider(create: (context) => ThemeProvider(context)),
        ChangeNotifierProvider<TranslationManager>.value(value: translationManager),
      ],
      child: const StartApp(),
    ));
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
