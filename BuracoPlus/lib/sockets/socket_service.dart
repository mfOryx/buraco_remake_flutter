import 'package:flutter/foundation.dart';
import 'package:socket_io_client/socket_io_client.dart' as io;

class SocketService with ChangeNotifier {
  late io.Socket _socket;
  final String _serverUrl;
  bool _isConnected = false;

  SocketService(this._serverUrl);

  void connect() {
    _socket = io.io(_serverUrl, <String, dynamic>{
      'transports': ['websocket'],
    });

    _socket.on('connect', (_) {
      if (kDebugMode) {
        print('connected');
      }
      _isConnected = true;
      notifyListeners();
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
        print('Here I am. Connection error: $err');
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

  void emitWithAck(String event, dynamic data) {
    if (_isConnected) {
      _socket.compress(true).emitWithAck(event, data, ack: (dynamic result) {
        if (kDebugMode) {
          print('ack $result');
        }
        if (result != null) {
          if (kDebugMode) {
            print('from server $result');
            return result;
          }
        } else {
          if (kDebugMode) {
            print("Null");
          }
          return null;
        }
      });
    } else {
      if (kDebugMode) {
        print('Socket is not connected');
      }
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
