import 'package:flutter/material.dart';
import 'package:buracoplus/helpers/preferences_service.dart';
import 'package:provider/provider.dart';
import 'package:buracoplus/common/translation_manager.dart';

class LobbyOptionItem extends StatefulWidget {
  const LobbyOptionItem({super.key});

  @override
  _LobbyOptionItemState createState() => _LobbyOptionItemState();
}

class _LobbyOptionItemState extends State<LobbyOptionItem> {
  final PreferencesService _prefs = PreferencesService();
  int _currentLobbyPreference = 0;

  @override
  void initState() {
    super.initState();
    _loadPreference();
  }

  void _loadPreference() async {
    final int preference = await _prefs.getLobbyPreference();
    setState(() {
      _currentLobbyPreference = preference;
    });
  }

  void _updatePreference(int newValue) async {
    await _prefs.setLobbyPreference(newValue);
    setState(() {
      _currentLobbyPreference = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    final translationManager = Provider.of<TranslationManager>(context);
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(translationManager.translate('txtLobby')),
      trailing: DropdownButtonHideUnderline(
        child: DropdownButton<int>(
          borderRadius: BorderRadius.circular(20),
          value: _currentLobbyPreference,
          onChanged: (int? newValue) {
            if (newValue != null) {
              _updatePreference(newValue);
            }
          },
          items: [
            DropdownMenuItem<int>(
              value: 0,
              child: Container(
                width: 100,
                padding: const EdgeInsets.symmetric(vertical: 8),
                decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                          color: Colors.grey[300]!,
                          width: 1)), // Bordo tra le opzioni
                ),
                child: Text(translationManager.translate('txtItalian')),
              ),
            ),
            DropdownMenuItem<int>(
              value: 1,
              child: Container(
                width: 100,
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Text(translationManager.translate('txtProfessional')),
              ),
            ),
          ],

          dropdownColor: Colors.purple, // Imposta il colore di sfondo del menu
          icon: const Icon(Icons.arrow_drop_down,
              color: Colors.black54), // Icona con colore personalizzato
          style: const TextStyle(
              color: Colors.black87), // Stile del testo delle opzioni
        ),
      ),
    );
  }
}
