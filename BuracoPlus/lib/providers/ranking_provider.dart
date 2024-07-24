import 'package:buracoplus/models/ranking_model.dart';
import 'package:flutter/foundation.dart';

class RankingProvider with ChangeNotifier {
  List<RankingModel> rankingList = [];
  List<RankingModel> top3Rankings = [];
  bool isProfessional = false;
  RankingModel myRanking = RankingModel(playerRank: 0, playerName: "playerName", avatarUrl: "avatarUrl", playerPoints: 0, playerID: "playerID");

  RankingProvider() {

    _initializeDummyData(isProfessional);
  }
  // change the rule
  void setRule(bool isPro){
    isProfessional = isPro;
    _initializeDummyData(isProfessional)    ;
    notifyListeners();
  }

   // instead of dummy data get the data from api and assign the ranking List only.
  void _initializeDummyData(bool isProfessional) {
   // add dummy data into the list
   if(isProfessional){
     rankingList = [
       RankingModel(
         playerID:"user01" ,
         playerRank: 1,
         playerName: 'Player Pro',
         avatarUrl: 'https://i.pravatar.cc/301',
         playerPoints: 2500,
       ),
       RankingModel(
         playerID:"user02" ,
         playerRank: 2,
         playerName: 'Player Tro',
         avatarUrl: 'https://i.pravatar.cc/302',
         playerPoints: 2400,
       ),
       RankingModel(
         playerID:"user03" ,
         playerRank: 3,
         playerName: 'Player Fro',
         avatarUrl: 'https://i.pravatar.cc/303',
         playerPoints: 2300,
       ),
     ];
   } else {
     rankingList = [
       RankingModel(
         playerID:"user01" ,
         playerRank: 1,
         playerName: 'Player One',
         avatarUrl: 'https://i.pravatar.cc/301',
         playerPoints: 1500,
       ),
       RankingModel(
         playerID:"user02" ,
         playerRank: 2,
         playerName: 'Player Two',
         avatarUrl: 'https://i.pravatar.cc/302',
         playerPoints: 1400,
       ),
       RankingModel(
         playerID:"user03" ,
         playerRank: 3,
         playerName: 'Player Three',
         avatarUrl: 'https://i.pravatar.cc/303',
         playerPoints: 1300,
       ),
     ];
     //notifyListeners();
   }

    // get the top 3 players by points 
    top3Rankings =  getTop3Players();
    // get my own [current player] ranking data
      myRanking = getPlayerRankingById("user03") ;

    // Notify listeners that the data has been updated
    notifyListeners();
  }
  // Function to find the top 3 rankings from the  'rankingList'
  List<RankingModel> getTop3Players() {
    // Sort the list based on playerPoints in descending order
    List<RankingModel> sortedList = List.from(rankingList);
    sortedList.sort((a, b) => b.playerPoints.compareTo(a.playerPoints));

    // Return the top 3 players
    return sortedList.take(3).toList();
  }
   //find ranking data by playerID
  RankingModel getPlayerRankingById(String playerID) {
    try {
      return rankingList.firstWhere((player) => player.playerID == playerID);
    } catch (e) {

      return rankingList[0]; // Return first entry if no player is found with the given id
    }
  }
  
}
