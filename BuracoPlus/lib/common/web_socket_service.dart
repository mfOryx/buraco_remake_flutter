import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import '../models/message_data.dart';
import '../models/web_socket_actions.dart';

class WebSocketService {
  static final WebSocketService _singleton = WebSocketService._internal();
  WebSocketChannel? _channel;
  final StreamController<bool> _connectionStatusController =
      StreamController<bool>.broadcast();
  final StreamController<dynamic> _messagesController =
      StreamController<dynamic>.broadcast();
  final Map<int, Completer<Map<String, dynamic>>> _pendingAcks = {};
  int _messageId = 10;
  int _reconnectAttempts = 0;
  final int _maxReconnectAttempts = 3;
  bool _isAttemptingReconnect = false;

  factory WebSocketService() {
    return _singleton;
  }

  WebSocketService._internal();

  Stream<bool> get connectionStatus => _connectionStatusController.stream;
  Stream<dynamic> get messagesStream => _messagesController.stream;

  Future<void> connect(String url) async {
    if (_isAttemptingReconnect) {
      if (kDebugMode) {
        print("Riconnessione già in corso. Ignorando il tentativo duplicato.");
      }
      return;
    }

    _isAttemptingReconnect = true;
    _disposeChannel();

    try {
      _channel = WebSocketChannel.connect(Uri.parse(url));
      _reconnectAttempts = 0;
      _channel!.stream.listen(_handleMessage,
          onDone: _handleWebSocketClosed,
          onError: _handleWebSocketError,
          cancelOnError: true);
      _connectionStatusController.add(true);
    } catch (e) {
      _handleWebSocketError(e);
    } finally {
      _isAttemptingReconnect = false;
    }
  }

  void _handleWebSocketClosed() {
    if (kDebugMode) {
      print("WebSocket Disconnected.");
    }
    _connectionStatusController.add(false);
    _attemptReconnect();
  }

  void _handleWebSocketError(dynamic error) {
    if (kDebugMode) {
      print("WebSocket Error: $error");
    }
    _connectionStatusController.add(false);
    _attemptReconnect();
  }

  void _attemptReconnect() {
    if (_reconnectAttempts < _maxReconnectAttempts && !_isAttemptingReconnect) {
      _reconnectAttempts++;
      _isAttemptingReconnect = true;
      Future.delayed(Duration(seconds: 5), () {
        connect("ws://15.161.77.214:3003").catchError((error) {
          if (kDebugMode) {
            print("Reconnection attempt failed: $error");
          }
          _isAttemptingReconnect = false;
        });
      });
    } else {
      _isAttemptingReconnect = false;
    }
  }

  Future<Map<String, dynamic>> sendMessage(
      String type, Map<String, dynamic> data) async {
    final messageId = _messageId++;
    // Explicitly type the Completer
    final Completer<Map<String, dynamic>> completer =
        Completer<Map<String, dynamic>>();
    _pendingAcks[messageId] = completer;

    final message = json.encode({
      'type': type,
      'messageId': messageId,
      'data': data,
    });

    _channel!.sink.add(message);

    // Set a timer to consider a timeout scenario where no response is received
    Timer(const Duration(seconds: 5), () {
      if (!completer.isCompleted) {
        completer.completeError('No ACK or response received');
        _pendingAcks.remove(messageId);
      }
    });

    return completer.future;
  }

  void _handleMessage(dynamic message) {
    final decodedMessage = json.decode(message);
    final data = decodedMessage['data'];
    final messageId = data['messageId'];

    if (_pendingAcks.containsKey(messageId)) {
      _pendingAcks[messageId]!.complete(data
          as Map<String, dynamic>); // Ensure data is cast to the correct type
      _pendingAcks.remove(messageId);
    }

    _messagesController.add(MessageData.fromJson(data));
  }

  void _disposeChannel() {
    if (_channel != null) {
      _channel!.sink.close();
      _channel = null;
    }
  }

  void dispose() {
    _disposeChannel();
    _connectionStatusController.close();
    _messagesController.close();
  }
}
