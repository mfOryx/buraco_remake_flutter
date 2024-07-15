import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class SocketServiceSingleton {
  IO.Socket? socket;

  // Singleton pattern
  static final SocketServiceSingleton _instance = SocketServiceSingleton._internal();
  bool _isConnected = false;
  factory SocketServiceSingleton() {
    return _instance;
  }

  SocketServiceSingleton._internal();

  void initSocket(String url) {
    if(_isConnected) {
      return;
    }
    socket = IO.io(url, IO.OptionBuilder()
        .setTransports(['websocket'])
        .disableAutoConnect()
        .setReconnectionAttempts(2) // Set reconnection attempts limit to 2
        .build());

    socket!.connect();

    socket!.onConnect((_) {
      if (kDebugMode) {
        print('[SocketServiceSingleton] -> connected');
      }
      _isConnected = true;
    });

    socket!.onDisconnect((_) {
      if (kDebugMode) {
        print('[SocketServiceSingleton] -> disconnected');
      }
      _isConnected = false;
    });
  }

  void emit(String event, dynamic data) {
    socket?.emit(event, data);
  }

  Future<dynamic> emitWithAck(String event, dynamic data) {
    if(kDebugMode){
      print("event : $event\n data : "+data);

    }
    final completer = Completer<dynamic>();

    if (_isConnected) {
      socket?.emitWithAck(event, data, ack: (dynamic result) {
        completer.complete(result);
      });

      Future.delayed(const Duration(seconds: 5), () {
        if (!completer.isCompleted) {
          completer.completeError(
              TimeoutException("[SocketServiceSingleton] -> Socket operation timed out"));
        }
      });

      return completer.future;
    } else {
      return Future.error(Exception('[SocketServiceSingleton] -> Socket is not connected'));
    }
  }

  void on(String event, Function(dynamic) callback) {
    socket?.on(event, callback);
  }

  void dispose() {
    socket?.dispose();
  }

  bool isConnected() {
    return _isConnected;
  }
}
