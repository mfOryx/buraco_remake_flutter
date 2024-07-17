import 'package:buracoplus/menu_views/all_text.dart';
import 'package:buracoplus/menu_views/notices/buttons/animations.dart';
import 'package:buracoplus/menu_views/all_variables.dart';
import 'package:flutter/material.dart'
    show
        Alignment,
        AnimatedPositioned,
        Border,
        BorderRadius,
        BorderSide,
        BoxDecoration,
        BuildContext,
        Color,
        Colors,
        Container,
        CrossAxisAlignment,
        Curves,
        Directionality,
        EdgeInsets,
        Icon,
        IconButton,
        Icons,
        MainAxisAlignment,
        Material,
        MaterialType,
        MediaQuery,
        Positioned,
        Radius,
        Row,
        Stack,
        StatelessWidget,
        TextDirection,
        VoidCallback,
        Widget;

class NoticesMenu extends StatelessWidget {
  final bool isNoticesVisible;
  final VoidCallback onClose;

  const NoticesMenu({
    required this.isNoticesVisible,
    required this.onClose,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return AnimatedPositioned(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      top: MediaQuery.of(context).size.height < 550 ? 15.0 : 20.0,
      bottom: MediaQuery.of(context).size.height < 550 ? 15.0 : 20.0,
      left: Directionality.of(context) == TextDirection.rtl
          ? isNoticesVisible
              ? 15
              : -500
          : null,
      right: Directionality.of(context) == TextDirection.rtl
          ? null
          : isNoticesVisible
              ? 33
              : -500,
      child: Material(
        elevation: 100.0,
        type: MaterialType.canvas,
        borderRadius: BorderRadius.circular(20.0),
        shadowColor: const Color.fromARGB(255, 80, 110, 150),
        child: Container(
          width: screenWidth * 0.35,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.white,
              width: 0.2,
            ),
            borderRadius: BorderRadius.circular(20.0),
            color: const Color.fromARGB(212, 212, 212, 212).withOpacity(0.9),
          ),
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              Container(
                width: double.infinity,
                height: screenHeight * 0.35,
                padding: const EdgeInsets.only(
                  top: 10,
                  left: 10,
                  bottom: 100,
                ),
                decoration: const BoxDecoration(
                  gradient: noticeGradient,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(20.0),
                    bottom: Radius.elliptical(160, 10),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const NoticeTextTitle(
                      noticeText: 'NOTICE',
                    ),
                    IconButton(
                      alignment: Alignment.topRight,
                      icon: const Icon(
                        Icons.close,
                        color: Colors.white,
                      ),
                      padding: const EdgeInsets.only(),
                      onPressed: onClose,
                    ),
                  ],
                ),
              ),
              Positioned(
                top: screenHeight * 0.15,
                bottom: 10,
                left: 10,
                right: 10,
                child: Container(
                  decoration: BoxDecoration(
                    border: const Border(
                      top: BorderSide.none,
                      bottom: BorderSide.none,
                      right: BorderSide.none,
                      left: BorderSide.none,
                    ),
                    borderRadius: BorderRadius.circular(20.0),
                    color: const Color.fromRGBO(240, 240, 240, 0.0)
                        .withOpacity(1.0),
                  ),
                ),
              ),
              Positioned(
                top: 35,
                left: 26,
                right: 163,
                child: NoticeButton(
                  onTap: () {},
                  //decor: MenuButtonDecor1.getDecoration(_isTapped),
                  child: const NoticeTextButton(
                    noticeText: 'PERSONAL',
                  ),
                ),
              ),
              Positioned(
                top: 35,
                left: 163,
                right: 26,
                child: NoticeButton(
                  onTap: () {},
                  //decor: MenuButtonDecor2.getDecoration(_isTapped),
                  child: const NoticeTextButton(
                    noticeText: 'CLUB',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
