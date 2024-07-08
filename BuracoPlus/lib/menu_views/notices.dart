import 'package:buracoplus/blocks/privacy_button.dart';
import 'package:buracoplus/blocks/privacy_menu.dart';
import 'package:buracoplus/menu_views/templates/styles/text.dart' show CustText;
import 'package:buracoplus/menu_views/variables.dart' show mainGradient;
import 'package:flutter/material.dart'
    show BlendMode, BoxDecoration, BuildContext, Center, Container, FilterQuality, FloatingActionButton, Image, MainAxisAlignment, MainAxisSize, Navigator, Row, Scaffold, SizedBox, State, StatefulWidget, Widget;
import 'package:url_launcher/url_launcher.dart';

class Notices extends StatefulWidget {
  const Notices({super.key});

  @override
  State<Notices> createState() {
    return _NoticesState();
  }
}
  void _toggleMenu() {}

class _NoticesState extends State<Notices> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: mainGradient,
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const CustText(
                custText: 'NOTICE',
              ),
              const PrivacyButton(
                toggleMenu: _toggleMenu,
              ),
              PrivacyMenu(
              launchURL: (url) async {
                if (!await launchUrl(url)) {
                  throw 'Could not launch $url';
                }
              }, isMenuVisible: true,
            ),
              const SizedBox(
                width: 100,
              ),
              //ElevatedButton(
              FloatingActionButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Image.asset(
                  'assets/ic_check_gradiant2.png',
                  //color: custNoticesBlend,
                  filterQuality: FilterQuality.high,
                  colorBlendMode: BlendMode.dstIn,
                  width: 20,
                  height: 20,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
