import 'package:flutter/foundation.dart';
class RankingModel{

  String playerID ;
      int playerRank ;
      String playerName ;
      String avatarUrl ;
      int playerPoints;


     RankingModel({
       required this.playerRank,
       required this.playerName,
       required this.avatarUrl,
       required this.playerPoints,
       required this.playerID,
     });
}