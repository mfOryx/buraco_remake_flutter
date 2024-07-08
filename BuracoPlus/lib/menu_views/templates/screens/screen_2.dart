import 'package:buracoplus/menu_views/templates/buttons/button.dart'
    show GradientTextButton;
import 'package:buracoplus/menu_views/templates/screens/screen_1.dart'
    show Screen1;
import 'package:buracoplus/menu_views/templates/styles/text.dart' show CustText;
import 'package:buracoplus/menu_views/variables.dart'
    show gradButton1, gradient1;
import 'package:flutter/material.dart'
    show
        BoxDecoration,
        BuildContext,
        Center,
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
        SizedBox,
        StatelessWidget,
        Text,
        TextAlign,
        TextStyle,
        Widget;

class Screen2 extends StatelessWidget {
  const Screen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: gradient1,
      ),
      child: SizedBox(
        width: double.infinity,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              GradientTextButton(
                custGradient: gradButton1,
                custButtonText: const CustText(
                  custText: 'Schermo 1',
                ),
                custClick: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Screen1(),
                    ),
                  );
                },
                custIcon: const Icon(Icons.arrow_back_ios),
                custTesto: '',
              ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                'prova testo',
                //style: GoogleFonts.lato(
                ////style: GoogleFonts.getFont('Lato'),
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 30,
                  fontStyle: FontStyle.italic,
                  fontFamily:
                      'assets/fonts/google_fonts/IbarraRealNova-Bold.ttf',
                  //'assets/fonts/google_fonts/IbarraRealNova-BoldItalic.ttf',
                  //'assets/fonts/google_fonts/IbarraRealNova-Italic-VariableFont_wght.ttf',
                  //'assets/fonts/google_fonts/IbarraRealNova-Italic.ttf',
                  //'assets/fonts/google_fonts/IbarraRealNova-Medium.ttf',
                  //'assets/fonts/google_fonts/IbarraRealNova-Medium.ttf',
                  //'assets/fonts/google_fonts/IbarraRealNova-MediumItalic.ttf',
                  //'assets/fonts/google_fonts/IbarraRealNova-Regular.ttf',
                  //'assets/fonts/google_fonts/IbarraRealNova-SemiBoldItalic.ttf',
                  //'assets/fonts/google_fonts/IbarraRealNova-SemiBoldItalic.ttf',
                  //fontWeight: FontWeight.w100, //: 'Thin',
                  //fontWeight: FontWeight.w200, //: 'ExtraLight',
                  //fontWeight: FontWeight.w300, //: 'Light',
                  fontWeight: FontWeight.w400, //: 'Regular',
                  //fontWeight: FontWeight.w500, //: 'Medium',
                  //fontWeight: FontWeight.w600, //: 'SemiBold',
                  //fontWeight: FontWeight.w700, //: 'Bold',
                  //fontWeight: FontWeight.w800, //: 'ExtraBold',
                  //fontWeight: FontWeight.w900, //: 'Black',
                ),
                textAlign: TextAlign.right,
                selectionColor: Colors.red,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
