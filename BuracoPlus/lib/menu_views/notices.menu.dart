import 'package:buracoplus/menu_views/text/titles.dart' show NoticeTitle;
import 'package:flutter/cupertino.dart'
    show
        Alignment,
        AnimatedPositioned,
        Border,
        BorderRadius,
        BoxDecoration,
        BuildContext,
        Color,
        Container,
        Curves,
        EdgeInsets,
        Icon,
        LinearGradient,
        MainAxisAlignment,
        Radius,
        Row,
        StatelessWidget,
        Widget;
import 'package:flutter/material.dart'
    show
        Alignment,
        AnimatedPositioned,
        Border,
        BorderRadius,
        BoxDecoration,
        BuildContext,
        Colors,
        Container,
        CrossAxisAlignment,
        Curves,
        EdgeInsets,
        Icon,
        IconButton,
        Icons,
        LinearGradient,
        MainAxisAlignment,
        Material,
        Positioned,
        Row,
        Stack,
        StatelessWidget,
        Widget;

class NoticesMenu extends StatelessWidget {
  final bool isNoticesVisible;
  //final VoidCallback onClose;

  const NoticesMenu({
    required this.isNoticesVisible,
    //required this.onClose,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeInOut,
      right: isNoticesVisible ? 15 : -500,
      top: 50,
      child: Material(
        elevation: 4.0,
        borderRadius: BorderRadius.circular(20.0),
        child: Container(
          width: 400,
          height: 620,
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
                padding: const EdgeInsets.all(15.0),
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
                      icon: const Icon(Icons.close, color: Colors.white),
                      onPressed: () {},
                      //onPressed: vedi come fare
                    ),
                  ],
                ),
              ),
              Positioned(
                  top: 140,
                  bottom: 15,
                  left: 15,
                  right: 15,
                  child: Container(
                    padding: const EdgeInsets.all(15.0),
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(240, 240, 240, 0.0)
                          .withOpacity(1.0),
                      borderRadius: BorderRadius.circular(20.0),
                      border: const Border(),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
