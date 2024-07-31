import 'package:buracoplus/menu_views/notices/variables.dart'
    show noticesTextStyle;
import 'package:flutter/material.dart'
    show BuildContext, StatelessWidget, Text, Widget;

class NoticeText extends StatelessWidget {
  const NoticeText({
    required this.noticeText,
    required this.fontSize,
    super.key,
  });

  final String noticeText;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Text(
      noticeText,
      style: noticesTextStyle.copyWith(fontSize: fontSize),
    );
  }
}

class NoticeTextTitle extends NoticeText {
  const NoticeTextTitle({
    required super.noticeText,
    super.key,
  }) : super(fontSize: 15.5);
}

class NoticeTextButton extends NoticeText {
  const NoticeTextButton({
    required super.noticeText,
    super.key,
  }) : super(fontSize: 11.5);
}
