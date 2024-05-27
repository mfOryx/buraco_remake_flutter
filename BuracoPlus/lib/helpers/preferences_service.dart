import 'package:shared_preferences/shared_preferences.dart';

class PreferencesService {
  Future<int> getLobbyPreference() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt('lobbyPreference') ??
        0; // Classic è il valore di default (0)
  }

  Future<void> setLobbyPreference(int value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('lobbyPreference', value);
    // Controlla se la WebSocket è connessa prima di inviare il messaggio
    /**
      if (WebSocketService().isConnected) {
        // Costruisci il messaggio da inviare
        Map<String, dynamic> messageData = {
          'type': 'updatePreference',
          'data': {
            'lobbyType': value == 0 ? 'Classic' : 'Professional',
            'messageId':
                value, // Assicurati che messageId sia unico e appropriato
          }
        };
  
        // Invia il messaggio al server
        WebSocketService()
            .sendMessage('preferenceChange', messageData)
            .then((response) {
          if (kDebugMode) {
            print("Risposta del server al cambio di preferenza: $response");
          }
        }).catchError((error) {
          if (kDebugMode) {
            print("Errore nell'invio del messaggio di cambio preferenza: $error");
          }
        });

    }
    */
  }
}
