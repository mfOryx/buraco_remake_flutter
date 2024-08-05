import 'package:flutter/material.dart'
    show
        Alignment,
        AnimatedPositioned,
        Border,
        BorderRadius,
        BoxDecoration,
        BuildContext,
        Center,
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
        State,
        StatefulWidget,
        Text,
        TextDecoration,
        TextDirection,
        TextStyle,
        VoidCallback,
        Widget;
import 'package:buracoplus/menu_views/notices/buttons/menu_buttons.dart'
    show ButtonsNotices;
import 'package:buracoplus/menu_views/notices/messages_list.dart'
    show InfiniteScrollNotices;
import 'package:buracoplus/menu_views/notices/text.dart' show NoticeTextTitle;
import 'package:buracoplus/menu_views/notices/variables.dart'
    show menuBorderRadius, menuBoxInside;

class NoticesMenu extends StatefulWidget {
  static const double padding1 = 10.0;
  static const double padding2 = 30.0;
  static const double borderRadiusValue = 20.0;
  final bool isNoticesVisible;
  final VoidCallback onClose;
  final List<Map<String, dynamic>> noticeList;

  const NoticesMenu({
    required this.isNoticesVisible,
    required this.onClose,
    required this.noticeList,
    super.key,
  });

  @override
  State<NoticesMenu> createState() {
    return _NoticesMenuState();
  }
}

class _NoticesMenuState extends State<NoticesMenu> {
  @override
  Widget build(BuildContext context) {
    const padding1 = 10.0;
    const padding2 = 30.0;
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final topPosition = (screenHeight * 0.15) / 1.8;

    return AnimatedPositioned(
      duration: const Duration(
        milliseconds: 400,
      ),
      curve: Curves.easeInOut,
      top: MediaQuery.of(context).size.height < 550 ? 10.0 : 20.0,
      bottom: MediaQuery.of(context).size.height < 550 ? 10.0 : 20.0,
      left: Directionality.of(context) == TextDirection.rtl
          ? widget.isNoticesVisible
              ? 15
              : -screenWidth
          : null,
      right: Directionality.of(context) == TextDirection.rtl
          ? null
          : widget.isNoticesVisible
              ? 15
              : -screenWidth,
      child: Material(
        elevation: 100.0,
        type: MaterialType.canvas,
        borderRadius: BorderRadius.circular(20.0),
        shadowColor: const Color.fromARGB(255, 80, 110, 150),
        child: Container(
          width: screenWidth * 0.34,
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
                      onPressed: widget.onClose,
                    ),
                  ],
                ),
              ),
              Positioned(
                height: screenHeight * 0.05,
                top: topPosition,
                left: padding2,
                right: padding2,
                child: const Row(
                  children: <Widget>[
                    Expanded(
                      child: ButtonsNotices(),
                    ),
                  ],
                ),
              ),
              if (widget.noticeList.isEmpty)
                Positioned(
                  top: screenHeight * 0.15,
                  bottom: padding1,
                  left: padding1,
                  right: padding1,
                  child: Container(
                    decoration: menuBoxInside,
                    child: const Center(
                      child: Text(
                        'Notice is empty',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16.0,
                          wordSpacing: 0.0,
                          letterSpacing: 0.2,
                          decoration: TextDecoration.none,
                        ),
                      ),
                    ),
                  ),
                )
              else
                Positioned(
                  top: screenHeight * 0.155,
                  bottom: padding1,
                  left: padding1,
                  right: padding1,
                  child: Container(
                    decoration: menuBoxInside,
                    child: InfiniteScrollNotices(
                      getNotices: widget.noticeList,
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
