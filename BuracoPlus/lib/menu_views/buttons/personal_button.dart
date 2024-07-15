import 'package:flutter/material.dart'
    show
        AnimatedContainer,
        BorderRadius,
        BoxDecoration,
        BoxShadow,
        BuildContext,
        Center,
        Color,
        Colors,
        GestureDetector,
        Offset,
        Radius,
        State,
        StatefulWidget,
        VoidCallback,
        Widget;

class PersonalButton extends StatefulWidget {
  final Widget child;
  final VoidCallback onTap;

  const PersonalButton({
    required this.child,
    required this.onTap,
    super.key,
  });

  @override
  State<PersonalButton> createState() {
    return _PersonalButtonState();
  }
}

class _PersonalButtonState extends State<PersonalButton> {
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
        duration: const Duration(milliseconds: 100),
        decoration: BoxDecoration(
          color: const Color.fromARGB(115, 117, 36, 120),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(0),
            bottomLeft: Radius.circular(20.0),
            bottomRight: Radius.circular(0),
          ),
          boxShadow: _isTapped
              ? [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ]
              : [],
        ),
        child: Center(
          child: widget.child,
        ),
      ),
    );
  }
}
