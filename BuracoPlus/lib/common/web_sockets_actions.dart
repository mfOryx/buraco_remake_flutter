void firstConnectionResponseHandler(dynamic message) {
  // Logica per gestire la risposta della prima connessione
}

void loginResponseHandler(dynamic message) {
  // Logica per gestire la risposta del login
}

// Mappa che associa i tipi di messaggio ai loro handler
final Map<String, Function> actionHandlers = {
  'firstConnectionResponse': firstConnectionResponseHandler,
  'loginResponse': loginResponseHandler,
  // Aggiungi altre coppie azione-handler qui
};
