import 'package:url_launcher/url_launcher.dart' show canLaunchUrl, launchUrl;
import 'package:flutter/foundation.dart' show kDebugMode;

void openWebLink() async {
  const String url = 'https://kernel.org/';
  if (await canLaunchUrl(
    Uri.parse(url),
  )) {
    await launchUrl(Uri.parse(url));
  } else {
    throw 'Non riesco a lanciare $url';
  }

  //Crea un blocco try-catch per gestire eccezioni
  if (kDebugMode) {
    print('lancia sito');
  }
}
