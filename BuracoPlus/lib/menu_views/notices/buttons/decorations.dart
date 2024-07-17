import 'package:flutter/material.dart';

class MenuButtonDecor1 {
  static BoxDecoration getDecoration(bool isTapped) {
    return BoxDecoration(
      color: const Color.fromARGB(115, 117, 36, 120),
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(20.0),
        topRight: Radius.circular(0),
        bottomLeft: Radius.circular(20.0),
        bottomRight: Radius.circular(0),
      ),
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
}

class MenuButtonDecor2 {
  static BoxDecoration getDecoration(bool isTapped) {
    return BoxDecoration(
      color: const Color.fromARGB(115, 59, 6, 61),
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(0),
        topRight: Radius.circular(20.0),
        bottomLeft: Radius.circular(0),
        bottomRight: Radius.circular(20.0),
      ),
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
}
