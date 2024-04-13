class MessageData {
  final int messageId;
  final String socketId;

  MessageData({required this.messageId, required this.socketId});

  // Metodo factory per creare un'istanza di MessageData da un Map
  factory MessageData.fromJson(Map<String, dynamic> json) {
    return MessageData(
      messageId: json['messageId'],
      socketId: json['socketId'],
    );
  }
}
