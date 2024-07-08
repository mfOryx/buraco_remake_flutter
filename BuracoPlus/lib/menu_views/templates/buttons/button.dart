import 'package:flutter/material.dart'
    show
        BorderRadius,
        BoxDecoration,
        BuildContext,
        Container,
        Icon,
        IconAlignment,
        LinearGradient,
        StatelessWidget,
        Text,
        TextButton,
        Widget;

class GradientTextButton extends StatelessWidget {
  final LinearGradient custGradient;
  final Text custButtonText;
  final Icon custIcon;

  const GradientTextButton(
      {required this.custGradient,
      required this.custButtonText,
      required this.custIcon,
      super.key,
      });

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
        icon: custIcon,
        iconAlignment: IconAlignment.start,
        label: custButtonText,
        onPressed: () {},
      ),
    );
  }
}
