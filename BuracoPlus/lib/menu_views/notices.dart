import 'package:buracoplus/login/views/login.dart' show Login;
import 'package:buracoplus/menu_views/templates/buttons/button.dart'
    show GradientTextButton;
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
        Scaffold,
        SizedBox,
        State,
        StatefulWidget,
        Text,
        TextAlign,
        TextStyle,
        Widget;

class Notices extends StatefulWidget {
  const Notices({super.key});

  @override
  State<Notices> createState() {
    return _NoticesState();
  }
}

class _NoticesState extends State<Notices> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
                custButtonText: const CustText(
                  custText: 'Back to Login Page',
                  textAlign: TextAlign.center,
                ),
                custClick: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Login(),
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
                'BARRA - IN PROGRESS',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 40,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
                selectionColor: Colors.red,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
