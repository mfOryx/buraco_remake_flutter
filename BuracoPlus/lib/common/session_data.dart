class SessionData {
  static final SessionData _instance = SessionData._internal();

  String? _socketId;
  String? _playerId;

  SessionData._internal();

  static SessionData get instance => _instance;

  String? get socketId => _socketId;
  set socketId(String? value) => _socketId = value;

  String? get playerId => _playerId;
  set playerId(String? value) => _playerId = value;

  void clearSessionData() {
    _socketId = null;
    _playerId = null;
  }
}
