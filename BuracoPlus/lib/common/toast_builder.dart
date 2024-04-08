import 'package:flutter/material.dart';

class ToastBuilder {
  static void showTopScrollingSnackbar(BuildContext context, Widget message,
      {Widget? action}) {
    OverlayEntry? overlayEntry;
    overlayEntry = OverlayEntry(
      builder: (context) => TopScrollingSnackbar(
        message: message,
        action: action,
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
  final Widget? action;
  final VoidCallback onHide;
  const TopScrollingSnackbar(
      {super.key, required this.message, this.action, required this.onHide});

  @override
  _TopScrollingSnackbarState createState() => _TopScrollingSnackbarState();
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
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeOut,
      top: _isVisible ? 0 : -100,
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
            color: Colors.yellow.withOpacity(0.2),
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(child: widget.message),
              if (widget.action != null) widget.action!,
            ],
          ),
        ),
      ),
    );
  }
}
