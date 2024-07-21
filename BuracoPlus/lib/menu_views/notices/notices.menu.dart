import 'package:buracoplus/menu_views/notices/text.dart'
    show NoticeTextButton, NoticeTextTitle;
import 'package:buracoplus/menu_views/notices/variables.dart'
    show menuBorderRadius, menuBoxInside;
import 'package:buracoplus/menu_views/notices/buttons/menu_buttons.dart'
    show NoticeLeftButton, NoticeRightButton;
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
        Expanded,
        Icon,
        IconButton,
        Icons,
        MainAxisAlignment,
        Material,
        MaterialType,
        MediaQuery,
        Positioned,
        Row,
        Stack,
        StackFit,
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
    const padding1 = 10.0;
    const padding2 = 30.0;
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final topPosition = (screenHeight * 0.15) / 1.8;
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
            fit: StackFit.loose,
            children: [
              Container(
                width: double.infinity,
                height: screenHeight * 0.35,
                padding: const EdgeInsets.only(
                  left: 10,
                  top: 10,
                  bottom: 100,
                ),
                decoration: menuBorderRadius,
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
                      padding: const EdgeInsets.only(
                        left: 10,
                      ),
                      onPressed: onClose,
                    ),
                  ],
                ),
              ),
              Positioned(
                top: topPosition,
                left: padding2,
                right: padding2,
                child: const Row(
                  children: <Widget>[
                    Expanded(
                      child: NoticeLeftButton(
                        noticeTextButton: NoticeTextButton(
                          noticeText: 'PERSONAL',
                        ),
                      ),
                    ),
                    Expanded(
                      child: NoticeRightButton(
                        noticeTextButton: NoticeTextButton(
                          noticeText: 'CLUB',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: screenHeight * 0.15,
                bottom: padding1,
                left: padding1,
                right: padding1,
                child: Container(
                  decoration: menuBoxInside,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
