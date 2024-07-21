import 'package:buracoplus/menu_views/notices/variables.dart'
    show noticesTextStyle;
import 'package:flutter/material.dart'
    show BuildContext, StatelessWidget, Text, Widget;

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
    );
  }
}
