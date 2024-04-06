import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:buracoplus/home.dart';
import 'package:buracoplus/create_table_single_player.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:io';
import 'package:buracoplus/login/controllers/login_controller.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late final LoginController _controller;
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoggedIn = false;
  String? _loginError;

  @override
  void initState() {
    super.initState();
    _controller = LoginController(
      onFirstConnectionOk: _sendLogin,
      onLoginSuccess: (player) {
        setState(() {
          _isLoggedIn = true;
          // Puoi salvare i dati del player o navigare a una nuova vista qui
        });
      },
      onLoginError: (error) {
        setState(() {
          _loginError = error;
        });
      },
    );
  }

  void _sendLogin() {
    final username = _usernameController.text;
    final password = _passwordController.text;
    _controller.sendLogin(username, password);
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
    bool isObscured = true;
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            Container(
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
                      image: AssetImage('assets/spade_transparent_v2.png'),
                      fit: BoxFit.scaleDown,
                      alignment: Alignment.bottomLeft),
                  color: Colors.transparent,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/logo-and-cards.png',
                      width: 100,
                      height: 60,
                    ),
                    Container(
                      width: 400,
                      margin: const EdgeInsets.all(5.0),
                      padding: const EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        // border: Border.all(color: Colors.white, width: 1.0),
                        borderRadius: BorderRadius.circular(20.0),
                        image: const DecorationImage(
                          image: AssetImage(
                              'assets/square_curved_transparent_outline_white.png'),
                          fit: BoxFit.fill,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'HELLO',
                            style: TextStyle(color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                          Container(
                            margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                            child: const TextField(
                              decoration: InputDecoration(
                                hintText: 'Email or Nickname',
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
                              obscureText: isObscured,
                              decoration: InputDecoration(
                                hintText: 'Password',
                                prefixIcon: const Icon(
                                  Icons.lock,
                                  color: Colors.white,
                                ),
                                contentPadding: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 10),
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      isObscured = !isObscured;
                                    });
                                  },
                                  icon: Icon(
                                    isObscured
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
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  _controller.connectToWebSocket();
/*                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => const Home()));*/
                                },
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(6.0),
                                  ),
                                  backgroundColor: Colors.transparent,
                                  elevation: 0.0,
                                ),
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Image.asset(
                                      'assets/button_login.png',
                                      fit: BoxFit.fill,
                                      height: 45,
                                      width: 110,
                                    ),
                                    const Text(
                                      'Login',
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ],
                                ),
                              ),
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
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const Text(
                      'Or log in directly with your social account',
                      style: TextStyle(color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            IconButton(
                              icon: SvgPicture.asset(
                                'assets/apple.svg',
                                width: 30,
                                height: 30,
                              ),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const Home()));
                              },
                            ),
                            const Text(
                              "Apple",
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                        const SizedBox(width: 20),
                        Column(
                          children: [
                            IconButton(
                              icon: SvgPicture.asset(
                                'assets/gamecenter.svg',
                                width: 50,
                                height: 30,
                              ),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const Home()));
                              },
                            ),
                            const Text(
                              "Game Center",
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                        const SizedBox(width: 20),
                        Column(
                          children: [
                            IconButton(
                              icon: SvgPicture.asset(
                                'assets/gmail.svg',
                                width: 30,
                                height: 30,
                              ),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const Home()));
                              },
                            ),
                            const Text(
                              "Gmail",
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            _launchURL(Uri.parse(
                                'https://www.buraco.plus/privacy_en.pdf'));
                          },
                          child: const Text(
                            'PRIVACY POLICY',
                            style: TextStyle(
                              color: Colors.white,
                              decoration: TextDecoration.underline,
                              decorationColor: Colors.white,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        const SizedBox(width: 20),
                        GestureDetector(
                          onTap: () {
                            _launchURL(Uri.parse(
                                'https://www.buraco.plus/terms_and_conditions.pdf'));
                          },
                          child: const Text(
                            'TERMS AND CONDITIONS',
                            style: TextStyle(
                              color: Colors.white,
                              decoration: TextDecoration.underline,
                              decorationColor: Colors.white,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        const SizedBox(width: 20),
                        GestureDetector(
                          onTap: () {
                            _launchURL(Uri.parse(
                                'https://www.apple.com/legal/internet-services/itunes/dev/stdeula/'));
                          },
                          child: const Text(
                            'TERMS OF USE (EULA)',
                            style: TextStyle(
                              color: Colors.white,
                              decoration: TextDecoration.underline,
                              decorationColor: Colors.white,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Stack(
        children: [
          Positioned(
            width: 70,
            bottom: 0.0,
            left: 150.0,
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
            bottom: 0.0,
            right: 0.0,
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
          Positioned(
            width: 70,
            top: 50.0,
            right: 80.0,
            child: FloatingActionButton(
              heroTag: null,
              onPressed: () {
                //exit(0);
              },
              backgroundColor: Colors.transparent,
              splashColor: Colors.transparent,
              elevation: 0.0,
              child: Column(children: [
                Image.asset(
                  'assets/ic_settings.png',
                  width: 30,
                  height: 30,
                ),
                const Text('OPTIONS', style: TextStyle(color: Colors.white)),
              ]),
            ),
          ),
          Positioned(
            width: 70,
            top: 50.0,
            right: 0.0,
            child: FloatingActionButton(
              heroTag: null,
              onPressed: () {
                //exit(0);
              },
              backgroundColor: Colors.transparent,
              splashColor: Colors.transparent,
              elevation: 0.0,
              child: Column(children: [
                Image.asset(
                  'assets/ic_rankings.png',
                  width: 30,
                  height: 30,
                ),
                const Text('RANKING', style: TextStyle(color: Colors.white)),
              ]),
            ),
          ),
        ],
      ),
    );
  }

  void _launchURL(Uri url) async {
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
