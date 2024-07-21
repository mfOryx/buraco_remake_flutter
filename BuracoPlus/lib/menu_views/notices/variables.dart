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
import 'package:flutter/widgets.dart';

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

const BoxDecoration menuBorderRadius = BoxDecoration(
  gradient: noticeGradient,
  borderRadius: BorderRadius.vertical(
    top: Radius.circular(20.0),
    bottom: Radius.elliptical(160, 10),
  ),
);

BoxDecoration menuBoxInside = BoxDecoration(
  border: const Border(
    top: BorderSide.none,
    bottom: BorderSide.none,
    right: BorderSide.none,
    left: BorderSide.none,
  ),
  borderRadius: BorderRadius.circular(20.0),
  color: const Color.fromRGBO(240, 240, 240, 0.0).withOpacity(1.0),
);
