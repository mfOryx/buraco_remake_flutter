import 'dart:io';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:buracoplus/common/toast_builder.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  bool isMenuVisible = false;

  void _toggleMenu() {
    setState(() {
      isMenuVisible = !isMenuVisible;
    });
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )..repeat(reverse: true);
    _animation = Tween<double>(begin: 1.0, end: 1.5).animate(_controller);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: GestureDetector(
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
                  Color.fromRGBO(88, 104, 147, 1.0), // Colore medio lato destro
                ],
                stops: [
                  0.0,
                  0.33,
                  0.66,
                  1.0
                ], // Regola questi valori per i tuoi bisogni
              ),
            ),
            child: Stack(
              children: [
                Stack(
                  children: [
                    Positioned(
                      bottom: -35,
                      left: -65,
                      child: Opacity(
                        opacity: 0.2, // Adjust the opacity value (0.0 to 1.0)
                        child: Transform.rotate(
                          angle: 0.2,
                          child: Image.asset(
                            'assets/bg-card1_1.png',
                            width: 300,
                            height: 300,
                          ),
                        ),
                      ),
                    ),
                    // Other widgets in the stack
                  ],
                ),
                Stack(
                  children: [
                    Positioned(
                      top: 10,
                      right: -150,
                      child: Opacity(
                        opacity: 0.2, // Adjust the opacity value (0.0 to 1.0)
                        child: Transform.rotate(
                          angle: -0.2,
                          child: Image.asset(
                            'assets/bg-card2_1.png',
                            width: 300,
                            height: 300,
                          ),
                        ),
                      ),
                    ),
                    // Other widgets in the stack
                  ],
                ),
                SafeArea(
                  child: SizedBox.expand(
                    child: Stack(
                      children: [
                        // Centra verticalmente il blocco con i bottoni, le icone social e i link
                        Align(
                          alignment: Alignment.center,
                          child: SingleChildScrollView(
                            // Usa SingleChildScrollView per evitare overflow quando il contenuto supera la dimensione dello schermo
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ElevatedButtonTheme(
                                  data: ElevatedButtonThemeData(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.transparent,
                                      padding: EdgeInsets.zero,
                                      elevation: 0.0,
                                    ),
                                  ),
                                  child: ElevatedButton(
                                    style: ButtonStyle(
                                      fixedSize: MaterialStateProperty.all(
                                          const Size(230, 50)),
                                    ),
                                    onPressed: () {},
                                    child: Ink.image(
                                      image: const AssetImage(
                                          'assets/button_24.png'),
                                      fit: BoxFit.fill,
                                      child: InkWell(
                                        onTap: () {
                                          ToastBuilder.showTopScrollingSnackbar(
                                            context,
                                            Text(
                                              'Questo è un messaggio importante!',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 16.0),
                                            ),
                                            action: TextButton(
                                              onPressed: () {
                                                // Azione del pulsante
                                              },
                                              child: Text(
                                                'Annulla',
                                                style: TextStyle(
                                                    color: Colors.black),
                                              ),
                                            ),
                                          );
                                        },
                                        child: const Center(
                                          child: Text(
                                            'Training vs computer',
                                            style: TextStyle(
                                              color: Colors.black87,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                ElevatedButtonTheme(
                                  data: ElevatedButtonThemeData(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.transparent,
                                      padding: EdgeInsets.zero,
                                      elevation: 0.0,
                                    ),
                                  ),
                                  child: ElevatedButton(
                                    style: ButtonStyle(
                                      fixedSize: MaterialStateProperty.all(
                                          const Size(230, 50)),
                                    ),
                                    onPressed: () {},
                                    child: Ink.image(
                                      image: const AssetImage(
                                          'assets/button_24.png'),
                                      fit: BoxFit.fill, // Adjust as needed
                                      child: InkWell(
                                        onTap: () {
                                          // Handle button press
                                        },
                                        child: const Center(
                                          child: Text(
                                            'Multiplayer',
                                            style: TextStyle(
                                              color: Colors.black87,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text(
                                      'Follow us on',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 12),
                                      textAlign: TextAlign.center,
                                    ),
                                    ScaleTransition(
                                      scale: _animation,
                                      child: IconButton(
                                        onPressed: () {
                                          _launchURL(Uri.parse(
                                              'https://www.facebook.com/BuracoP/?show_switched_toast=0&show_invite_to_follow=0&show_switched_tooltip=0&show_podcast_settings=0&show_community_review_changes=0&show_community_rollback=0&show_follower_visibility_disclosure=0'));
                                        },
                                        icon: Image.asset(
                                          'assets/facebook-white.png',
                                          width: 20,
                                          height: 20,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 20),
                                    const Text(
                                      'Follow us on',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 12),
                                      textAlign: TextAlign.center,
                                    ),
                                    ScaleTransition(
                                      scale: _animation,
                                      child: IconButton(
                                        onPressed: () {
                                          _launchURL(Uri.parse(
                                              'https://www.instagram.com/buracoplus/'));
                                        },
                                        icon: Image.asset(
                                          'assets/ic_insta.png',
                                          width: 20,
                                          height: 20,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                              ],
                            ),
                          ),
                        ),

                        // Posiziona il blocco successivo attaccato al fondo dello schermo
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Stack(
                            clipBehavior: Clip.none,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 0.6,
                                height: 50,
                                margin: Platform.isMacOS
                                    ? const EdgeInsets.only(bottom: 40)
                                    : const EdgeInsets.only(bottom: 20),
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(
                                      0.2), // Imposta un colore con opacità
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(
                                        10), // Angoli arrotondati in alto a sinistra
                                    topRight: Radius.circular(10),
                                    bottomLeft: Radius.circular(
                                        10), // Angoli arrotondati in alto a sinistra
                                    bottomRight: Radius.circular(10),
                                  ),
                                ),
                                // Imposta un colore con opacità
                                child: Padding(
                                  padding: const EdgeInsets.all(
                                      5.0), // Aggiungi padding all'interno del Container
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      FloatingActionButton(
                                        heroTag: null,
                                        onPressed: () {},
                                        backgroundColor: Colors.transparent,
                                        splashColor: Colors.transparent,
                                        elevation: 0.0,
                                        child: Column(children: [
                                          Image.asset(
                                            'assets/mail.png',
                                            width: 25,
                                            height: 25,
                                          ),
                                          const Text('MESSAGES',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 10)),
                                        ]),
                                      ),
                                      FloatingActionButton(
                                        heroTag: null,
                                        onPressed: () {},
                                        backgroundColor: Colors.transparent,
                                        splashColor: Colors.transparent,
                                        elevation: 0.0,
                                        child: Column(children: [
                                          Image.asset(
                                            'assets/ic_contacts.png',
                                            width: 25,
                                            height: 25,
                                          ),
                                          const Text('CONTACTS',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 10)),
                                        ]),
                                      ),
                                      FloatingActionButton(
                                        heroTag: null,
                                        onPressed: () {},
                                        backgroundColor: Colors.transparent,
                                        splashColor: Colors.transparent,
                                        elevation: 0.0,
                                        child: Column(children: [
                                          Image.asset(
                                            'assets/ic_clubs.png',
                                            width: 25,
                                            height: 25,
                                          ),
                                          const Text('CLUBS',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 10)),
                                        ]),
                                      ),
                                      const SizedBox(height: 45, width: 45),
                                      FloatingActionButton(
                                        heroTag: null,
                                        onPressed: () {},
                                        backgroundColor: Colors.transparent,
                                        splashColor: Colors.transparent,
                                        elevation: 0.0,
                                        child: Column(children: [
                                          Image.asset(
                                            'assets/ic_settings.png',
                                            width: 25,
                                            height: 25,
                                          ),
                                          const Text('OPTIONS',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 10)),
                                        ]),
                                      ),
                                      FloatingActionButton(
                                        heroTag: null,
                                        onPressed: () {},
                                        backgroundColor: Colors.transparent,
                                        splashColor: Colors.transparent,
                                        elevation: 0.0,
                                        child: Column(children: [
                                          Image.asset(
                                            'assets/ic_rankings.png',
                                            width: 25,
                                            height: 25,
                                          ),
                                          const Text('RANKING',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 10)),
                                        ]),
                                      ),
                                      FloatingActionButton(
                                        heroTag: null,
                                        onPressed: () {},
                                        backgroundColor: Colors.transparent,
                                        splashColor: Colors.transparent,
                                        elevation: 0.0,
                                        child: Column(children: [
                                          Image.asset(
                                            'assets/ic_store.png',
                                            width: 25,
                                            height: 25,
                                          ),
                                          const Text('SHOP',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 10)),
                                        ]),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              // Pulsante che sporge fuori
                              Positioned(
                                top:
                                    -10, // Metà dell'altezza del FloatingActionButton per farlo sporgere correttamente
                                left: (MediaQuery.of(context).size.width * 0.6 -
                                        70) /
                                    2,
                                width: 70,
                                height: 70,
                                child: FloatingActionButton(
                                  heroTag: null,
                                  onPressed: () {},
                                  backgroundColor: Colors.transparent,
                                  splashColor: Colors.transparent,
                                  elevation: 0.0,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: Colors.white.withOpacity(0.2),
                                        width: 5.0,
                                      ),
                                    ),
                                    child: Container(
                                      width: 70,
                                      height: 70,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: Colors.white,
                                          width: 2.0,
                                        ),
                                      ),
                                      child: ClipOval(
                                        child: Image.asset(
                                          'assets/blankAvatar_2.png',
                                          width: 60,
                                          height: 60,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                AnimatedPositioned(
                  duration: const Duration(
                      milliseconds: 250), // Velocità dell'animazione
                  curve: Curves.easeInOut, // Tipo di animazione
                  right: isMenuVisible
                      ? 0
                      : -300, // Cambia questo valore per spostare il menu dentro e fuori
                  top: 70,
                  child: Material(
                    elevation: 4.0,
                    borderRadius: BorderRadius.circular(20.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white.withOpacity(
                              0.3), // Colore con opacità per l'effetto trasparente
                          borderRadius: BorderRadius.circular(20.0),
                          border: Border.all(color: Colors.white)),

                      width: 300, // Imposta la larghezza del menu
                      child: Column(
                        children: [
                          ListTile(
                            title: const Text('Privacy Policy'),
                            onTap: () {
                              _launchURL(Uri.parse(
                                  'https://www.buraco.plus/privacy_en.pdf'));
                            },
                          ),
                          const Divider(),
                          ListTile(
                            title: const Text('Ethic rules'),
                            onTap: () {
                              _launchURL(Uri.parse(
                                  'https://www.buraco.plus/en/ethic-rules/'));
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 10.0,
                  left: 0,
                  right: 0,
                  child: Image.asset(
                    'assets/logo-and-cards.png',
                    width: 100,
                    height: 60,
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
              left: Platform.isMacOS ? 40.0 : 150.0,
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
                onPressed: () {},
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
              right: 0.0,
              child: FloatingActionButton(
                heroTag: null,
                onPressed: _toggleMenu,
                backgroundColor: Colors.transparent,
                splashColor: Colors.transparent,
                hoverColor: Colors.transparent,
                focusColor: Colors.transparent,
                foregroundColor: Colors.transparent,
                hoverElevation: 0,
                focusElevation: 0,
                elevation: 0.0,
                child: const Column(children: [
                  Icon(
                    Icons.privacy_tip,
                    color: Colors.white,
                  ),
                  Text('PRIVACY', style: TextStyle(color: Colors.white)),
                ]),
              ),
            ),
          ],
        ),
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

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
