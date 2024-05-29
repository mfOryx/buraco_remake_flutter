import 'dart:io';
import 'package:buracoplus/blocks/privacy_button.dart';
import 'package:buracoplus/blocks/privacy_menu.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:buracoplus/common/toast_with_button.dart';
import 'common/translation_manager.dart';
import 'create_table_single_player.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  bool isMenuVisible = false;

  bool isIOS() {
    return Platform.isIOS;
  }

  bool isAndroid() {
    return Platform.isAndroid;
  }

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
    final translationManager = Provider.of<TranslationManager>(context);
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
                        opacity: 0.2,
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
                                          'assets/buttons/button_24.png'),
                                      fit: BoxFit.fill,
                                      child: InkWell(
                                        onTap: () {
                                          ToastWithButton
                                              .showTopScrollingSnackbar(
                                            context,
                                            Text(
                                              translationManager.translate('txtThisIsAnImportantMessage!'),
                                              style: const TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 16.0),
                                            ),
                                            action: TextButton(
                                              onPressed: () {
                                                // Azione del pulsante
                                              },
                                              child: Text(
                                                translationManager.translate('txtCancel'),
                                                style: const TextStyle(
                                                    color: Colors.black),
                                              ),
                                            ),
                                          );
                                        },
                                        child: Center(
                                          child: Text(
                                            translationManager.translate('txtTrainingVSComputer'),
                                            style: const TextStyle(
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
                                          'assets/buttons/button_24.png'),
                                      fit: BoxFit.fill, // Adjust as needed
                                      child: InkWell(
                                        onTap: () {
                                          // Handle button press
                                        },
                                        child: Center(
                                          child: Text(
                                            translationManager.translate('txtMultiplayer'),
                                            style: const TextStyle(
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
                                    Text(
                                      translationManager.translate('txtFollowUsOn'),
                                      style: const TextStyle(
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
                                          'assets/socialMediaIcons/facebook-white.png',
                                          width: 20,
                                          height: 20,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 20),
                                    Text(
                                      translationManager.translate('txtFollowUsOn'),
                                      style: const TextStyle(
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
                                          'assets/socialMediaIcons/ic_insta.png',
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
                                            'assets/menuIcons/mail.png',
                                            width: 25,
                                            height: 25,
                                          ),
                                          Text(translationManager.translate('txtMessages').toUpperCase(),
                                              style: const TextStyle(
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
                                            'assets/menuIcons/ic_contacts.png',
                                            width: 25,
                                            height: 25,
                                          ),
                                          Text(translationManager.translate('txtContacts').toUpperCase(),
                                              style: const TextStyle(
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
                                            'assets/menuIcons/ic_clubs.png',
                                            width: 25,
                                            height: 25,
                                          ),
                                          Text(translationManager.translate('txtClubs').toUpperCase(),
                                              style: const TextStyle(
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
                                            'assets/menuIcons/ic_settings.png',
                                            width: 25,
                                            height: 25,
                                          ),
                                          Text(translationManager.translate('txtOptions').toUpperCase(),
                                              style: const TextStyle(
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
                                            'assets/menuIcons/ic_rankings.png',
                                            width: 25,
                                            height: 25,
                                          ),
                                          Text(translationManager.translate('txtRankings').toUpperCase(),
                                              style: const TextStyle(
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
                                            'assets/menuIcons/ic_store.png',
                                            width: 25,
                                            height: 25,
                                          ),
                                          Text(translationManager.translate('txtShop').toUpperCase(),
                                              style: const TextStyle(
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
                                          'assets/menuIcons/blankAvatar_2.png',
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
                //privacy section
                PrivacyButton(toggleMenu: _toggleMenu),
                PrivacyMenu(
                  isMenuVisible: isMenuVisible,
                  launchURL: launchUrl,
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
              left: Platform.isMacOS  ? 40.0 : (isIOS() ? 120.0 : 40.0),
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
                  Text(translationManager.translate('txtQuit').toUpperCase(), style: const TextStyle(color: Colors.white)),
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
                    Text(translationManager.translate('txtTrain').toUpperCase(), style: const TextStyle(color: Colors.white)),
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
