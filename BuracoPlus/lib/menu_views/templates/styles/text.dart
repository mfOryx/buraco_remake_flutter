import 'package:buracoplus/menu_views/variables.dart' show noticesTextStyle;
import 'package:flutter/material.dart'
    show BuildContext, StatelessWidget, Text, TextDirection, Widget;

class CustText extends StatelessWidget {
  const CustText({required this.custText, super.key});

  final String custText;

  @override
  Widget build(BuildContext context) {
    return Text(
      custText,
      style: noticesTextStyle,
      textDirection: TextDirection.ltr,
    );
  }
}
