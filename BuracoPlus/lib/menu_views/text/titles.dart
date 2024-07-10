import 'package:buracoplus/menu_views/variables.dart' show noticesTextStyle;
import 'package:flutter/material.dart'
    show BuildContext, StatelessWidget, Text, TextDirection, Widget;

class NoticeTitle extends StatelessWidget {
  const NoticeTitle({
    required this.noticeTitle,
    super.key,
  });

  final String noticeTitle;

  @override
  Widget build(BuildContext context) {
    return Text(
      noticeTitle,
      style: noticesTextStyle,
      textDirection: TextDirection.ltr,
    );
  }
}
