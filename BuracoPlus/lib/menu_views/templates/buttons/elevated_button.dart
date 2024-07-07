import 'package:flutter/material.dart'
    show
        BorderRadius,
        BoxDecoration,
        BuildContext,
        Colors,
        Container,
        ElevatedButton,
        LinearGradient,
        SizedBox,
        StatelessWidget,
        Text,
        Widget;

class GradientElevatedButton extends StatelessWidget {
  final LinearGradient custGradiente;
  final custClick;
  final Text custTesto;

  const GradientElevatedButton(
      {required this.custGradiente,
      required this.custClick,
      required this.custTesto,
      super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 150,
      child: Container(
        decoration: BoxDecoration(
          gradient: custGradiente,
          borderRadius: BorderRadius.circular(20),
        ),
        child: ElevatedButton(
          onPressed: custClick,
          style: ElevatedButton.styleFrom(
            shadowColor: Colors.transparent.withOpacity(0),
            backgroundColor: Colors.transparent.withOpacity(0),
          ),
          child: custTesto,
        ),
      ),
    );
  }
}
