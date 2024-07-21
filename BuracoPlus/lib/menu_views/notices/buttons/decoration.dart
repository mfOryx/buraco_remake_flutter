import 'package:flutter/material.dart'
    show
        BlurStyle,
        BorderRadius,
        BoxDecoration,
        BoxShadow,
        Color,
        Colors,
        Offset,
        Radius;

class MenuButtonDecor {
  static BoxDecoration decorationTemplate(
    bool isTapped,
    Color color,
    BorderRadius borderRadius,
  ) {
    return BoxDecoration(
      color: color,
      borderRadius: borderRadius,
      boxShadow: isTapped
          ? [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                spreadRadius: 0.5,
                blurRadius: 10.0,
                offset: const Offset(0, 0),
                blurStyle: BlurStyle.solid,
              ),
            ]
          : [],
    );
  }

  static BoxDecoration decoration1(
    bool isTapped,
  ) {
    return decorationTemplate(
      isTapped,
      const Color.fromARGB(115, 117, 36, 120),
      const BorderRadius.only(
        topLeft: Radius.circular(20.0),
        topRight: Radius.circular(0),
        bottomLeft: Radius.circular(20.0),
        bottomRight: Radius.circular(0),
      ),
    );
  }

  static BoxDecoration decoration2(
    bool isTapped,
  ) {
    return decorationTemplate(
      isTapped,
      const Color.fromARGB(115, 59, 6, 61),
      const BorderRadius.only(
        topLeft: Radius.circular(0),
        topRight: Radius.circular(20.0),
        bottomLeft: Radius.circular(0),
        bottomRight: Radius.circular(20.0),
      ),
    );
  }
}
