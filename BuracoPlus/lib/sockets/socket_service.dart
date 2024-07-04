import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as io;
import 'package:toastification/toastification.dart';

class SocketService with ChangeNotifier {
  late io.Socket _socket;
  final String _serverUrl;
  bool _isConnected = false;

  SocketService(this._serverUrl);

  void connect() {
    ShowToastWithButton("Connection","Connected sucessfully!",autocloseDuration: 5);

   
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

void ShowToastMessage(String title,String message,{int duration = 4}){

  toastification.show(
   
    type: ToastificationType.success,
    style: ToastificationStyle.flat,
    title: Text(title),
    description: Text(message),
    alignment: Alignment.topCenter,
    autoCloseDuration:  Duration(seconds: duration),
    primaryColor: Color(0xff562ea2),
    foregroundColor: Color(0xff562ea2),
    borderRadius: BorderRadius.circular(4.0),
    boxShadow: lowModeShadow,
  );

}


void ShowErrorMessage(String title,String message,{int duration = 4}){

  toastification.show(

    type: ToastificationType.error,
    style: ToastificationStyle.flat,
    title: Text(title),
    description: Text(message),
    alignment: Alignment.topCenter,
    autoCloseDuration:  Duration(seconds: duration),
    primaryColor: Color(0xffff0000),
    foregroundColor: Color(0xff2a2525),
    borderRadius: BorderRadius.circular(4.0),
    boxShadow: lowModeShadow,
    showProgressBar: true,
    dragToClose: true,
  );
}

void ShowToastWithButton(String title,String message,{int autocloseDuration = 0}){
   toastification.showCustom(
     
    autoCloseDuration:  Duration(seconds: autocloseDuration),
    alignment: Alignment.topCenter,
    builder: (BuildContext context, ToastificationItem holder) {
      return Container(
        
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(2),
          color: Colors.black,
        ),
        padding: const EdgeInsets.all(12),
        margin: const EdgeInsets.all(6),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             Text(title,
                style: TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
             Text(message,
                style: TextStyle(color: Colors.white)),
            const SizedBox(height: 16),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () {
                       toastification.dismiss(holder);
                    // Perform an action when the button is pressed
                  },
                  child: const Text('ok'),
                ),
              ],
            ),
          ],
        ),
      );
    },
  );
}
