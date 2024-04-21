import 'package:buracoplus/blocks/options_button.dart';
import 'package:buracoplus/blocks/privacy_button.dart';
import 'package:buracoplus/common/toast_with_button.dart';
import 'package:buracoplus/common/translation_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:buracoplus/home.dart';
import 'package:buracoplus/create_table_single_player.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:io';
import 'package:buracoplus/login/controllers/login_controller.dart';
import 'package:buracoplus/blocks/privacy_menu.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late final LoginController _controller;
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final bool _isLoggedIn = false;
  String? _loginError;
  bool _isObscured = true; // Deve essere una variabile di stato
  bool isMenuVisible = false; // Stato per la visibilità del menu
  final bool _isButtonDisabled = false;

  void _toggleMenu() {
    setState(() {
      isMenuVisible = !isMenuVisible;
    });
  }

  @override
  void initState() {
    super.initState();
    _controller = LoginController()
      ..onError = (message) {
        // Mostra il toast qui utilizzando il context del widget
        ToastWithButton.showTopScrollingSnackbar(
          context,
          Text(
            message,
            style: const TextStyle(color: Colors.black, fontSize: 16.0),
          ),
          action: TextButton(
            onPressed: () {
              // Azione del pulsante
            },
            child: const Text(
              'Annulla',
              style: TextStyle(color: Colors.black),
            ),
          ),
        );
      }
      ..onSuccessfulMessage = () {
        // Azione da eseguire in caso di successo
      };
    _checkCredentialsAndAutoLogin();

    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.bottom, SystemUiOverlay.top]);
  }

  void _sendLogin() {
    final username = _usernameController.text;
    final password = _passwordController.text;
    _controller.sendLogin(context, username, password);
  }

  void launchURL(Uri url) async {
    if (!await launchUrl(url)) {
      throw 'Could not launch $url';
    }
  }

  Future<void> _checkCredentialsAndAutoLogin() async {
    final prefs = await SharedPreferences.getInstance();
    final playerId = prefs.getString('playerId');

    if (playerId != null) {
      _controller.sendAutoLogin(context, playerId); // Perform auto-login
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    final translationManager = Provider.of<TranslationManager>(context);

    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            GestureDetector(
              onTap: () {
                if (isMenuVisible) {
                  setState(() {
                    isMenuVisible = false;
                  });
                }
              },
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color.fromRGBO(
                          114, 60, 125, 1.0), // Colore medio lato sinistro
                      Color.fromRGBO(
                          141, 107, 147, 1.0), // Colore medio lato superiore
                      Color.fromRGBO(
                          96, 132, 166, 1.0), // Colore medio lato inferiore
                      Color.fromRGBO(
                          88, 104, 147, 1.0), // Colore medio lato destro
                    ],
                    stops: [
                      0.0,
                      0.33,
                      0.66,
                      1.0
                    ], // Regola questi valori per i tuoi bisogni
                  ),
                ),
                child: Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image:
                            AssetImage('assets/spade_transparent_v2.png.webp'),
                        fit: BoxFit.scaleDown,
                        alignment: Alignment.bottomLeft),
                    color: Colors.transparent,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          width: screenSize.width * 0.4,
                          padding: const EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                              color: Colors.white.withOpacity(
                                  0.3), // Colore con opacità per l'effetto trasparente
                              borderRadius: BorderRadius.circular(20.0),
                              border: Border.all(color: Colors.white)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                translationManager.translate('hello'),
                                style: const TextStyle(color: Colors.white),
                                textAlign: TextAlign.center,
                              ),
                              Container(
                                margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                                child: TextField(
                                  controller: _usernameController,
                                  style: const TextStyle(color: Colors.white),
                                  decoration: const InputDecoration(
                                    hintText: 'Email or Nickname1',
                                    hintStyle: TextStyle(color: Colors.white),
                                    prefixIcon: Icon(
                                      Icons.person,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 5),
                              Container(
                                margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                                child: TextField(
                                  obscureText: _isObscured,
                                  controller: _passwordController,
                                  style: const TextStyle(color: Colors.white),
                                  decoration: InputDecoration(
                                    hintText: 'Password',
                                    hintStyle:
                                        const TextStyle(color: Colors.white),
                                    prefixIcon: const Icon(
                                      Icons.lock,
                                      color: Colors.white,
                                    ),
                                    contentPadding: const EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 10),
                                    suffixIcon: IconButton(
                                      onPressed: () {
                                        setState(() {
                                          _isObscured = !_isObscured;
                                        });
                                      },
                                      icon: Icon(
                                        _isObscured
                                            ? Icons.visibility_off
                                            : Icons.visibility,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 5),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ElevatedButton(
                                    onPressed: _sendLogin,
                                    style: ElevatedButton.styleFrom(
                                      // Impostazioni base del bottone, incluso il background
                                      foregroundColor:
                                          const Color.fromRGBO(92, 70, 154, 1),
                                      backgroundColor: Colors.white,
                                    ).copyWith(
                                      side: MaterialStateProperty.resolveWith<
                                          BorderSide>(
                                        (Set<MaterialState> states) {
                                          if (states.contains(
                                              MaterialState.pressed)) {
                                            return const BorderSide(
                                              color: Colors
                                                  .black, // Colore del bordo quando il bottone è premuto
                                              width: 1.5,
                                            );
                                          }
                                          return const BorderSide(
                                            color:
                                                Color.fromRGBO(92, 70, 154, 1),
                                            width: 1.5,
                                          );
                                        },
                                      ),
                                      shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                              10), // Aggiusta il raggio se necessario
                                        ),
                                      ),
                                    ),
                                    child: const Text(
                                      'LOGIN',
                                      style: TextStyle(
                                        color: Color.fromRGBO(92, 70, 154, 1),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(height: 5),
                              GestureDetector(
                                onTap: () {},
                                child: const Text(
                                  'FORGOT PASSWORD?',
                                  style: TextStyle(
                                    color: Colors.white,
                                    decoration: TextDecoration.underline,
                                    decorationColor: Colors.white,
                                    fontSize: 10.0,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          if (Platform.isIOS || Platform.isMacOS) ...[
                            Column(children: [
                              IconButton(
                                icon: SvgPicture.asset(
                                  'assets/apple.svg',
                                  width: 40,
                                  height: 40,
                                  color: Colors.white,
                                ),
                                onPressed: () {
                                  Navigator.push(
                                      this.context,
                                      MaterialPageRoute(
                                          builder: (context) => const Home()));
                                },
                              ),
                            ]),
                            const SizedBox(width: 40),
                            Column(
                              children: [
                                IconButton(
                                  icon: SvgPicture.asset(
                                    'assets/gamecenter.svg',
                                    width: 40,
                                    height: 40,
                                  ),
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const Home()));
                                  },
                                ),
                              ],
                            ),
                          ],
                          if (Platform.isAndroid) ...[
                            Column(
                              children: [
                                IconButton(
                                  icon: SvgPicture.asset(
                                    'assets/gmail.svg',
                                    width: 50,
                                    height: 50,
                                  ),
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const Home()));
                                  },
                                ),
                              ],
                            ),
                          ],
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),

            Positioned(
              top: MediaQuery.of(context).size.height < 550 ? 10.0 : 20.0,
              left: 0,
              right: 0,
              child: Image.asset(
                'assets/logo-and-cards.png',
                width: 100,
                height: 60,
              ),
            ),
            OptionsButton(toggleMenu: _toggleMenu),
            //privacy section
            PrivacyButton(toggleMenu: _toggleMenu),
            PrivacyMenu(
              isMenuVisible: isMenuVisible,
              launchURL: launchUrl,
            ),
            Positioned(
              width: 70,
              bottom: 40.0,
              right: Directionality.of(context) == TextDirection.rtl
                  ? 40
                  : null, // Set left or right based on text direction
              left: Directionality.of(context) == TextDirection.rtl
                  ? null
                  : 40, // Only one will be set at a time

              //left: Platform.isMacOS ? 40.0 : 40.0,
              child: FloatingActionButton(
                heroTag: null,
                onPressed: () {
                  exit(0);
                },
                backgroundColor: Colors.transparent,
                splashColor: Colors.transparent,
                elevation: 0.0,
                child: Row(children: [
                  Transform.rotate(
                    angle: 1.6,
                    child: Image.asset(
                      'assets/simple_arrow_down.png',
                      width: 30,
                      height: 30,
                    ),
                  ),
                  const Text('QUIT', style: TextStyle(color: Colors.white)),
                ]),
              ),
            ),
            Positioned(
              width: 80,
              bottom: 40.0,
              left: Directionality.of(context) == TextDirection.rtl
                  ? 40
                  : null, // Set left or right based on text direction
              right: Directionality.of(context) == TextDirection.rtl
                  ? null
                  : 40, // Only one will be set at a time
              child: FloatingActionButton(
                heroTag: null,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CreateTableSP()));
                },
                backgroundColor: Colors.transparent,
                splashColor: Colors.transparent,
                elevation: 0.0,
                child: Row(
                  children: [
                    const Text('TRAIN', style: TextStyle(color: Colors.white)),
                    Transform.rotate(
                      angle: -1.6,
                      child: Image.asset(
                        'assets/simple_arrow_down.png',
                        width: 30,
                        height: 30,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
