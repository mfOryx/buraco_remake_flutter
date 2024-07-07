import 'package:flutter/material.dart'
    show
        Color,
        Colors,
        FontStyle,
        FontWeight,
        LinearGradient,
        Offset,
        Shadow,
        TextDecoration,
        TextStyle;

const TextStyle noticesTextStyle = TextStyle(
  letterSpacing: 1,
  wordSpacing: 1,
  decoration: TextDecoration.none,
  backgroundColor: Colors.transparent,
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.normal,
  fontSize: 13,
  color: Color.fromARGB(255, 3, 110, 8),
  shadows: <Shadow>[
    Shadow(
      color: Colors.lightBlue,
      offset: Offset(3.0, 1.0),
      blurRadius: 9.0,
    ),
  ],
);

const LinearGradient gradient1 = LinearGradient(
  colors: <Color>[
    Colors.green,
    Colors.white,
    Colors.red,
  ],
);

const LinearGradient gradButton1 = LinearGradient(
  colors: <Color>[
    Colors.red,
    Colors.yellow,
    Colors.orange,
    Colors.deepPurpleAccent,
  ],
);
