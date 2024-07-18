import '../models/logged_in_player.dart';

class User {
  static LoggedInPlayer? loggedInPlayer;

  LoggedInPlayer? setLoggedInPlayer(Map<String, dynamic> user) {
    loggedInPlayer = LoggedInPlayer.fromJson(user);
    return loggedInPlayer;
  }

  getPlayer() {
    return loggedInPlayer;
  }
}
