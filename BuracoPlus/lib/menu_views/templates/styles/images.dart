import 'package:flutter/material.dart'
    show
        BlendMode,
        BuildContext,
        Color,
        FilterQuality,
        Image,
        StatelessWidget,
        Widget;

class NoticesBlend extends StatelessWidget {
  const NoticesBlend({required this.custNoticesBlend, super.key});

  final Color custNoticesBlend;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/changeme.svg',
      width: 350,
      color: custNoticesBlend,
      filterQuality: FilterQuality.high,
      colorBlendMode: BlendMode.dstIn,
    );
  }
}
