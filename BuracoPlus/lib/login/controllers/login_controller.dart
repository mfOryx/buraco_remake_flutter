import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:buracoplus/common/rotating_loader.dart';
import 'package:buracoplus/common/toast.dart';
import 'package:buracoplus/common/translation_manager.dart';
import 'package:flutter/foundation.dart';
import 'package:buracoplus/common/web_socket_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:immutable_device_identifier/immutable_device_identifier.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:buracoplus/common/general_functions.dart';
import 'package:device_info_plus/device_info_plus.dart';

class LoginController {
  StreamSubscription? _messagesStreamSubscription;
  VoidCallback? onSuccessfulMessage;
  Function(String)? onError;
  TranslationManager? translationManager;
  static final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
  Map<String, dynamic> _deviceData = <String, dynamic>{};

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

  Future<void> _sendLoginMessage(BuildContext context, String username,
      String password, String playerId) async {
    final immutableDeviceIdentifierPlugin = ImmutableDeviceIdentifier();
    String platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    // We also handle the message potentially returning null.
    try {
      platformVersion = await immutableDeviceIdentifierPlugin.getUniqueId();
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }
    if (kDebugMode) {
      print(platformVersion);
      print(Platform.operatingSystemVersion);
      print(Platform.localHostname);
      DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
      if (Platform.isAndroid) {
        AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
        print(androidInfo.model);
      }
      if (Platform.isIOS) {
        IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
        print('questo il modello ' + iosInfo.name);
        print('model ' + iosInfo.model);
        print('version ' + iosInfo.utsname.version);
      }
      if (Platform.isMacOS) {
        IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
        print('questo il modello ' + iosInfo.name);
        print('model ' + iosInfo.model);
        print('version ' + iosInfo.utsname.version);
      }
    }
    /*

    if (playerId == '') {
      WebSocketService().sendMessage('loginAction', {
        'username': username,
        'password': password,
        'deviceId': platformVersion,
        'ip': getPublicIP()
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
    */
  }

  Future<void> sendAutoLogin(BuildContext context, String playerId) async {
    final immutableDeviceIdentifierPlugin = ImmutableDeviceIdentifier();
    String platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    // We also handle the message potentially returning null.
    try {
      platformVersion = await immutableDeviceIdentifierPlugin.getUniqueId();
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }
    if (kDebugMode) {
      print(platformVersion);
    }

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
    //DE94330A-E9F6-42CD-AE3D-76D8EE32B37E
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
