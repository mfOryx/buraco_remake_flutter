import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  startTimer() {
    var duration = const Duration(seconds: 4);
    return Timer(duration, route);
  }

  route() {
    Navigator.pushReplacementNamed(context, '/login');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: content(),
    );
  }
  Widget content() {
    return Center(
      child: Container(
        child: Lottie.asset('assets/oryxlogo.json'),
        // child: Lottie.network('https://lottie.host/embed/508ad09e-d8d4-4aca-8098-3bac67f00996/ryf4VZ5vMj.json', animate: true),
      ),
    );
  }
}