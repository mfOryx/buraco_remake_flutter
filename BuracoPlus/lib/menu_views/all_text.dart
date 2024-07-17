import 'package:buracoplus/menu_views/all_variables.dart';
import 'package:flutter/material.dart'
    show BuildContext, StatelessWidget, Text, TextDirection, Widget;

class NoticeTextTitle extends StatelessWidget {
  const NoticeTextTitle({
    required this.noticeText,
    super.key,
  });

  final String noticeText;

  @override
  Widget build(BuildContext context) {
    return Text(
      noticeText,
      style: noticesTextStyle.copyWith(fontSize: 15.5),
      textDirection: TextDirection.ltr,
    );
  }
}

class NoticeTextButton extends StatelessWidget {
  const NoticeTextButton({
    required this.noticeText,
    super.key,
  });

  final String noticeText;

  @override
  Widget build(BuildContext context) {
    return Text(
      noticeText,
      style: noticesTextStyle.copyWith(fontSize: 11.5),
      textDirection: TextDirection.ltr,
    );
  }
}
