import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:rxdart/subjects.dart';

class WebSocketService {
  static final WebSocketService _singleton = WebSocketService._internal();
  WebSocketChannel? _channel;
  final BehaviorSubject<bool> _connectionStatusController =
      BehaviorSubject<bool>();
  final StreamController<dynamic> _messagesController =
      StreamController<dynamic>.broadcast();
  final List<Map<String, dynamic>> _messageQueue = [];
  int _messageId = 10;
  bool _isSendingMessage = false;
  final int _maxReconnectAttempts = 3;
  int _reconnectAttempts = 0;
  String? _socketId;
  bool _isAttemptingReconnect = false;
  factory WebSocketService() => _singleton;
  bool _isCurrentlyConnected = false;
  bool get isConnected => _isCurrentlyConnected;
  final Map<int, Completer<Map<String, dynamic>>> _completersMap = {};

  WebSocketService._internal();

  Stream<bool> get connectionStatus => _connectionStatusController.stream;
  Stream<dynamic> get messagesStream => _messagesController.stream;

  Future<void> connect(String url) async {
    if (_isAttemptingReconnect || _reconnectAttempts >= _maxReconnectAttempts) {
      if (kDebugMode) {
        print(
            "Raggiunto il numero massimo di tentativi di riconnessione o tentativo già in corso.");
      }
      _reconnectAttempts = 0;
      return;
    }

    _isAttemptingReconnect = true;
    _disposeChannel();

    try {
      _channel = WebSocketChannel.connect(Uri.parse(url));
      _channel!.stream.listen(_handleMessage, onDone: _handleDone,
          onError: (error) {
        if (error is WebSocketChannelException) {
          _handleSocketException(error);
        } else {
          _handleError(error);
        }
      }, cancelOnError: true);
      _connectionStatusController.add(true);
      _isCurrentlyConnected = true;
    } catch (e) {
      if (e is WebSocketChannelException) {
        if (kDebugMode) {
          print("Errore di connessione 2: ${e.message}");
        }
      }

      if (e is WebSocketChannelException) {
        if (kDebugMode) {
          print("Errore di connessione: ${e.message}");
        }
        _handleSocketException(e); // Gestione specifica delle SocketException
      } else {
        _handleError(e);
      }
      _isCurrentlyConnected = false; // Aggiorna lo stato di connessione
    } finally {
      _isAttemptingReconnect = false;
    }
  }

  void _handleSocketException(WebSocketChannelException e) {
    if (kDebugMode) {
      print("Socket Exception Caught: ${e.message}");
    }
    _connectionStatusController.add(false);
    _isCurrentlyConnected = false;

    if (_reconnectAttempts < _maxReconnectAttempts) {
      Future.delayed(const Duration(seconds: 5), () {
        _reconnectAttempts++;
        connect("ws://15.161.77.214:3003"); // Retry connection
      });
    } else {
      if (kDebugMode) {
        print("Max reconnection attempts reached.");
      }
    }
  }

  void _handleMessage(dynamic message) {
    final decodedMessage = json.decode(message);
    final Map<String, dynamic> responseData = decodedMessage['data'];
    final messageId = responseData['messageId'];

    // Completa il completer con la risposta dal server
    Completer<Map<String, dynamic>>? completer = _completersMap[messageId];
    if (completer != null) {
      completer.complete(responseData);
      _completersMap.remove(messageId); // Pulisci la mappa dopo aver completato
    }
  }

  void _handleError(error) {
    _connectionStatusController.add(false);
    _isCurrentlyConnected = false;
    if (_reconnectAttempts < _maxReconnectAttempts) {
      _reconnectAttempts++;
      Future.delayed(const Duration(seconds: 5), () {
        connect("ws://15.161.77.214:3003"); // Riprova la connessione
      });
    } else {
      if (kDebugMode) {
        print(
            "Massimo numero di tentativi di riconnessione raggiunto. Nessun ulteriore tentativo verrà effettuato.");
      }
    }
  }

  void _handleDone() {
    if (_channel!.closeCode != null && _channel!.closeCode != 1000) {
      _handleError('Disconnected unexpectedly');
    }
  }

  Future<Map<String, dynamic>> sendMessage(
      String type, Map<String, dynamic> data) {
    Completer<Map<String, dynamic>> completer =
        Completer<Map<String, dynamic>>();
    final int messageId = _messageId++;
    if (kDebugMode) {
      print(messageId.toString());
    }
    // Aggiungi messageId al data
    data['messageId'] = messageId;
    if (kDebugMode) {
      print(data['messageId'].toString());
    }

    // Aggiungi solo dati serializzabili alla coda
    _messageQueue.add({'type': type, 'data': data});

    _completersMap[messageId] = completer;

    if (!_isSendingMessage) {
      _processMessageQueue();
    }
    return completer.future;
  }

  void _processMessageQueue() {
    if (_messageQueue.isNotEmpty &&
        _channel != null &&
        _channel!.closeCode == null) {
      _isSendingMessage = true;
      if (kDebugMode) {
        print(_messageQueue.toString());
      }
      var currentMessage = _messageQueue.removeAt(0);
      if (kDebugMode) {
        print(currentMessage.toString());
      }

      // Invia il messaggio al server
      _channel!.sink.add(json.encode(currentMessage));

      // Imposta un ritardo per rimettere in coda il processo dei messaggi successivi
      Future.delayed(const Duration(milliseconds: 10), () {
        _isSendingMessage = false;
        if (_messageQueue.isNotEmpty) {
          _processMessageQueue(); // Continue with the next message
        }
      });
    }
  }

  void _disposeChannel() {
    if (_channel != null) {
      _channel!.sink.close();
      _channel = null;
    }
  }

  void dispose() {
    _connectionStatusController.close();
    _messagesController.close();
    _disposeChannel();
    _reconnectAttempts = 0;
  }
}
