import 'package:flutter/material.dart'
    show
        AnimatedPositioned,
        Border,
        BorderRadius,
        BoxDecoration,
        BuildContext,
        Colors,
        Column,
        Container,
        Curves,
        ListTile,
        Material,
        StatelessWidget,
        Text,
        Widget;

//show TranslationManager;

class NoticesMenu extends StatelessWidget {
  final bool isNoticesVisible;

  const NoticesMenu({
    required this.isNoticesVisible,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    //final translationManager = Provider.of<TranslationManager>(context);
    return AnimatedPositioned(
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeInOut,
      right: isNoticesVisible ? 15 : -500,
      top: 70,
      child: Material(
        elevation: 4.0,
        borderRadius: BorderRadius.circular(20.0),
        child: Container(
          width: 500,
          height: 605,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.3),
            borderRadius: BorderRadius.circular(20.0),
            border: Border.all(
              color: Colors.white,
            ),
          ),
          child: const Column(
            children: [
              ListTile(
                //title: NoticeTitle(
                // translationManager.translate(
                // noticeTitle: 'NOTICE',
                // ),
                title: Text(
                  'NOTICE',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
