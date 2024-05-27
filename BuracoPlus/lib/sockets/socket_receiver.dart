import 'package:socket_io_client/socket_io_client.dart' as IO;

class SocketReceiver {
  final IO.Socket _socket;

  SocketReceiver(this._socket);

  void on(String event, Function(dynamic) callback) {
    _socket.on(event, (data) {
      callback(data);
    });
  }
}
