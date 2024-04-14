import 'package:buracoplus/common/custom_switch.dart';
import 'package:buracoplus/common/translation_manager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OptionsButton extends StatelessWidget {
  final VoidCallback toggleMenu;

  const OptionsButton({super.key, required this.toggleMenu});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: MediaQuery.of(context).size.height < 550 ? 10.0 : 20.0,
      left: Directionality.of(context) == TextDirection.rtl
          ? 120
          : null, // Set left or right based on text direction
      right: Directionality.of(context) == TextDirection.rtl
          ? null
          : 120, // Only one will be set at a time
      width: 70,
      height: 70,
      child: Column(
        children: [
          IconButton(
            icon: const Icon(
              Icons.settings,
              color: Colors.white,
            ),
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.transparent,
              backgroundColor: Colors.transparent,
            ),
            onPressed: () {
              showOptionsPanel(context);
            },
          ),
          const SizedBox(
            height: 1,
          ),
          const Text('OPTIONS', style: TextStyle(color: Colors.white)),
        ],
      ),
    );
  }

  void showOptionsPanel(BuildContext context) {
    showModalBottomSheet(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
      ),
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        bool isSwitched = true;
        return ClipRRect(
          borderRadius: const BorderRadius.all(
            Radius.circular(20.0), // Arrotonda tutti gli angoli
          ),
          child: Container(
            color: Colors.white,
            height: MediaQuery.of(context).size.height < 550
                ? MediaQuery.of(context).size.height - 60
                : MediaQuery.of(context).size.height / 2,
            width: MediaQuery.of(context).size.width / 2,
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: ShaderMask(
                    shaderCallback: (Rect bounds) {
                      return const LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Color.fromRGBO(114, 60, 125, 1.0),
                          Color.fromRGBO(141, 107, 147, 1.0),
                          Color.fromRGBO(96, 132, 166, 1.0),
                          Color.fromRGBO(88, 104, 147, 1.0),
                        ],
                        stops: [0.0, 0.33, 0.66, 1.0],
                      ).createShader(bounds);
                    },
                    blendMode: BlendMode.srcIn,
                    child: const Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Text(
                        'Opzioni',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                // Un contenitore scrollabile per le ListTile
                Expanded(
                  child: ListView(
                    // Utilizzare ListView.builder se ci sono molte opzioni
                    children: [
                      ListTile(
                        title: const Text('Lingua'),
                        onTap: () => {showLanguagesMenu(context)},
                      ),
                      ListTile(
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            const Text(
                              'Ordinamento manuale',
                              style: TextStyle(
                                  // Stili per il testo se necessario
                                  ),
                            ),
                            CustomSwitch(
                              value:
                                  isSwitched, // Dovresti avere una variabile di stato per questo
                              onChanged: (bool val) {},
                              activeColor:
                                  Colors.green, // Colore quando è attivo
                              inactiveColor:
                                  Colors.grey, // Colore quando è inattivo
                            ),
                          ],
                        ),
                        onTap: () {
                          // Gestisci il tap qui se necessario
                        },
                      ),
                      ListTile(
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            const Text(
                              'Carte curve',
                              style: TextStyle(
                                  // Stili per il testo se necessario
                                  ),
                            ),
                            CustomSwitch(
                              value:
                                  isSwitched, // Dovresti avere una variabile di stato per questo
                              onChanged: (bool val) {},
                              activeColor:
                                  Colors.green, // Colore quando è attivo
                              inactiveColor:
                                  Colors.grey, // Colore quando è inattivo
                            ),
                          ],
                        ),
                        onTap: () {
                          // Gestisci il tap qui se necessario
                        },
                      ),
                      ListTile(
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            const Text(
                              'Rotazione delle carte superiori',
                              style: TextStyle(
                                  // Stili per il testo se necessario
                                  ),
                            ),
                            CustomSwitch(
                              value:
                                  isSwitched, // Dovresti avere una variabile di stato per questo
                              onChanged: (bool val) {},
                              activeColor:
                                  Colors.green, // Colore quando è attivo
                              inactiveColor:
                                  Colors.grey, // Colore quando è inattivo
                            ),
                          ],
                        ),
                        onTap: () {
                          // Gestisci il tap qui se necessario
                        },
                      ),
                      ListTile(
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            const Text(
                              'Suoni di sistema',
                              style: TextStyle(
                                  // Stili per il testo se necessario
                                  ),
                            ),
                            CustomSwitch(
                              value:
                                  isSwitched, // Dovresti avere una variabile di stato per questo
                              onChanged: (bool val) {},
                              activeColor:
                                  Colors.green, // Colore quando è attivo
                              inactiveColor:
                                  Colors.grey, // Colore quando è inattivo
                            ),
                          ],
                        ),
                        onTap: () {
                          // Gestisci il tap qui se necessario
                        },
                      ),
                      ListTile(
                        title: const Text('Inviti e richieste'),
                        onTap: () => {/* Gestisci il tap qui */},
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void showLanguagesMenu(BuildContext context) {
    final translationManager =
        Provider.of<TranslationManager>(context, listen: false);
    showModalBottomSheet(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
      ),
      context: context,
      builder: (BuildContext context) {
        return ClipRRect(
          borderRadius: const BorderRadius.all(
            Radius.circular(20.0), // Arrotonda tutti gli angoli
          ),
          child: SizedBox(
            height: MediaQuery.of(context).size.height / 2,
            width: MediaQuery.of(context).size.width / 2,
            child: Column(
              children: [
                // Testo "Opzioni" centrato e più grande
                Align(
                  alignment: Alignment.topCenter,
                  child: ShaderMask(
                    shaderCallback: (Rect bounds) {
                      return const LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Color.fromRGBO(114, 60, 125, 1.0),
                          Color.fromRGBO(141, 107, 147, 1.0),
                          Color.fromRGBO(96, 132, 166, 1.0),
                          Color.fromRGBO(88, 104, 147, 1.0),
                        ],
                        stops: [0.0, 0.33, 0.66, 1.0],
                      ).createShader(bounds);
                    },
                    blendMode: BlendMode.srcIn,
                    child: const Text(
                      'Languages',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                // Un contenitore scrollabile per le ListTile
                Expanded(
                  child: ListView(
                    // Utilizzare ListView.builder se ci sono molte opzioni
                    children: [
                      ListTile(
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            const Text(
                              'Italian',
                              style: TextStyle(
                                  // Stili per il testo se necessario
                                  ),
                            ),
                            if ('it' == translationManager.languageCode)
                              const Icon(Icons.check),
                          ],
                        ),
                        onTap: () {
                          translationManager.changeLanguage('it');
                        },
                      ),
                      ListTile(
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            const Text(
                              'English',
                              style: TextStyle(
                                  // Stili per il testo se necessario
                                  ),
                            ),
                            if ('en' == translationManager.languageCode)
                              const Icon(Icons.check),
                          ],
                        ),
                        onTap: () {
                          translationManager.changeLanguage('en');
                        },
                      ),
                      ListTile(
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            const Text(
                              'Spanish',
                              style: TextStyle(
                                  // Stili per il testo se necessario
                                  ),
                            ),
                            if ('es' == translationManager.languageCode)
                              const Icon(Icons.check),
                          ],
                        ),
                        onTap: () {
                          translationManager.changeLanguage('es');
                        },
                      ),
                      ListTile(
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            const Text(
                              'Portoguese',
                              style: TextStyle(
                                  // Stili per il testo se necessario
                                  ),
                            ),
                            if ('pt' == translationManager.languageCode)
                              const Icon(Icons.check),
                          ],
                        ),
                        onTap: () {
                          translationManager.changeLanguage('pt');
                        },
                      ),
                      ListTile(
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            const Text(
                              'Arabic',
                              style: TextStyle(
                                  // Stili per il testo se necessario
                                  ),
                            ),
                            if ('ar' == translationManager.languageCode)
                              const Icon(Icons.check),
                          ],
                        ),
                        onTap: () {
                          translationManager.changeLanguage('ar');
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
