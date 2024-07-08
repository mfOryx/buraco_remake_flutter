import 'dart:async';
import 'package:buracoplus/common/popUp.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as io;
import 'package:toastification/toastification.dart';

class SocketService with ChangeNotifier {
  late io.Socket _socket;
  final String _serverUrl;
  bool _isConnected = false;

  SocketService(this._serverUrl);

  void connect({void Function()? onConnected}) {
    print(_serverUrl);
    

    _socket = io.io(_serverUrl, <String, dynamic>{
      'transports': ['websocket'],
      'reconnectionAttempts': 2,
    });

    _socket.on('connect', (_) {
      if (kDebugMode) {
        print('connected');
      }
      _isConnected = true;
      notifyListeners();

      if (onConnected != null) {
        onConnected();
      }
    });

    _socket.on('disconnect', (_) {
      if (kDebugMode) {
        print('disconnected');
      }
      _isConnected = false;
      notifyListeners();
    });

    _socket.on('connect_error', (err) {
      if (kDebugMode) {
        print('Connection error: $err');
      }
      _isConnected = false;
      notifyListeners();
    });
  }

  void emit(String event, dynamic data) {
    if (_isConnected) {
      _socket.emit(event, data);
    } else {
      if (kDebugMode) {
        print('Socket is not connected');
      }
    }
  }

  Future<dynamic> emitWithAck(String event, dynamic data) {
    final completer = Completer<dynamic>();

    if (_isConnected) {
      _socket.emitWithAck(event, data, ack: (dynamic result) {
        completer.complete(result);
      });

      Future.delayed(const Duration(seconds: 5), () {
        if (!completer.isCompleted) {
          completer
              .completeError(TimeoutException("Socket operation timed out"));
        }
      });

      return completer.future;
    } else {
      return Future.error(Exception('Socket is not connected'));
    }
  }

  void disconnect() {
    if (_isConnected) {
      _socket.disconnect();
    }
  }

  bool isConnected() {
    return _isConnected;
  }

  io.Socket get socket => _socket;
}


