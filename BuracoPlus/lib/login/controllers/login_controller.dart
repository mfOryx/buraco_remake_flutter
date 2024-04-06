import 'package:flutter/material.dart';
import 'package:buracoplus/common/web_socket_service.dart';

class LoginController {
  final _messagesStreamSubscription;

  LoginController({
    required Function onFirstConnectionOk,
    required Function onLoginSuccess,
    required Function(String) onLoginError,
  }) : _messagesStreamSubscription =
            WebSocketService().messagesStream.listen((message) {
          if (message['type'] == 'firstConnectionResponse' &&
              message['response'] == 'ok') {
            onFirstConnectionOk();
          } else if (message['type'] == 'loginResponse') {
            if (message['player'] != null) {
              onLoginSuccess(message['player']);
            } else {
              onLoginError('Login fallito');
            }
          }
        });

  void connectToWebSocket() {
    WebSocketService().connect('ws://15.161.77.214:3003');
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
