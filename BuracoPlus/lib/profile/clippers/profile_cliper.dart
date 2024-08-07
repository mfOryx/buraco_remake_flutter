import 'package:flutter/material.dart';

class ProfileClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var height = size.height;
    var width = size.width;
    var heightoffset = height * 0.15;
    final path = Path();

    path.lineTo(0, height - heightoffset);
    path.quadraticBezierTo(width * 0.5, height, width, height - heightoffset);
    path.lineTo(width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}


// used for giving shadow to the clipper
class ProfileClipperShadow extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var height = size.height;
    var width = size.width;
    var heightoffset = height * 0.2;
    final path = Path();

    path.lineTo(0, height - heightoffset);
    path.quadraticBezierTo(width * 0.5, height, width, height - heightoffset);
    path.lineTo(width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}