import 'package:buracoplus/menu_views/notices/buttons/decorations.dart';
import 'package:flutter/material.dart'
    show
        AnimatedContainer,
        BuildContext,
        Center,
        GestureDetector,
        State,
        StatefulWidget,
        VoidCallback,
        Widget;

class NoticeButton extends StatefulWidget {
  final Widget child;
  final VoidCallback onTap;
  //final BoxDecoration decor;

  const NoticeButton({
    required this.child,
    required this.onTap,
    //required this.decor,
    super.key,
  });

  @override
  State<NoticeButton> createState() {
    return _NoticeButtonState();
  }
}

class _NoticeButtonState extends State<NoticeButton> {
  bool _isTapped = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) {
        setState(() {
          _isTapped = true;
        });
      },
      onTapUp: (_) {
        setState(() {
          _isTapped = false;
        });
        widget.onTap();
      },
      onTapCancel: () {
        setState(() {
          _isTapped = false;
        });
      },
      child: AnimatedContainer(
        height: 20,
        duration: const Duration(milliseconds: 100),
        decoration: MenuButtonDecor1.getDecoration(_isTapped),
        child: Center(
          child: widget.child,
        ),
      ),
    );
  }
}
