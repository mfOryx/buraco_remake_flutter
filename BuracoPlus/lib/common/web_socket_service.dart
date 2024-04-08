import 'dart:async';
import 'dart:convert';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:buracoplus/common/web_sockets_actions.dart';

class WebSocketService {
  WebSocketChannel? _channel;
  final _connectionStatusController = StreamController<bool>.broadcast();
  final _messagesController = StreamController<dynamic>.broadcast();
  final _ackController = StreamController<Map<String, dynamic>>.broadcast();
  int _messageId = 0;
  final _pendingAcks = <int, Completer>{};

  static final WebSocketService _singleton = WebSocketService._internal();

  factory WebSocketService() {
    return _singleton;
  }

  WebSocketService._internal();

  Stream<bool> get connectionStatusStream => _connectionStatusController.stream;
  Stream<dynamic> get messagesStream => _messagesController.stream;

  Future<void> connect(String url) async {
    _channel = WebSocketChannel.connect(Uri.parse(url))
      ..stream.listen((message) {
        final decodedMessage = json.decode(message);
        final actionType = decodedMessage['type'];

        // Gestione degli acknowledgment
        if (actionType == 'ack') {
          final messageId = decodedMessage['messageId'];
          _ackReceived(messageId);
        } else {
          // Chiamata all'handler appropriato dalla mappa actionHandlers
          final Function? handler = actionHandlers[actionType];
          if (handler != null) {
            handler(decodedMessage);
          }
        }

        // Gestione del messaggio in arrivo
        _handleIncomingMessage(decodedMessage);
      }, onDone: () {
        _connectionStatusController.add(false);
      }, onError: (error) {
        _connectionStatusController.add(false);
      });
    _connectionStatusController.add(true);
  }

  Future<void> sendMessage(String type, Map<String, dynamic> data) {
    final messageId = _messageId++;
    final completer = Completer();
    _pendingAcks[messageId] = completer;

    final message = json.encode({
      'type': type,
      'messageId': messageId,
      'data': data,
    });

    _channel!.sink.add(message);

    // Start a timer to wait for an ACK
    Timer(const Duration(seconds: 2), () {
      if (!completer.isCompleted) {
        completer.completeError('No ACK received');
        _pendingAcks.remove(messageId);
        // Handle retransmission if necessary
      }
    });

    return completer.future;
  }

  void _handleIncomingMessage(String message) {
    final decodedMessage = json.decode(message);

    // Invia il messaggio decodificato al controller di stream per essere ascoltato nell'app
    _messagesController.add(decodedMessage);

    // Aggiungi qui ulteriori logiche basate sul tipo di messaggio se necessario
  }

  void _ackReceived(int messageId) {
    _pendingAcks[messageId]?.complete();
    _pendingAcks.remove(messageId);
  }

  void dispose() {
    _channel?.sink.close();
    _ackController.close();
  }
}
