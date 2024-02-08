import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:buracoplus/home.dart';
import 'package:buracoplus/createtableSP.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:io';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _isObscured = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Stack(
            children: [
              Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/BG_LogIn.png'),
                    fit: BoxFit.fill,
                  ),
                ),
                child: Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/spade_transparent.png'),
                      fit: BoxFit.fill,
                    ),
                    color: Colors.transparent,
                  ),
                  padding: const EdgeInsets.fromLTRB(200, 0, 200, 0),
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
                        padding: const EdgeInsets.all(5.0),
                        decoration: BoxDecoration(
                          // border: Border.all(color: Colors.white, width: 1.0),
                          borderRadius: BorderRadius.circular(20.0),
                          image: const DecorationImage(
                            image: AssetImage(
                                'assets/square_curved_transparent_outline_white.png'),
                            fit:  BoxFit.fill,
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
                            const Text(
                              'If you are registered, enter your details to log in',
                              style: TextStyle(color: Colors.white),
                              textAlign: TextAlign.center,
                            ),
                            const TextField(
                              decoration: InputDecoration(
                                hintText: 'Email or Nickname',
                                icon: Icon(
                                  Icons.person,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            const SizedBox(height: 5),
                            TextField(
                              obscureText: _isObscured,
                              decoration: InputDecoration(
                                hintText: 'Password',
                                icon: const Icon(
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
                            const SizedBox(height: 5),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => const Home()));
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
                                  onTap: () {
                                    _launchURL('');
                                  },
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Not registered yet? ',
                            style: TextStyle(color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                          GestureDetector(
                            onTap: () {
                              _launchURL('https://www.google.com');
                            },
                            child: const Text(
                              'Click here to sign up',
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
                      const Text(
                        'or log in directly with your social account',
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
                              _launchURL('https://www.buraco.plus/privacy_en.pdf');
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
                              _launchURL('https://www.buraco.plus/terms_and_conditions.pdf');
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
                              _launchURL('https://www.apple.com/legal/internet-services/itunes/dev/stdeula/');
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
              Positioned(
                top: 10.0,
                right: 70.0,
                  child: Container(
                    width: 160,
                    height: 55,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                    ),
                  ),
              ),
            ],
          ),
        ),
      ),

      floatingActionButton: Stack(
        children: [
          Positioned(
            width: 70,
            bottom: 0.0,
            left: 150.0,
            child: FloatingActionButton(
              onPressed: () {
                exit(0);
              },
              backgroundColor: Colors.transparent,
              splashColor: Colors.transparent,
              elevation: 0.0,
              child: Row(
                  children: [
                    Transform.rotate(
                      angle: 1.6,
                      child: Image.asset(
                        'assets/simple_arrow_down.png',
                        width: 30,
                        height: 30,
                      ),
                    ),
                    const Text('QUIT', style: TextStyle(color: Colors.white)),
                  ]
              ),
            ),
          ),
          Positioned(
            width: 80,
            bottom: 0.0,
            right: 0.0,
            child: FloatingActionButton(
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
                onPressed: () {
                  //exit(0);
                },
                backgroundColor: Colors.transparent,
                splashColor: Colors.transparent,
                elevation: 0.0,
                child: Column(
                    children: [
                      Image.asset(
                          'assets/ic_settings.png',
                          width: 30,
                          height: 30,
                        ),
                      const Text('OPTIONS', style: TextStyle(color: Colors.white)),
                    ]
                ),
            ),
          ),
          Positioned(
            width: 70,
            top: 50.0,
            right: 0.0,
            child: FloatingActionButton(
              onPressed: () {
                //exit(0);
              },
              backgroundColor: Colors.transparent,
              splashColor: Colors.transparent,
              elevation: 0.0,
              child: Column(
                  children: [
                    Image.asset(
                      'assets/ic_rankings.png',
                      width: 30,
                      height: 30,
                    ),
                  const Text('RANKING', style: TextStyle(color: Colors.white)),
                  ]
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
