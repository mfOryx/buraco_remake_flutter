class EmojiManager {
  static final EmojiManager _instance = EmojiManager._internal();

  factory EmojiManager() {
    return _instance;
  }

  EmojiManager._internal();

  final Map<String, List<String>> emojis = {
    'Love': ['assets/heart.png', 'assets/inLove.png'],
    'Fun': ['assets/soccerBall.png', 'assets/beer.png'],
  };
}
