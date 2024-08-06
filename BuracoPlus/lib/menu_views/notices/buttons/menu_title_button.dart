import 'package:buracoplus/menu_views/notices/text.dart' show NoticeTextTitle;
import 'package:buracoplus/menu_views/notices/variables.dart'
    show menuBorderRadius;
import 'package:flutter/material.dart'
    show
        Alignment,
        BuildContext,
        Colors,
        Container,
        CrossAxisAlignment,
        EdgeInsets,
        Icon,
        IconButton,
        Icons,
        MainAxisAlignment,
        Row,
        StatelessWidget,
        VoidCallback,
        Widget;

class NoticesMenuHeader extends StatelessWidget {
  final double screenHeight;
  final VoidCallback onClose;

  const NoticesMenuHeader({
    required this.screenHeight,
    required this.onClose,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: screenHeight * 0.35,
      padding: const EdgeInsets.only(
        left: 10,
        top: 10,
        bottom: 100,
      ),
      decoration: menuBorderRadius,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const NoticeTextTitle(
            noticeText: 'NOTICE',
          ),
          IconButton(
            alignment: Alignment.topRight,
            icon: const Icon(
              Icons.close,
              color: Colors.white,
            ),
            padding: const EdgeInsets.only(
              left: 10,
            ),
            onPressed: onClose,
          ),
        ],
      ),
    );
  }
}
