import 'package:flutter/material.dart'
    show
        BorderRadius,
        BoxDecoration,
        BuildContext,
        Container,
        IconAlignment,
        LinearGradient,
        StatelessWidget,
        TextButton,
        Widget;

class GradientTextButton extends StatelessWidget {
  final LinearGradient custGradient;
  final custClick;
  final custLongClick;
  final custButtonText;
  final custIcon;

  const GradientTextButton(
      {required this.custGradient,
      required this.custClick,
      required this.custLongClick,
      required this.custButtonText, 
      required this.custIcon,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 150,
      decoration: BoxDecoration(
        gradient: custGradient,
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextButton.icon(
        onPressed: custClick,
        onLongPress: custLongClick,
        icon: custIcon,
        iconAlignment: IconAlignment.start,
        label: custButtonText,
      ),
    );
  }
}
