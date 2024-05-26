import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class SocketService with ChangeNotifier {
  late IO.Socket
      _socket; // Usiamo 'late' perché lo inizializziamo nel metodo 'connect'
  final String _serverUrl;
  bool _isConnected = false;

  SocketService(this._serverUrl);

  void connect() {
    _socket = IO.io(_serverUrl, <String, dynamic>{
      'transports': ['websocket'],
    });

    _socket.on('connect', (_) {
      print('connected');
      _isConnected = true;
      notifyListeners();
    });

    _socket.on('disconnect', (_) {
      print('disconnected');
      _isConnected = false;
      notifyListeners();
    });

    _socket.on('connect_error', (err) {
      print('Here I am. Connection error: $err');
      _isConnected = false;
      notifyListeners();
    });
  }

  void emit(String event, dynamic data) {
    if (_isConnected) {
      _socket.emit(event, data);
    } else {
      print('Socket is not connected');
    }
  }

  void emitWithAck(String event, dynamic data) {
    if (_isConnected) {
      _socket.emitWithAck(event, data, ack: (dynamic result) {
        if (kDebugMode) {
          print('ack $result');
        }
        if (result != null) {
          if (kDebugMode) {
            print('from server $result');
          }
        } else {
          if (kDebugMode) {
            print("Null");
          }
        }
      });
    } else {
      print('Socket is not connected');
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

  IO.Socket get socket => _socket;
}
