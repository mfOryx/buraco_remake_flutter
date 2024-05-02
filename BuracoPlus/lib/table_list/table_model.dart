import 'package:buracoplus/table_list/player_model.dart';

class TableObject {
  String tableName;
  int turnDuration;
  int requiredPoints;
  int maxPlayers;
  List<Player?> players;

  TableObject({
    required this.tableName,
    required this.turnDuration,
    required this.requiredPoints,
    required this.maxPlayers,
    required this.players,
  });
}
