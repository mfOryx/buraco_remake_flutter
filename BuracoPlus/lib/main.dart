import 'package:flutter/material.dart';
import 'package:buracoplus/splash.dart';
import 'package:buracoplus/login/views/login.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const StartApp());
}

class StartApp extends StatelessWidget {
  const StartApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeRight]);
    return MaterialApp(
      routes: {
        '/': (context) => const Splash(),
        '/login': (context) => const Login(),
      },
    );
  }
}
