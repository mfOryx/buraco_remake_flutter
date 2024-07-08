import 'package:buracoplus/menu_views/templates/buttons/button.dart'
    show GradientTextButton;
import 'package:buracoplus/menu_views/templates/buttons/link.dart'
    show openWebLink;
import 'package:buracoplus/menu_views/templates/screens/screen_2.dart'
    show Screen2;
import 'package:buracoplus/menu_views/variables.dart'
    show gradButton1, gradient1;
import 'package:flutter/material.dart'
    show
        BoxDecoration,
        BuildContext,
        Center,
        Color,
        Colors,
        Column,
        Container,
        FontStyle,
        FontWeight,
        Icon,
        Icons,
        MainAxisAlignment,
        MainAxisSize,
        MaterialPageRoute,
        Navigator,
        Offset,
        Shadow,
        SizedBox,
        StatelessWidget,
        Text,
        TextAlign,
        TextDecoration,
        TextStyle,
        Widget;

class Screen1 extends StatelessWidget {
  const Screen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: gradient1,
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            GradientTextButton(
              custGradient: gradButton1,
              custClick: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Screen2(),
                  ),
                );
              },
              custTesto: 'Schermo 2',
              custButtonText: null,
              custIcon: const Icon(Icons.arrow_forward_ios),
            ),
            const GradientTextButton(
              custGradient: gradButton1,
              custClick: openWebLink,
              custButtonText: Text(
                'Test link kernel.org',
                textAlign: TextAlign.center,
                style: TextStyle(
                  letterSpacing: 1,
                  wordSpacing: 1,
                  decoration: TextDecoration.underline,
                  backgroundColor: Colors.transparent,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.normal,
                  fontSize: 12,
                  color: Color.fromARGB(255, 24, 12, 190),
                  shadows: <Shadow>[
                    Shadow(
                      color: Colors.lightBlueAccent,
                      offset: Offset(3.0, 1.0),
                      blurRadius: 9.0,
                    ),
                  ],
                ),
              ),
              //custIcon: null,
              custTesto: '', 
              custIcon: Icon(Icons.arrow_forward_ios),
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              'Fix it',
              style: TextStyle(
                color: Colors.blue,
                fontSize: 40,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
              selectionColor: Colors.red,
            ),
          ],
        ),
      ),
    );
  }
}
