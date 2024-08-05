import 'package:buracoplus/menu_views/notices/text.dart' show NoticeTextButton;
import 'package:flutter/material.dart'
    show
        BorderRadius,
        BuildContext,
        Color,
        Colors,
        EdgeInsets,
        ElevatedButton,
        Expanded,
        MainAxisAlignment,
        OutlinedBorder,
        Radius,
        RoundedRectangleBorder,
        Row,
        State,
        StatefulWidget,
        Widget;

class ButtonsNotices extends StatefulWidget {
  const ButtonsNotices({
    super.key,
  });

  @override
  _ButtonsNoticesState createState() {
    return _ButtonsNoticesState();
  }
}

class _ButtonsNoticesState extends State<ButtonsNotices> {
  bool isFirstButtonSelected = true;

  void _toggleButtons() {
    setState(() {
      isFirstButtonSelected = !isFirstButtonSelected;
    });
  }

  ElevatedButton _buildButton(
      String text, bool isSelected, OutlinedBorder? shape) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        foregroundColor: isSelected
            ? const Color.fromARGB(115, 117, 36, 120)
            : const Color.fromARGB(115, 59, 6, 61),
        backgroundColor: isSelected
            ? const Color.fromARGB(115, 59, 6, 61)
            : const Color.fromARGB(115, 117, 36, 120),
        shape: shape,
        elevation: 5.0,
        padding: EdgeInsets.zero,
        shadowColor: Colors.black.withOpacity(
          isSelected ? 0.6 : 0.0,
        ),
      ),
      onPressed: _toggleButtons,
      child: NoticeTextButton(
        noticeText: text,
      ),
    );
  }

  RoundedRectangleBorder _firstButtonShape() {
    return const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20.0),
        topRight: Radius.circular(0),
        bottomLeft: Radius.circular(20.0),
        bottomRight: Radius.circular(0),
      ),
    );
  }

  RoundedRectangleBorder _secondButtonShape() {
    return const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(0),
        topRight: Radius.circular(20.0),
        bottomLeft: Radius.circular(0),
        bottomRight: Radius.circular(20.0),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: _buildButton(
            'PERSONAL',
            isFirstButtonSelected,
            _firstButtonShape(),
          ),
        ),
        Expanded(
          child: _buildButton(
            'CLUB',
            !isFirstButtonSelected,
            _secondButtonShape(),
          ),
        ),
      ],
    );
  }
}
