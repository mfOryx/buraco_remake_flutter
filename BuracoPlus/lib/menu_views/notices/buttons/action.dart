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

class ButtonAction extends StatefulWidget {
  const ButtonAction({
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

bool _isTapped = false;

class ButtonTemplateState extends State<ButtonAction> {
  void _handleTap() {
    setState(
      () {
        _isTapped = true;
      },
    );

    Future.delayed(
      const Duration(
        milliseconds: 100,
      ),
      () {
        setState(
          () {
            _isTapped = false;
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTap,
      child: ButtonAnimation(
        boxDecoration: widget.getDecoration(_isTapped),
        text: widget.noticeTextButton,
      ),
    );
  }
}
