import 'package:buracoplus/menu_views/templates/screens/screen_1.dart'
    show Screen1;
import 'package:flutter/material.dart'
    show BuildContext, Scaffold, State, StatefulWidget, Widget;

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
    return const Scaffold(
      body: Screen1(),
    );
  }
}
