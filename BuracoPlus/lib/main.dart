import 'package:flutter/material.dart';
import 'package:buracoplus/splash.dart';
import 'package:buracoplus/login.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const startApp());
}

class startApp extends StatelessWidget {
  const startApp({super.key});

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