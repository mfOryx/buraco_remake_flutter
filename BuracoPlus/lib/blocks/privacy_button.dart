import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:buracoplus/common/translation_manager.dart';

class PrivacyButton extends StatelessWidget {
  final VoidCallback toggleMenu;

  const PrivacyButton({super.key, required this.toggleMenu});

  @override
  Widget build(BuildContext context) {
    final translationManager = Provider.of<TranslationManager>(context);
    return Positioned(
      top: MediaQuery.of(context).size.height < 550 ? 10.0 : 20.0,
      left: Directionality.of(context) == TextDirection.rtl ? 40 : null,
      right: Directionality.of(context) == TextDirection.rtl ? null : 40,
      width: 70,
      height: 70,
      child: Column(
        children: [
          IconButton(
            icon: const Icon(Icons.privacy_tip, color: Colors.white),
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.transparent,
              backgroundColor: Colors.transparent,
            ),
            onPressed: toggleMenu,
          ),
          const SizedBox(height: 1),
          Text(translationManager.translate('txtPrivacy').toUpperCase(),
              style: const TextStyle(color: Colors.white)),
        ],
      ),
    );
  }
}
