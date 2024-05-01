import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key});

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
    var duration = const Duration(milliseconds: 1500);
    return Timer(duration, route);
  }

  route() {
    Navigator.pushReplacementNamed(context, '/login');
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: screenSize.width,
        height: screenSize.height,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color.fromRGBO(114, 60, 125, 1.0),
              Color.fromRGBO(141, 107, 147, 1.0),
              Color.fromRGBO(96, 132, 166, 1.0),
              Color.fromRGBO(88, 104, 147, 1.0),
            ],
            stops: [0.0, 0.33, 0.66, 1.0],
          ),
        ),
        child: Center(
          child: Lottie.asset('assets/splashScreenAnimation/buraco_logo.json'),
        ),
      ),
    );
  }
}