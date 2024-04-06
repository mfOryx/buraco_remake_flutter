import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

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
    return Scaffold(
      body: Stack(alignment: Alignment.topCenter, children: [
        Container(
            decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color.fromRGBO(114, 60, 125, 1.0), // Colore medio lato sinistro
              Color.fromRGBO(141, 107, 147, 1.0), // Colore medio lato superiore
              Color.fromRGBO(96, 132, 166, 1.0), // Colore medio lato inferiore
              Color.fromRGBO(88, 104, 147, 1.0), // Colore medio lato destro
            ],
            stops: [
              0.0,
              0.33,
              0.66,
              1.0
            ], // Regola questi valori per i tuoi bisogni
          ),
        )),
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
        Column(
          children: [
            Image.asset(
              'assets/logo-and-cards.png',
              width: 100,
              height: 60,
            ),
            const SizedBox(
              height: 60,
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
                  fixedSize: MaterialStateProperty.all(const Size(230, 50)),
                ),
                onPressed: () {},
                child: Ink.image(
                  image: const AssetImage('assets/button_24.png'),
                  fit: BoxFit.fill,
                  child: InkWell(
                    onTap: () {},
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
                  fixedSize: MaterialStateProperty.all(const Size(230, 50)),
                ),
                onPressed: () {},
                child: Ink.image(
                  image: const AssetImage('assets/button_24.png'),
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
                  style: TextStyle(color: Colors.white, fontSize: 12),
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
                  style: TextStyle(color: Colors.white, fontSize: 12),
                  textAlign: TextAlign.center,
                ),
                ScaleTransition(
                  scale: _animation,
                  child: IconButton(
                    onPressed: () {
                      _launchURL(
                          Uri.parse('https://www.instagram.com/buracoplus/'));
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
            GestureDetector(
              onTap: () {
                _launchURL(Uri.parse('https://www.buraco.plus/privacy_en.pdf'));
              },
              child: const Text(
                'PRIVACY POLICY',
                style: TextStyle(
                  color: Colors.white,
                  decoration: TextDecoration.underline,
                  decorationColor: Colors.white,
                  fontSize: 10,
                  fontStyle: FontStyle.italic,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            GestureDetector(
              onTap: () {
                _launchURL(
                    Uri.parse('https://www.buraco.plus/en/ethic-rules/'));
              },
              child: const Text(
                'ETHIC RULES',
                style: TextStyle(
                  color: Colors.white,
                  decoration: TextDecoration.underline,
                  decorationColor: Colors.white,
                  fontSize: 10,
                  fontStyle: FontStyle.italic,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 18,
            ),
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Positioned(
                  child: Container(
                    width: 500,
                    height: 55,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                    ),
                  ),
                ),
                Positioned(
                  bottom: -10.0,
                  left: 10.0,
                  child: FloatingActionButton(
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
                          style: TextStyle(color: Colors.white, fontSize: 10)),
                    ]),
                  ),
                ),
                Positioned(
                  bottom: -10.0,
                  left: 80.0,
                  child: FloatingActionButton(
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
                          style: TextStyle(color: Colors.white, fontSize: 10)),
                    ]),
                  ),
                ),
                Positioned(
                  bottom: -10.0,
                  left: 155.0,
                  child: FloatingActionButton(
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
                          style: TextStyle(color: Colors.white, fontSize: 10)),
                    ]),
                  ),
                ),
                Positioned(
                  bottom: 0.0,
                  left: 220.0,
                  child: FloatingActionButton(
                    heroTag: null,
                    onPressed: () {},
                    backgroundColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    elevation: 0.0,
                    child: Container(
                      width: 45,
                      height: 45,
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
                          width: 30,
                          height: 30,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: -10.0,
                  right: 155.0,
                  child: FloatingActionButton(
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
                          style: TextStyle(color: Colors.white, fontSize: 10)),
                    ]),
                  ),
                ),
                Positioned(
                  bottom: -10.0,
                  right: 80.0,
                  child: FloatingActionButton(
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
                          style: TextStyle(color: Colors.white, fontSize: 10)),
                    ]),
                  ),
                ),
                Positioned(
                  bottom: -10.0,
                  right: 10.0,
                  child: FloatingActionButton(
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
                          style: TextStyle(color: Colors.white, fontSize: 10)),
                    ]),
                  ),
                ),
              ],
            ),
          ],
        ),
      ]),
      floatingActionButton: Stack(
        children: [
          Positioned(
            width: 70,
            bottom: 0.0,
            left: 150.0,
            child: FloatingActionButton(
              heroTag: null,
              onPressed: () {
                Navigator.of(context).pop();
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

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
