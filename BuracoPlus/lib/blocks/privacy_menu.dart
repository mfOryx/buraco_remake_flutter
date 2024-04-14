import 'package:flutter/material.dart';

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
                title: const Text('Privacy Policy'),
                onTap: () => launchURL(
                    Uri.parse('https://www.buraco.plus/privacy_en.pdf')),
              ),
              const Divider(),
              ListTile(
                title: const Text('Terms and Conditions'),
                onTap: () => launchURL(Uri.parse(
                    'https://www.buraco.plus/terms_and_conditions.pdf')),
              ),
              const Divider(),
              ListTile(
                title: const Text('Terms of Use (EULA)'),
                onTap: () => launchURL(Uri.parse(
                    'https://www.apple.com/legal/internet-services/itunes/dev/stdeula/')),
              ),
              const Divider(),
              ListTile(
                title: const Text('Ethic Rules'),
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
