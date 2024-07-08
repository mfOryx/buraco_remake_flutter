import 'package:flutter/material.dart'
    show
        BorderRadius,
        BoxDecoration,
        BuildContext,
        Container,
        ElevatedButton,
        Image,
        LinearGradient,
        Navigator,
        SizedBox,
        StatelessWidget,
        Text,
        Widget;

class GradientElevatedButton extends StatelessWidget {
  final LinearGradient custGradiente;
  final Text custTesto;

  const GradientElevatedButton(
      {required this.custGradiente,
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
          onPressed: () {
            Navigator.pop(context);
          },
          child: Image.asset(
            'assets/ic_check_gradiant2.png',
            width: 30,
            height: 30,
          ),
        ),
      ),
    );
  }
}
