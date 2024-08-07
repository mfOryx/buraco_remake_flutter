import 'package:shared_preferences/shared_preferences.dart';

class TablePlayers {
  String? playerId;
  String? ip;
  int? chairId;

  TablePlayers({
    this.playerId,
    this.ip,
    this.chairId,
  });
  void updateFromPrefs(String prefix, SharedPreferences prefs) {
    playerId = prefs.getString('${prefix}PlayerId') ?? playerId;
    ip = prefs.getString('${prefix}Ip') ?? ip;
    chairId = prefs.getInt('${prefix}ChairId') ?? chairId;
  }
  Future<void> saveToPrefs(String prefix, SharedPreferences prefs) async {
    await prefs.setString('${prefix}PlayerId', playerId!);
    await prefs.setString('${prefix}Ip', ip!);
    await prefs.setInt('${prefix}ChairId', chairId!);
  }
  TablePlayers.fromJson(Map<String, dynamic> json) {
    playerId = json['playerId']?.toString();
    ip = json['ip']?.toString();
    chairId = int.tryParse(json['chairId']?.toString() ?? '');
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['playerId'] = playerId;
    data['ip'] = ip;
    data['chairId'] = chairId;
    return data;
  }
}

class GameTable {
  String? id;
  String? tableName;
  int? numberOfPlayers;
  String? password;
  int? turnTime;
  int? pointsToWin;
  int? gameRule;
  int? isDirect;
  int? isMakart;
  int? gameState;
  int? cardsFrontImage;
  int? cardsBackImage;
  int? tableBackgroundColor;
  int? chatOn;
  int? minLevelToJoin;
  int? isTournament;
  String? date;
  List<TablePlayers?>? players;

  GameTable({
    this.id,
    this.tableName,
    this.numberOfPlayers,
    this.password,
    this.turnTime,
    this.pointsToWin,
    this.gameRule,
    this.isDirect,
    this.isMakart,
    this.gameState,
    this.cardsFrontImage,
    this.cardsBackImage,
    this.tableBackgroundColor,
    this.chatOn,
    this.minLevelToJoin,
    this.isTournament,
    this.date,
    this.players,
  });
  GameTable.fromJson(Map<String, dynamic> json) {
    id = json['_id']?.toString();
    tableName = json['tableName']?.toString();
    numberOfPlayers = int.tryParse(json['numberOfPlayers']?.toString() ?? '');
    password = json['password']?.toString();
    turnTime = int.tryParse(json['turnTime']?.toString() ?? '');
    pointsToWin = int.tryParse(json['pointsToWin']?.toString() ?? '');
    gameRule = int.tryParse(json['gameRule']?.toString() ?? '');
    isDirect = int.tryParse(json['isDirect']?.toString() ?? '');
    isMakart = int.tryParse(json['isMakart']?.toString() ?? '');
    gameState = int.tryParse(json['gameState']?.toString() ?? '');
    cardsFrontImage = int.tryParse(json['cardsFrontImage']?.toString() ?? '');
    cardsBackImage = int.tryParse(json['cardsBackImage']?.toString() ?? '');
    tableBackgroundColor =
        int.tryParse(json['tableBackgroundColor']?.toString() ?? '');
    chatOn = int.tryParse(json['chatOn']?.toString() ?? '');
    minLevelToJoin = int.tryParse(json['minLevelToJoin']?.toString() ?? '');
    isTournament = int.tryParse(json['isTournament']?.toString() ?? '');
    date = json['date']?.toString();
    if (json['players'] != null && (json['players'] is List)) {
      final v = json['players'];
      final arr0 = <TablePlayers>[];
      v.forEach((v) {
        arr0.add(TablePlayers.fromJson(v));
      });
      players = arr0;
    }
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['_id'] = id;
    data['tableName'] = tableName;
    data['numberOfPlayers'] = numberOfPlayers;
    data['password'] = password;
    data['turnTime'] = turnTime;
    data['pointsToWin'] = pointsToWin;
    data['gameRule'] = gameRule;
    data['isDirect'] = isDirect;
    data['isMakart'] = isMakart;
    data['gameState'] = gameState;
    data['cardsFrontImage'] = cardsFrontImage;
    data['cardsBackImage'] = cardsBackImage;
    data['tableBackgroundColor'] = tableBackgroundColor;
    data['chatOn'] = chatOn;
    data['minLevelToJoin'] = minLevelToJoin;
    data['isTournament'] = isTournament;
    data['date'] = date;
    if (players != null) {
      final v = players;
      final arr0 = [];
      for (var v in v!) {
        arr0.add(v!.toJson());
      }
      data['players'] = arr0;
    }
    return data;
  }
}
