import 'package:clip_shadowx/clip_shadowx.dart';
import 'package:flutter/material.dart';

class ClubBadge extends StatelessWidget {
  const ClubBadge({super.key, required this.isTablet});
  final bool isTablet;
  @override
  Widget build(BuildContext context) {
    return ClipShadow(
      clipper: BadgeClipper(),
      shadows: [
        BoxShadow(
          color: Colors.black.withOpacity(0.4),
          offset: const Offset(-2, 5),
          blurRadius: 5,
          spreadRadius: 2,
        ),
      ],
      child: Container(
        width: isTablet ? 130 : 100,
        height: isTablet ? 50 : 30,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.6),
              offset: const Offset(3, 4),
              blurRadius: isTablet ? 1 : 0.5,
              spreadRadius: isTablet ? 1 : 0.2,
            ),
          ],
        ),
        child: Row(
          // mainAxisSize: MainAxisSize.min,
          // crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(left: isTablet ? 20 : 20),
              child: Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'CLUB [BOSS]',
                        style: TextStyle(
                          color: const Color(0xFF770F90),
                          fontWeight: FontWeight.bold,
                          fontSize: isTablet ? 10 : 6,
                        ),
                      ),
                      Text(
                        'BURACO88',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: isTablet ? 12 : 8,
                            height: 1),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Container(
                      width: isTablet ? 30 : 20,
                      height: isTablet ? 30 : 20,
                      child: Image.asset(
                        'assets/shop/special.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BadgeClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final Path path = Path();
    path.lineTo(17.0, 0.0);
    path.lineTo(0.0, size.height / 2);
    path.lineTo(17.0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0.0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
