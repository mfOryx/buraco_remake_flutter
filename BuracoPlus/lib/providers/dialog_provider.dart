import 'package:flutter/material.dart';

class DialogProvider extends ChangeNotifier {
  bool visible = false;

  bool get isVisible => visible;

  void showDialog() {
    visible = true;
    notifyListeners();
  }

  void hideDialog() {
    visible = false;
    notifyListeners();
  }
}