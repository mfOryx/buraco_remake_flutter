import 'package:flutter/material.dart';

class GameplaySP extends StatefulWidget {
  const GameplaySP({super.key});

  @override
  State<GameplaySP> createState() => _GameplaySPState();
}

class _GameplaySPState extends State<GameplaySP> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF344266),
      body: SafeArea(
        bottom:
            false, // Avoid insets at the bottom (not needed for iPhone notch)
        child: Row(
          children: [
            Container(
              color: Colors.black,
              width: 50,
              height: MediaQuery.of(context)
                  .padding
                  .left, // Height to cover the notch area
            ),
          ],
        ),
      ),
    );
  }
}
