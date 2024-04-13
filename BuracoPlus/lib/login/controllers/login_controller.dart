import 'dart:async';
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
    connectToWebSocket().then((_) {
      WebSocketService().sendMessage('loginAction', {
        'username': username,
        'password': password,
      }).then((response) {
        RotatingLoader.hideOverlay();
        // Assume response is a JSON object that contains a status and possibly an error message
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
            print(response['player']['_id'].toString());
          }
          _saveCredentials(
              username, password, response['player']['_id'].toString());
        } else {
          onError
              ?.call(response['message']); // Show error message from the server
        }
      });
    }).catchError((error) {
      RotatingLoader.hideOverlay();
      onError?.call('Errore di connessione: $error');
    });
  }

  void sendAutoLogin(BuildContext context, String playerId) {
    RotatingLoader.showOverlay(context);
    connectToWebSocket().then((_) {
      WebSocketService().sendMessage(
          'autoLoginAction', {'playerId': playerId}).then((response) {
        RotatingLoader.hideOverlay();
        // Assume response is a JSON object that contains a status and possibly an error message
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
            print(response['player']['_id'].toString());
          }
        } else {
          onError
              ?.call(response['message']); // Show error message from the server
        }
      });
    }).catchError((error) {
      RotatingLoader.hideOverlay();
      onError?.call('Errore di connessione: $error');
    });
  }

  Future<void> _saveCredentials(
      String username, String password, String playerId) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('username', username);
    await prefs.setString('password', password);
    await prefs.setString('playerId', playerId);
  }

  void _launchURL(Uri url) async {
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void dispose() {
    _messagesStreamSubscription?.cancel();
  }
}
