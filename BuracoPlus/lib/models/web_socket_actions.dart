class WebSocketAction {
  dynamic message;
  Map<String, dynamic> parameters;

  WebSocketAction(this.message, {Map<String, dynamic>? params})
      : parameters = params ?? {};
}
