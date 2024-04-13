// rotating_b_overlay.dart
import 'package:buracoplus/common/rotating_animation.dart';
import 'package:flutter/material.dart';

class RotatingLoader {
  static OverlayEntry? _overlayEntry;

  static void showOverlay(BuildContext context) {
    final overlay = Overlay.of(context);
    _overlayEntry = _createOverlayEntry(context);
    overlay.insert(_overlayEntry!);
  }

  static void hideOverlay() {
    _overlayEntry?.remove();
    _overlayEntry = null; // Importante per evitare riferimenti obsoleti
  }

  static OverlayEntry _createOverlayEntry(BuildContext context) {
    return OverlayEntry(
      builder: (context) => Positioned(
        top: MediaQuery.of(context).size.height * 0.5 - 50,
        left: MediaQuery.of(context).size.width * 0.5 - 50,
        child: const Material(
          color: Colors.transparent,
          child: RotatingAnimation(), // Utilizza il nuovo widget qui
        ),
      ),
    );
  }
}
