import 'dart:async';
import 'dart:convert';
import 'package:buracoplus/common/rotating_loader.dart';
import 'package:buracoplus/common/toast.dart';
import 'package:buracoplus/common/translation_manager.dart';
import 'package:flutter/foundation.dart';
import 'package:buracoplus/common/web_socket_service.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class LoginController {
  StreamSubscription? _messagesStreamSubscription;
  VoidCallback? onSuccessfulMessage;
  Function(String)? onError;
  TranslationManager? translationManager;

  Future<void> connectToWebSocket() async {
    WebSocketService().connectionStatus.listen((isConnected) {
      if (isConnected) {
        _initWebSocketListeners();
        onSuccessfulMessage?.call();
      } else {
        onError?.call('Impossibile connettersi al WebSocket');
        RotatingLoader.hideOverlay();
      }
    });

    await WebSocketService().connect('ws://15.161.77.214:3003');
    _initWebSocketListeners();
  }

  void _initWebSocketListeners() {
    _messagesStreamSubscription?.cancel();

    _messagesStreamSubscription =
        WebSocketService().messagesStream.listen((message) {
      if (message.socketId == '') {
        if (kDebugMode) {
          print('oh yes!');
        }
      }
    });
  }

  void sendLogin(BuildContext context, String username, String password) {
    if (username.trim().isEmpty || password.trim().isEmpty) {
      onError?.call('Username o Password vuoti');
      return;
    }
    RotatingLoader.showOverlay(context);
    if (!WebSocketService().isConnected) {
      WebSocketService().connect('ws://15.161.77.214:3003').then((_) {
        _sendLoginMessage(context, username, password, '');
      }).catchError((error) {
        RotatingLoader.hideOverlay();
        onError?.call('Errore di connessione: $error');
      });
    } else {
      _sendLoginMessage(context, username, password, '');
    }
  }

  void _sendLoginMessage(
      BuildContext context, String username, String password, String playerId) {
    if (playerId == '') {
      WebSocketService().sendMessage('loginAction', {
        'username': username,
        'password': password,
      }).then((response) {
        RotatingLoader.hideOverlay();
        if (response['socketId'].toString() != '') {
          onSuccessfulMessage?.call(); // Call if login is successful
          final playerSettings = json.decode(response['player']['userData']);

          Toast.showTopScrollingSnackbar(
              context,
              const Text(
                "Login success",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black, fontSize: 16.0),
              ),
              Colors.green);
          // Save details in SharedPreferences
          if (kDebugMode) {
            print(playerSettings['PSs'].toString());
          }
          _saveCredentials(
              username, password, response['player']['_id'].toString());
        } else {
          onError
              ?.call(response['message']); // Show error message from the server
        }
      }).catchError((error) {
        RotatingLoader.hideOverlay();
        onError?.call('Errore durante l\'invio del messaggio: $error');
      });
    } else {
      WebSocketService().sendMessage(
          'autoLoginAction', {'playerId': playerId}).then((response) {
        RotatingLoader.hideOverlay();
        if (response['socketId'].toString() != '') {
          onSuccessfulMessage?.call(); // Call if login is successful
          Toast.showTopScrollingSnackbar(
              context,
              const Text(
                "Login success",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black, fontSize: 16.0),
              ),
              Colors.green);
          // Save details in SharedPreferences
          if (kDebugMode) {
            //print(response['player']['userData'].toString());
          }
        } else {
          onError
              ?.call(response['message']); // Show error message from the server
        }
        // Gestisci la risposta qui
      }).catchError((error) {
        RotatingLoader.hideOverlay();
        onError?.call('Errore durante l\'invio del messaggio: $error');
      });
    }
  }

  void sendAutoLogin(BuildContext context, String playerId) {
    RotatingLoader.showOverlay(context);
    if (!WebSocketService().isConnected) {
      WebSocketService().connect('ws://15.161.77.214:3003').then((_) {
        _sendLoginMessage(context, '', '', playerId);
      }).catchError((error) {
        RotatingLoader.hideOverlay();
        onError?.call('Errore di connessione: $error');
      });
    } else {
      _sendLoginMessage(context, '', '', playerId);
    }
  }

  Future<void> _saveCredentials(
      String username, String password, String playerId) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('username', username);
    await prefs.setString('password', password);
    await prefs.setString('playerId', playerId);
  }

  void dispose() {
    _messagesStreamSubscription?.cancel();
  }
}
