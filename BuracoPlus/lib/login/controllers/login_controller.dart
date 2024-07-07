import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:buracoplus/common/rotating_loader.dart';
import 'package:buracoplus/common/toast.dart';
import 'package:buracoplus/common/translation_manager.dart';
import 'package:buracoplus/helpers/user.dart';
import 'package:buracoplus/lobby.dart';
import 'package:buracoplus/models/LoggedInPlayer.dart';
import 'package:buracoplus/sockets/socket_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:immutable_device_identifier/immutable_device_identifier.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:buracoplus/common/general_functions.dart';
import 'package:device_info_plus/device_info_plus.dart';

import '../../home.dart';

class LoginController {
  StreamSubscription? _messagesStreamSubscription;
  VoidCallback? onSuccessfulMessage;
  Function(String)? onError;
  TranslationManager? translationManager;
  static final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();

  void sendLogin(BuildContext context, String username, String password) async {
    if (username.trim().isEmpty || password.trim().isEmpty) {
      onError?.call('Username o Password vuoti');
      return;
    }
    //RotatingLoader.showOverlay(context);
    final immutableDeviceIdentifierPlugin = ImmutableDeviceIdentifier();
    String platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    // We also handle the message potentially returning null.
    try {
      platformVersion = await immutableDeviceIdentifierPlugin.getUniqueId();
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    String phoneName = "";
    String phoneModel = "";
    if (Platform.isIOS || Platform.isMacOS) {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      phoneName = iosInfo.name;
      phoneModel = iosInfo.model;
    }
    if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      phoneModel = androidInfo.model;
    }
    if (Platform.isWindows) {
      WindowsDeviceInfo windowsInfo = await deviceInfo.windowsInfo;
      phoneName = windowsInfo.computerName;
      phoneModel = windowsInfo.productName;
    }

    String ipAddress = await getPublicIP();
    final socketService = Provider.of<SocketService>(context, listen: false);

    if (!socketService.isConnected()) {
      socketService.connect();
    } else {
      // final getAllTables = await socketService.emitWithAck('getAllTables', {});

      // log(json.encode(getAllTables));

      final ackResult = await socketService.emitWithAck(
        'loginAction',
        {
          'username': username,
          'password': password,
          'ip': ipAddress,
          'uniqueDeviceId': platformVersion,
          'phoneName': phoneName,
          'phoneModel': phoneModel
        },
      );
      if (ackResult.toString().contains('playerData')) {
        if (ackResult["playerData"] != null) {
          Toast.showTopScrollingSnackbar(
              context,
              const Text(
                "Login success",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black, fontSize: 16.0),
              ),
              Colors.green);

          User? currentUser = User();
          LoggedInPlayer? currentLoggedInPlayer =
              currentUser.setLoggedInPlayer(ackResult["playerData"]);

          print(currentLoggedInPlayer?.Id);

          Navigator.push(
              context, MaterialPageRoute(builder: (context) => const Home()));
        } else {
          Toast.showTopScrollingSnackbar(
              context,
              const Text(
                "Wrong password",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black, fontSize: 16.0),
              ),
              Colors.yellow);
        }
      } else {
        print('errore ritornato');
      }
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
        print('questo il modello ${iosInfo.name}');
        print('model ${iosInfo.model}');
        print('version ${iosInfo.utsname.version}');
      }
      if (Platform.isMacOS) {
        IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
        print('questo il modello ${iosInfo.name}');
        print('model ${iosInfo.model}');
        print('version ${iosInfo.utsname.version}');
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
