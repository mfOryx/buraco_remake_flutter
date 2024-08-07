import 'package:flutter/material.dart'
    show
        Alignment,
        Border,
        BorderRadius,
        BoxDecoration,
        Color,
        Colors,
        LinearGradient,
        Radius,
        TextDecoration,
        TextStyle;

final LinearGradient noticeGradient = LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  colors: [
    Color(0xFF5A6E96),
    Color(0xFF734682),
  ],
);

final TextStyle noticesTextStyle = TextStyle(
  color: Colors.white,
  wordSpacing: 0.0,
  letterSpacing: 0.2,
  decoration: TextDecoration.none,
);

final BoxDecoration menuBorderRadius = BoxDecoration(
  gradient: noticeGradient,
  borderRadius: BorderRadius.vertical(
    top: Radius.circular(20.0),
    bottom: Radius.elliptical(160, 10),
  ),
);

final BoxDecoration menuBoxInside = BoxDecoration(
  border: Border.all(color: Colors.transparent),
  borderRadius: BorderRadius.circular(20.0),
  color: const Color(0xFFF0F0F0),
);
