import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:buracoplus/common/translation_manager.dart';

class PrivacyMenu extends StatelessWidget {
  final bool isMenuVisible;
  final Function(Uri) launchURL;

  const PrivacyMenu({
    super.key,
    required this.isMenuVisible,
    required this.launchURL,
  });

  @override
  Widget build(BuildContext context) {
    final translationManager = Provider.of<TranslationManager>(context);
    return AnimatedPositioned(
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeInOut,
      right: isMenuVisible ? 0 : -300,
      top: 70,
      child: Material(
        elevation: 4.0,
        borderRadius: BorderRadius.circular(20.0),
        child: Container(
          width: 300,
          decoration: BoxDecoration(
              color: Colors.white.withOpacity(
                  0.3), // Colore con opacità per l'effetto trasparente
              borderRadius: BorderRadius.circular(20.0),
              border: Border.all(color: Colors.white)),
          child: Column(
            children: [
              ListTile(
                title: Text(translationManager.translate('txtPrivacyPolicy')),
                onTap: () => launchURL(
                    Uri.parse('https://www.buraco.plus/privacy_en.pdf')),
              ),
              const Divider(),
              ListTile(
                title: Text(translationManager.translate('txtTermsAndConditions')),
                onTap: () => launchURL(Uri.parse(
                    'https://www.buraco.plus/terms_and_conditions.pdf')),
              ),
              const Divider(),
              ListTile(
                title: Text(translationManager.translate('txtTermsOfUse(EULA)')),
                onTap: () => launchURL(Uri.parse(
                    'https://www.apple.com/legal/internet-services/itunes/dev/stdeula/')),
              ),
              const Divider(),
              ListTile(
                title: Text(translationManager.translate('txtEthicRules')),
                onTap: () => launchURL(
                    Uri.parse('https://www.buraco.plus/en/ethic-rules/')),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
