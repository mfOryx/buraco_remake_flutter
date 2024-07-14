import 'dart:io';
import 'package:buracoplus/common/popUp.dart';
import 'package:buracoplus/common/settingsManager.dart';
import 'package:buracoplus/common/translation_manager.dart';
import 'package:buracoplus/helpers/user_preferences.dart';
import 'package:buracoplus/providers/theme_provider.dart';
import 'package:buracoplus/services/uniqueIdentifier.dart';
import 'package:buracoplus/sockets/socket_service.dart';

import 'package:buracoplus/services/socket_service_singleton.dart';
import 'package:flutter/foundation.dart';

import 'package:flutter/material.dart';
import 'package:buracoplus/splash.dart';
import 'package:buracoplus/login/views/login.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:toastification/toastification.dart';
import 'package:flutter_jailbreak_detection/flutter_jailbreak_detection.dart';
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
  bool jailbroken;
  
  // Platform messages may fail, so we use a try/catch PlatformException.
  try {
    jailbroken = await FlutterJailbreakDetection.jailbroken;
    if(jailbroken){
      PopUps.popUpSucessWithButton("Access Denied","You are using the jail break device",autocloseDuration: 0,onPressed:()=>{
          // exit the game...
      SystemChannels.platform.invokeMethod('SystemNavigator.pop')
      });

    }

  } on PlatformException {
    jailbroken = true;
  }
  //  ************************************ END OF CHECK JAIL BREAK  *************************
  //*****************************************************************************************
  //  ************************************ Check unique Identifier  *************************
  UniqueIdentifierService uniqueIdentifierService = UniqueIdentifierService();
  uniqueIdentifierService.initUniqueIdentifierState();
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
