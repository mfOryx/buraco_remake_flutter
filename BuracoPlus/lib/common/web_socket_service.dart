import 'dart:async';
import 'dart:convert';
import 'package:web_socket_channel/web_socket_channel.dart';

class WebSocketService {
  WebSocketChannel? _channel;
  final _connectionStatusController = StreamController<bool>.broadcast();
  final _messagesController = StreamController<dynamic>.broadcast();

  static final WebSocketService _singleton = WebSocketService._internal();

  factory WebSocketService() {
    return _singleton;
  }

  WebSocketService._internal();

  Stream<bool> get connectionStatusStream => _connectionStatusController.stream;
  Stream<dynamic> get messagesStream => _messagesController.stream;

  void connect(String url) {
    _channel = WebSocketChannel.connect(Uri.parse(url))
      ..stream.listen(
        (message) {
          // Gestisci i messaggi in arrivo
          _handleIncomingMessage(message);
        },
        onDone: () {
          // Quando la WebSocket si chiude, invia un evento di disconnessione
          _connectionStatusController.add(false);
        },
        onError: (error) {
          // In caso di errore, invia un evento di disconnessione
          _connectionStatusController.add(false);
        },
      );
    // Quando la WebSocket si connette, invia un evento di connessione
    _connectionStatusController.add(true);
  }

  void sendMessage(String type, Map<String, dynamic> data) {
    final message = json.encode({
      'type': type,
      'data': data,
    });
    _channel?.sink.add(message);
  }

  void _handleIncomingMessage(String message) {
    final decodedMessage = json.decode(message);

    // Invia il messaggio decodificato al controller di stream per essere ascoltato nell'app
    _messagesController.add(decodedMessage);

    // Aggiungi qui ulteriori logiche basate sul tipo di messaggio se necessario
  }

  void close() {
    _channel?.sink.close();
  }
}
