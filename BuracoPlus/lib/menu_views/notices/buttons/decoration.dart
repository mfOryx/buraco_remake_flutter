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
  static BoxDecoration getBaseDecoration(
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
                spreadRadius: 2.0,
                blurRadius: 10.0,
                offset: const Offset(0, 0),
                blurStyle: BlurStyle.solid,
              ),
            ]
          : [],
    );
  }

  static BoxDecoration getDecoration1(bool isTapped) {
    return getBaseDecoration(
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

  static BoxDecoration getDecoration2(bool isTapped) {
    return getBaseDecoration(
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
