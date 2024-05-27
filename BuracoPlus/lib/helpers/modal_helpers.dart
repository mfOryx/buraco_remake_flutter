import 'package:buracoplus/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:buracoplus/common/translation_manager.dart'; // Assicurati che il percorso sia corretto

class ModalHelpers {
  static void showLanguagesMenu(BuildContext context) {
    final translationManager =
        Provider.of<TranslationManager>(context, listen: false);
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
      ),
      builder: (BuildContext context) {
        return buildLanguagesModal(translationManager, context);
      },
    );
  }

  static Widget buildLanguagesModal(
      TranslationManager translationManager, BuildContext context) {
    return Consumer<ThemeProvider>(builder: (_, themeProvider, __) {
      final colors = themeProvider.currentColors;
      return ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(20.0)),
        child: Container(
          height: MediaQuery.of(context).size.height < 550
              ? MediaQuery.of(context).size.height - 60
              : MediaQuery.of(context).size.height / 2,
          width: MediaQuery.of(context).size.width / 2,
          decoration: BoxDecoration(
            color: colors.popupBackground,
            borderRadius: const BorderRadius.vertical(
                top: Radius.circular(20.0)), // Continua il bordo arrotondato
          ),
          child: Column(
            mainAxisSize: MainAxisSize
                .min, // Importante per rendere il contenuto adattabile all'altezza del contenuto interno
            children: [
              Container(
                color: colors.popupTitleBackground,
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    const Icon(Icons.language, color: Colors.white),
                    const SizedBox(width: 10),
                    Text(
                      translationManager.translate('txtLanguages'),
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  color: colors.popupExternalBackground,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: colors.popupBackground,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: ListView(
                        children:
                            buildLanguageTiles(translationManager, context),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }

  static List<Widget> buildLanguageTiles(
      TranslationManager translationManager, BuildContext context) {
    return [
      ListTile(
        title: _languageTile('Italian', 'it', translationManager, context),
        onTap: () => translationManager.changeLanguage('it'),
      ),
      ListTile(
        title: _languageTile('English', 'en', translationManager, context),
        onTap: () => translationManager.changeLanguage('en'),
      ),
      ListTile(
        title: _languageTile('Spanish', 'es', translationManager, context),
        onTap: () => translationManager.changeLanguage('es'),
      ),
      ListTile(
        title: _languageTile('Portuguese', 'pt', translationManager, context),
        onTap: () => translationManager.changeLanguage('pt'),
      ),
      ListTile(
        title: _languageTile('Arabic', 'ar', translationManager, context),
        onTap: () => translationManager.changeLanguage('ar'),
      ),
    ];
  }

  static Widget _languageTile(String language, String code,
      TranslationManager manager, BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context, listen: false);
    final colors = themeProvider.currentColors;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          language,
          style: TextStyle(color: colors.optionTextColor),
        ),
        if (code == manager.languageCode) const Icon(Icons.check),
      ],
    );
  }
}
