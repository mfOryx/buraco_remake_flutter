import 'package:flutter/material.dart'
    show
        AnimatedContainer,
        BoxDecoration,
        BuildContext,
        Center,
        StatelessWidget,
        Widget;

class ButtonAnimation extends StatelessWidget {
  final Widget text;
  final BoxDecoration boxDecoration;

  const ButtonAnimation({
    required this.text,
    required this.boxDecoration,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      height: 20,
      duration: const Duration(
        milliseconds: 150,
      ),
      decoration: boxDecoration,
      child: Center(
        child: text,
      ),
    );
  }
}
