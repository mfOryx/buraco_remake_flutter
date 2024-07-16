import 'package:flutter/material.dart';

class Toast {
  static void showTopScrollingSnackbar(
      BuildContext context, Widget message, Color bgColor) {
    OverlayEntry? overlayEntry;
    overlayEntry = OverlayEntry(
      builder: (context) => TopScrollingSnackbar(
        message: message,
        bgColor: bgColor,
        onHide: () {
          overlayEntry?.remove();
        },
      ),
    );

    Overlay.of(context).insert(overlayEntry);
  }
}

class TopScrollingSnackbar extends StatefulWidget {
  final Widget message;
  final Color bgColor;
  final VoidCallback onHide;

  const TopScrollingSnackbar({
    super.key,
    required this.message,
    required this.bgColor,
    required this.onHide,
  });

  @override
  State<TopScrollingSnackbar> createState() => _TopScrollingSnackbarState();
}

class _TopScrollingSnackbarState extends State<TopScrollingSnackbar> {
  bool _isVisible = false;

  void hideSnackbar() {
    setState(() {
      _isVisible = false;
    });

    Future.delayed(const Duration(milliseconds: 600), () {
      if (mounted) {
        //Navigator.of(context).pop();
      }
    });
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 50), () {
      setState(() {
        _isVisible = true;
      });
    });
    Future.delayed(const Duration(seconds: 5), hideSnackbar);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      duration: const Duration(milliseconds: 1000),
      curve: Curves.easeOut,
      top: _isVisible ? 0 : -200,
      height: 60,
      left: MediaQuery.of(context).size.width * 0.1,
      right: MediaQuery.of(context).size.width * 0.1,
      child: Material(
        elevation: 4.0,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
          decoration: BoxDecoration(
            color: widget.bgColor.withOpacity(0.2), // Usa widget.bgColor qui
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(child: widget.message),
            ],
          ),
        ),
      ),
    );
  }
}
