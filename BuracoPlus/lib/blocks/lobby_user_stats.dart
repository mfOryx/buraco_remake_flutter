import 'package:flutter/material.dart';

class LobbyUserStats extends StatelessWidget {
  final String stat;
  final String image;
  const LobbyUserStats(this.stat, this.image, {super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.only(left: 4, top: 2, bottom: 2, right: 4),
        margin: const EdgeInsets.only(right: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: const Color(0xff2c2237)),
        child: Row(
          children: [
            Image.asset(
              'assets/lobby/$image',
              height: 25,
            ),
            const SizedBox(
              width: 5,
            ),
            Text(
              stat.toString(),
              style: const TextStyle(
                  color: Colors.white,
                  shadows: [
                    Shadow(
                        color: Colors.black,
                        offset: Offset(3, 3),
                        blurRadius: 2)
                  ],
                  fontSize: 17,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
