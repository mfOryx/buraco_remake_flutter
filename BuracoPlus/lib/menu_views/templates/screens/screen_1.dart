import 'package:flutter/material.dart'
    show
        BuildContext,
        Center,
        Color,
        Colors,
        Column,
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
    return SizedBox(
      width: double.infinity,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ImmagineSfocata(
              custSfocatura: Colors.white.withOpacity(0.5),
            ),
            const SizedBox(
              height: 30,
            ),
            const Titolo(
              custTitolo: 'Pagina 1',
            ),
            const SizedBox(
              height: 30,
            ),
            GradientTextButton(
              custGradiente: gradButton1,
              custClick: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Screen2(),
                  ),
                );
              },
              custLongClick: null,
              custTestoBottone: const Testo(
                custTesto: 'Schermo 2',
              ),
              custIcon: const Icon(Icons.arrow_forward_ios),
            ),
            const SizedBox(
              height: 30,
            ),
            const GradientTextButton(
              custGradiente: gradButton2,
              custClick: openWebLink,
              custLongClick: openWebLink,
              custTestoBottone: Text(
                'clicca sul sito web kernel.org',
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
              custIcon: null,
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              'prova centratura testo',
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
