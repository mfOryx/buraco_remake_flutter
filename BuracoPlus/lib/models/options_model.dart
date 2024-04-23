import 'package:flutter/material.dart';

class OptionItem {
  String title;
  bool isSwitch;
  bool switchValue;
  Function(BuildContext) onTap;
  bool requireLoggedIn;
  Function(bool)? onSwitchChanged;
  Widget? customWidget;

  OptionItem({
    required this.title,
    this.isSwitch = false,
    this.switchValue = false,
    required this.onTap,
    this.requireLoggedIn = false,
    this.onSwitchChanged,
    this.customWidget,
  });
}

class OptionGroup {
  String title;
  List<OptionItem> options;

  OptionGroup({required this.title, required this.options});
}
