import 'package:flutter/material.dart'
    show
        Alignment,
        Color,
        Colors,
        FontStyle,
        FontWeight,
        LinearGradient,
        TextDecoration,
        TextStyle;

const TextStyle noticesTextStyle = TextStyle(
  letterSpacing: 0.2,
  decoration: TextDecoration.none,
  backgroundColor: Colors.transparent,
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.normal,
  fontSize: 15,
  color: Colors.white,
);

const LinearGradient mainGradient = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [
    Color.fromRGBO(114, 60, 125, 1.0),
    Color.fromRGBO(141, 107, 147, 1.0),
    Color.fromRGBO(96, 132, 166, 1.0),
    Color.fromRGBO(88, 104, 147, 1.0),
  ],
  stops: [0.0, 0.33, 0.66, 1.0],
);
