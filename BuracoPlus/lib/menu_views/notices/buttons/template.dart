import 'package:buracoplus/menu_views/notices/buttons/animation.dart'
    show ButtonAnimation;
import 'package:flutter/material.dart'
    show
        BoxDecoration,
        BuildContext,
        GestureDetector,
        State,
        StatefulWidget,
        Widget;

abstract class ButtonTemplate extends StatefulWidget {
  const ButtonTemplate({
    required this.noticeTextButton,
    required this.getDecoration,
    super.key,
  });

  final Widget noticeTextButton;
  final BoxDecoration Function(bool isTapped) getDecoration;

  @override
  ButtonTemplateState createState() {
    return ButtonTemplateState();
  }
}

class ButtonTemplateState extends State<ButtonTemplate> {
  bool _isTapped = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isTapped = !_isTapped;
        });
      },
      child: ButtonAnimation(
        boxDecoration: widget.getDecoration(_isTapped),
        text: widget.noticeTextButton,
      ),
    );
  }
}
