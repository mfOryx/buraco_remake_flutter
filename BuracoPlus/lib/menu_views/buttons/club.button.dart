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

class ClubButton extends StatefulWidget {
  final Widget child;
  final VoidCallback onTap;

  const ClubButton({
    required this.child,
    required this.onTap,
    super.key,
  });

  @override
  State<ClubButton> createState() {
    return _FilteredButtonState();
  }
}

class _FilteredButtonState extends State<ClubButton> {
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
          color: const Color.fromARGB(115, 59, 6, 61),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(0),
            topRight: Radius.circular(20.0),
            bottomLeft: Radius.circular(0),
            bottomRight: Radius.circular(20.0),
          ),
          boxShadow: _isTapped
              ? [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.8),
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
