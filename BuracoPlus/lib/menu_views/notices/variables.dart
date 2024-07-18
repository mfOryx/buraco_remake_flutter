import 'package:flutter/material.dart'
    show
        Alignment,
        Color,
        Colors,
        FontStyle,
        FontWeight,
        LinearGradient,
        TextBaseline,
        TextDecoration,
        TextStyle;

const LinearGradient noticeGradient = LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  colors: [
    Color.fromARGB(255, 90, 110, 150),
    Color.fromARGB(255, 115, 70, 130)
  ],
);

const TextStyle noticesTextStyle = TextStyle(
  color: Colors.white,
  backgroundColor: Colors.transparent,
  wordSpacing: 0.0,
  letterSpacing: 0.2,
  decoration: TextDecoration.none,
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.normal,
  height: null,
  textBaseline: TextBaseline.alphabetic,
);
