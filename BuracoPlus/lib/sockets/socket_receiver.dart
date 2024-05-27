import 'package:socket_io_client/socket_io_client.dart' as io;

class SocketReceiver {
  final io.Socket _socket;

  SocketReceiver(this._socket);

  void on(String event, Function(dynamic) callback) {
    _socket.on(event, (data) {
      callback(data);
    });
  }
}
