import 'package:buracoplus/models/tables.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class LobbyCard extends StatelessWidget {
  final GameTable table;
  final String currentlyLoggedInPlayerId;
  final Function callback;
  const LobbyCard(
      {super.key,
      required this.table,
      required this.callback,
      required this.currentlyLoggedInPlayerId});

  @override
  Widget build(BuildContext context) {
    TablePlayers? chair0;
    TablePlayers? chair1;
    TablePlayers? chair2;
    TablePlayers? chair3;

    chair0 = table.players?.firstWhere(
        (itemToCheck) => itemToCheck?.chairId == 0,
        orElse: () => TablePlayers());

    chair1 = table.players?.firstWhere(
        (itemToCheck) => itemToCheck?.chairId == 1,
        orElse: () => TablePlayers());

    chair2 = table.players?.firstWhere(
        (itemToCheck) => itemToCheck?.chairId == 2,
        orElse: () => TablePlayers());

    chair3 = table.players?.firstWhere(
        (itemToCheck) => itemToCheck?.chairId == 3,
        orElse: () => TablePlayers());

    return Container(
      width: MediaQuery.of(context).size.width * 0.29,
      height: MediaQuery.of(context).size.height * 0.27,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
          bottomLeft: Radius.circular(10),
          bottomRight: Radius.circular(10),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Column(
              children: [
                if (table.numberOfPlayers == 4)
                  Expanded(
                    child: Stack(
                      children: [
                        chair0?.chairId == null
                            ? Positioned(
                                top: 5,
                                left: 60,
                                child: GestureDetector(
                                  onTap: () {
                                    callback({"type": "SIT", "chairId": 0});
                                  },
                                  child: const SizedBox(
                                    height: 40,
                                    width: 40,
                                    child: Image(
                                      image: AssetImage(
                                          'assets/seats/f-chairdraft.png'),
                                    ),
                                  ),
                                ),
                              )
                            : Positioned(
                                left: 65, top: 5, child: chairPlayer(chair0)),
                        chair3?.chairId == null
                            ? Positioned(
                                left: 15,
                                top: 40,
                                child: GestureDetector(
                                  onTap: () {
                                    callback({"type": "SIT", "chairId": 3});
                                  },
                                  child: const SizedBox(
                                    height: 40,
                                    width: 40,
                                    child: Image(
                                      image: AssetImage(
                                          'assets/seats/chairdraft.png'),
                                    ),
                                  ),
                                ),
                              )
                            : Positioned(
                                left: 20, top: 40, child: chairPlayer(chair3)),
                        chair1?.chairId == null
                            ? Positioned(
                                left: 105,
                                top: 40,
                                child: GestureDetector(
                                  onTap: () {
                                    callback({"type": "SIT", "chairId": 1});
                                  },
                                  child: SizedBox(
                                    height: 40,
                                    width: 40,
                                    child: Transform(
                                      alignment: Alignment.center,
                                      transform: Matrix4.rotationY(math.pi),
                                      child: const Image(
                                        image: AssetImage(
                                            'assets/seats/chairdraft.png'),
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            : Positioned(
                                left: 110, top: 40, child: chairPlayer(chair1)),
                        const Positioned(
                          left: 60,
                          top: 40,
                          child: SizedBox(
                            height: 40,
                            width: 40,
                            child: Image(
                              image: AssetImage('assets/seats/tabledraft.png'),
                            ),
                          ),
                        ),
                        chair2?.chairId == null
                            ? Positioned(
                                left: 60,
                                top: 70,
                                child: GestureDetector(
                                  onTap: () {
                                    callback({"type": "SIT", "chairId": 2});
                                  },
                                  child: const SizedBox(
                                    height: 40,
                                    width: 40,
                                    child: Image(
                                      image: AssetImage(
                                          'assets/seats/b-chairdraft.png'),
                                    ),
                                  ),
                                ),
                              )
                            : Positioned(
                                left: 67, top: 73, child: chairPlayer(chair2)),
                      ],
                    ),
                  ),
                if (table.numberOfPlayers == 2)
                  Expanded(
                    child: Stack(
                      children: [
                        chair0?.chairId == null
                            ? Positioned(
                                left: 15,
                                top: 40,
                                child: GestureDetector(
                                  onTap: () {
                                    callback({"type": "SIT", "chairId": 0});
                                  },
                                  child: const SizedBox(
                                    height: 40,
                                    width: 40,
                                    child: Image(
                                      image: AssetImage(
                                          'assets/seats/chairdraft.png'),
                                    ),
                                  ),
                                ),
                              )
                            : Positioned(
                                left: 15, top: 30, child: chairPlayer(chair0)),
                        chair2?.chairId == null
                            ? Positioned(
                                left: 105,
                                top: 40,
                                child: GestureDetector(
                                  onTap: () {
                                    callback({"type": "SIT", "chairId": 2});
                                  },
                                  child: SizedBox(
                                    height: 40,
                                    width: 40,
                                    child: Transform(
                                      alignment: Alignment.center,
                                      transform: Matrix4.rotationY(math.pi),
                                      child: const Image(
                                        image: AssetImage(
                                            'assets/seats/chairdraft.png'),
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            : Positioned(
                                left: 115, top: 30, child: chairPlayer(chair2)),
                        const Positioned(
                          left: 60,
                          top: 40,
                          child: SizedBox(
                            height: 40,
                            width: 40,
                            child: Image(
                              image: AssetImage('assets/seats/tabledraft.png'),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              padding: const EdgeInsets.only(right: 10, top: 10, bottom: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    table.tableName?.toString() ?? "",
                    maxLines: 1,
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                        fontSize: 13,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        table.pointsToWin?.toString() ?? "",
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                            fontSize: 13,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "${table.turnTime?.toString()} Secs",
                        style: const TextStyle(
                            fontSize: 13,
                            color: Color(0xffffd44a),
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  chairPlayer(TablePlayers? chair) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(5),
      child: GestureDetector(
        onTap: () {
          if (currentlyLoggedInPlayerId == chair?.playerId) {
            callback({"type": "LEAVE_TABLE"});
          }
        },
        child: Container(
          color: Colors.black,
          child: Column(
            children: [
              SizedBox(
                child: Image.asset(
                  'assets/menuIcons/blankAvatar_2.png',
                  fit: BoxFit.cover,
                  height: 20,
                  width: 30,),
              ),
              Container(
                padding: const EdgeInsets.only(top: 2, bottom: 2),
                child: Text(
                  chair?.playerId
                          ?.substring((chair.playerId?.length ?? 0) - 5) ??
                      "",
                  style: const TextStyle(color: Colors.white, fontSize: 10),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void sitAtTable(GameTable table) {}
}
