import 'package:buracoplus/menu_views/buttons/club.button.dart' show ClubButton;
import 'package:buracoplus/menu_views/buttons/personal_button.dart'
    show PersonalButton;
import 'package:buracoplus/menu_views/text/titles.dart' show NoticeTitle;
import 'package:flutter/material.dart'
    show
        Alignment,
        AnimatedPositioned,
        Border,
        BorderRadius,
        BoxDecoration,
        BuildContext,
        Color,
        Colors,
        Container,
        CrossAxisAlignment,
        Curves,
        Directionality,
        EdgeInsets,
        FontStyle,
        FontWeight,
        Icon,
        IconButton,
        Icons,
        LinearGradient,
        MainAxisAlignment,
        Material,
        MediaQuery,
        Positioned,
        Radius,
        Row,
        Stack,
        StatelessWidget,
        Text,
        TextDecoration,
        TextDirection,
        TextStyle,
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
    return AnimatedPositioned(
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeInOut,
      //right: isNoticesVisible ? 15 : -500,
      top: MediaQuery.of(context).size.height < 550 ? 10.0 : 20.0,
      left: Directionality.of(context) == TextDirection.rtl
          ? isNoticesVisible
              ? 15
              : -500
          : null,
      right: Directionality.of(context) == TextDirection.rtl
          ? null
          : isNoticesVisible
              ? 15
              : -500,
      child: Material(
        elevation: 4.0,
        borderRadius: BorderRadius.circular(20.0),
        child: Container(
          width: 400,
          height: 400,
          decoration: BoxDecoration(
            color: const Color.fromARGB(212, 212, 212, 212).withOpacity(0.9),
            borderRadius: BorderRadius.circular(20.0),
            border: const Border(),
          ),
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              Container(
                width: double.infinity,
                height: 250,
                padding: const EdgeInsets.only(
                  left: 15,
                  top: 15,
                  right: 15,
                  bottom: 15,
                ),
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color.fromARGB(255, 90, 110, 150),
                      Color.fromARGB(255, 115, 70, 130)
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(20.0),
                    bottom: Radius.elliptical(160, 10),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const NoticeTitle(
                      noticeTitle: 'NOTICE',
                    ),
                    IconButton(
                      alignment: Alignment.topRight,
                      icon: const Icon(
                        Icons.close,
                        color: Colors.white,
                      ),
                      padding: const EdgeInsets.only(
                        left: 40.0,
                        right: 5.0,
                        bottom: 15.0,
                      ),
                      onPressed: onClose,
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 115,
                bottom: 11,
                left: 11,
                right: 11,
                child: Container(
                  padding: const EdgeInsets.all(15.0),
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(240, 240, 240, 0.0)
                        .withOpacity(1.0),
                    borderRadius: BorderRadius.circular(20.0),
                    border: const Border(),
                  ),
                ),
              ),
              Positioned(
                top: 60,
                bottom: 530,
                left: 28,
                right: 200,
                child: PersonalButton(
                  onTap: () {},
                  child: const Text(
                    style: TextStyle(
                      letterSpacing: 0.2,
                      decoration: TextDecoration.none,
                      backgroundColor: Colors.transparent,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.normal,
                      fontSize: 12,
                      color: Colors.white,
                    ),
                    'PERSONAL',
                  ),
                ),
              ),
              Positioned(
                top: 60,
                bottom: 530,
                left: 200,
                right: 28,
                child: ClubButton(
                  onTap: () {},
                  child: const Text(
                    style: TextStyle(
                      letterSpacing: 0.2,
                      decoration: TextDecoration.none,
                      backgroundColor: Colors.transparent,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.normal,
                      fontSize: 12,
                      color: Colors.white,
                    ),
                    'CLUB',
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
