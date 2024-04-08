import 'dart:async';

import 'package:flutter/material.dart';
import 'package:buracoplus/common/web_socket_service.dart';
import 'package:buracoplus/common/web_sockets_actions.dart';

class LoginController {
  late final StreamSubscription
      _messagesStreamSubscription; // Rendi la sottoscrizione "late"

  LoginController()
      : _messagesStreamSubscription =
            WebSocketService().messagesStream.listen((message) {
          final actionType = message['type'];
          final Function? handler = actionHandlers[actionType];
          handler?.call(message);
        });

  Future<void> connectToWebSocket() async {
    await WebSocketService().connect('ws://15.161.77.214:3003');
    _initWebSocketListeners(); // Inizializza i listener dopo aver stabilito la connessione
  }

  void _initWebSocketListeners() {
    _messagesStreamSubscription =
        WebSocketService().messagesStream.listen((message) {
      final actionType = message['type'];
      final Function? handler = actionHandlers[actionType];
      if (handler != null) {
        handler(message);
      } else {
        print('No handler for actionType: $actionType');
      }
    });
  }

  void sendFirstConnection() {
    WebSocketService().sendMessage('firstConnection', {});
  }

  void sendLogin(String username, String password) {
    WebSocketService().sendMessage('login', {
      'username': username,
      'password': password,
    });
  }

  void dispose() {
    _messagesStreamSubscription.cancel();
  }
}
