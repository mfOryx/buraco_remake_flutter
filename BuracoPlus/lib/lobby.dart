import 'dart:io';

import 'package:buracoplus/blocks/lobby_card.dart';
import 'package:buracoplus/blocks/lobby_user_stats.dart';
import 'package:buracoplus/create_table_multi_player.dart';
import 'package:buracoplus/helpers/user.dart';
import 'package:buracoplus/models/logged_in_player.dart';
import 'package:buracoplus/models/tables.dart';
import 'package:buracoplus/providers/dialog_provider.dart';
import 'package:buracoplus/sockets/socket_service.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'common/general_functions.dart';
import 'common/translation_manager.dart';

class Lobby extends StatefulWidget {
  const Lobby({super.key});

  @override
  State<Lobby> createState() => _LobbyState();
}

class _LobbyState extends State<Lobby> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool isMenuVisible = false;
  late final socketService = Provider.of<SocketService>(context, listen: false);
  int totalPages = 0;
  List<GameTable> gameTables = [];
  List<GameTable> gameTablesFiltered = [];
  int playerOnline = 100;
  int numberofTables = 70;
  LoggedInPlayer currentlyLoggedInPlayer = User().getPlayer();
  bool classicToggle = false;
  bool professionalToggle = true;
  bool twoPlayersToggle = true;
  bool fourPlayersToggle = false;
  bool directToggle = true;
  bool indirectToggle = false;
  bool makartCheckbox = true;
  bool pointsOne = true;
  bool pointsTwo = false;
  bool pointsThree = false;
  bool pointsFour = false;
  bool turnTimeOne = true;
  bool turnTimeTwo = false;
  bool turnTimeThree = false;
  bool turnTimeFour = false;
  bool passwordToggle = false;
  bool chatToggle = false;
  bool isIphone = false;
  bool isIpad = false;
  bool createTablePopup = false;
  String? selectedLevel;
  final List<String> levels =
  [
    "None", "Level 5", "Level 10", "Level 15", "Level 20", "Level 25", "Level 30", "Level 35", "Level 40", "Level 45", "Level 50",
    "Level 55", "Level 60", "Level 65", "Level 70", "Level 75", "Level 80", "Level 85", "Level 90", "Level 95", "Level 100",
    "Level 105", "Level 110", "Level 115", "Level 120", "Level 125", "Level 130", "Level 135", "Level 140"
  ];

  final PageController frontCardImageController = PageController();
  int currentFrontCardImage = 0;
  final PageController backCardImageController = PageController();
  int currentBackCardImage = 0;
  final PageController tableImageController = PageController();
  int currentTableImage = 0;

  final List<String> tableImagePaths = [
    'assets/tablesImages/shop_table_black.png',
    'assets/tablesImages/shop_table_champagne.png',
    'assets/tablesImages/shop_table_emerald.png',
    'assets/tablesImages/shop_table_green.png',
    'assets/tablesImages/shop_table_maroon.png',
    'assets/tablesImages/shop_table_mars.png',
    'assets/tablesImages/shop_table_navy.png',
    'assets/tablesImages/shop_table_petrol.png',
    'assets/tablesImages/shop_table_red_risess.png',
    'assets/tablesImages/shop_table_teal.png',
    'assets/tablesImages/table_blue.png',
  ];

  final List<String> cardImageFrontPaths = [
    'assets/cardImagesFront/cards-front-01.png',
    'assets/cardImagesFront/cards-front-02.png',
    'assets/cardImagesFront/cards-front-03.png'
  ];

  final List<String> cardImageBackPaths = [
    'assets/cardImagesBack/cards-back-01.png',
    'assets/cardImagesBack/cards-back-02.png',
    'assets/cardImagesBack/cards-back-03.png'
  ];

  @override
  void initState() {
    super.initState();
    getTables();
    checkDeviceType();
  }

  bool isIOS() {
    return Platform.isIOS;
  }

  bool isAndroid() {
    return Platform.isAndroid;
  }

  Future<void> checkDeviceType() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    IosDeviceInfo iosInfo = await deviceInfo.iosInfo;

    if (iosInfo.model.toLowerCase().contains('ipad')) {
      isIpad = true;
      if (kDebugMode) {
        print('This device is an iPad');
      }
    } else if (iosInfo.model.toLowerCase().contains('iphone')) {
      isIphone = true;
      if (kDebugMode) {
        print('This device is an iPhone');
      }
    } else {
      if (kDebugMode) {
        print('This device is neither iPhone nor iPad');
      }
    }
  }

  void toggleSelection(String toggleSelected) {
    switch (toggleSelected) {
      case "classicToggle":
        setState(() {
          classicToggle = true;
          professionalToggle = false;
        });
        return;
      case "professionalToggle":
        setState(() {
          professionalToggle = true;
          classicToggle = false;
        });
        return;
      case "twoPlayersToggle":
        setState(() {
          twoPlayersToggle = true;
          fourPlayersToggle = false;
        });
        return;
      case "fourPlayersToggle":
        setState(() {
          fourPlayersToggle = true;
          twoPlayersToggle = false;
        });
        return;
      case "directToggle":
        setState(() {
          directToggle = true;
          indirectToggle = false;
        });
        return;
      case "indirectToggle":
        setState(() {
          indirectToggle = true;
          directToggle = false;
        });
        return;
      case "makartCheckbox":
        setState(() {
          makartCheckbox = !makartCheckbox;
        });
        return;
      case "pointsOne":
        setState(() {
          pointsOne = true;
          pointsTwo = false;
          pointsThree = false;
          pointsFour = false;
        });
        return;
      case "pointsTwo":
        setState(() {
          pointsTwo = true;
          pointsOne = false;
          pointsThree = false;
          pointsFour = false;
        });
        return;
      case "pointsThree":
        setState(() {
          pointsThree = true;
          pointsOne = false;
          pointsTwo = false;
          pointsFour = false;
        });
        return;
      case "pointsFour":
        setState(() {
          pointsFour = true;
          pointsOne = false;
          pointsTwo = false;
          pointsThree = false;
        });
        return;
      case "turnTimeOne":
        setState(() {
          turnTimeOne = true;
          turnTimeTwo = false;
          turnTimeThree = false;
          turnTimeFour = false;
        });
        return;
      case "turnTimeTwo":
        setState(() {
          turnTimeOne = false;
          turnTimeTwo = true;
          turnTimeThree = false;
          turnTimeFour = false;
        });
        return;
      case "turnTimeThree":
        setState(() {
          turnTimeOne = false;
          turnTimeTwo = false;
          turnTimeThree = true;
          turnTimeFour = false;
        });
        return;
      case "turnTimeFour":
        setState(() {
          turnTimeOne = false;
          turnTimeTwo = false;
          turnTimeThree = false;
          turnTimeFour = true;
        });
        return;
      default:
        return;
    }
  }

  getTables() async {
    if (socketService.isConnected()) {
      Map<String, dynamic> getAllTables = await socketService.emitWithAck(
          'getAllTables', {'playerId': currentlyLoggedInPlayer.id});

      if (getAllTables.containsKey('tablesList')) {
        List allTables = getAllTables['tablesList'];

        if (allTables.isNotEmpty) {
          gameTables =
              allTables.map((element) => GameTable.fromJson(element)).toList();
          gameTablesFiltered = gameTables;
        }
        setState(() {
          totalPages = (gameTablesFiltered.length / 6).ceil();
        });
      }
    }
  }

  sitAtTable(int chairId, String tableId) async {
    if (kDebugMode) {
      print('chairId: $chairId, tableId: $tableId');
    }
    String ipAddress = await getPublicIP();

    if (socketService.isConnected()) {
      Map<String, dynamic> response =
          await socketService.emitWithAck('sitAtTable', {
        'playerId': currentlyLoggedInPlayer.id,
        "tableId": tableId,
        "chairId": chairId,
        "ip": ipAddress
      });

      getTables();

      if (kDebugMode) {
        print(response);
      }
    }
  }

  leaveTable(String tableId) async {
    if (socketService.isConnected()) {
      Map<String, dynamic> response = await socketService.emitWithAck(
          'leaveTable',
          {'playerId': currentlyLoggedInPlayer.id, "tableId": tableId});

      getTables();

      if (kDebugMode) {
        print(response);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final translationManager = Provider.of<TranslationManager>(context);
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          if (isMenuVisible) {
            setState(() {
              isMenuVisible = false;
            });
          }
        },
        child: Stack(
          children: [
            Center(
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color.fromRGBO(
                          114, 60, 125, 1.0), // Colore medio lato sinistro
                      Color.fromRGBO(
                          141, 107, 147, 1.0), // Colore medio lato superiore
                      Color.fromRGBO(
                          96, 132, 166, 1.0), // Colore medio lato inferiore
                      Color.fromRGBO(
                          88, 104, 147, 1.0), // Colore medio lato destro
                    ],
                    stops: [
                      0.0,
                      0.33,
                      0.66,
                      1.0
                    ], // Regola questi valori per i tuoi bisogni
                  ),
                ),
                child: SafeArea(
                  right: false,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.white.withOpacity(0.2),
                                  ),
                                  child: const Icon(
                                    Icons.search,
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(
                                  width: 30,
                                ),
                                Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.white.withOpacity(0.2),
                                  ),
                                  child: const Icon(
                                    Icons.message,
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(
                                  width: 30,
                                ),
                                Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.white.withOpacity(0.2),
                                  ),
                                  child: const Icon(
                                    Icons.tag_rounded,
                                    color: Colors.white,
                                  ),
                                )
                              ],
                            ),
                            Container(
                                width: 450,
                                margin: const EdgeInsets.only(right: 30),
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white.withOpacity(0.2),
                                ),
                                child: Row(
                                  children: [
                                    LobbyUserStats(
                                        currentlyLoggedInPlayer.diamonds
                                            .toString(),
                                        'diamond-final.png'),
                                    LobbyUserStats(
                                        currentlyLoggedInPlayer.coins
                                            .toString(),
                                        'BuracoPlusCoin.png'),
                                    LobbyUserStats(
                                        currentlyLoggedInPlayer.lives
                                            .toString(),
                                        'BuracoPlusLife_big.png'),
                                  ],
                                ))
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Btn('CREATE TABLE', () {
                              setState(() {
                                createTablePopup = !createTablePopup;
                                // Provider.of<DialogProvider>(context, listen: false).showDialog();
                              });

                            }, true),
                            Flexible(
                              flex: 2,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Btn('Classic', () {}, true),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Btn('1vs1', () {}, false),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Btn('2vs2', () {}, false),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Btn('Professional', () {}, false),
                                ],
                              ),
                            ),
                            Row(
                              children: [
                                Row(
                                  children: [
                                    Image.asset(
                                      'assets/lobby/friends_final.png',
                                      height: 20,
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      playerOnline.toString(),
                                      style: const TextStyle(
                                          color: Colors.white,
                                          shadows: [
                                            Shadow(
                                                color: Colors.black,
                                                offset: Offset(3, 3),
                                                blurRadius: 2)
                                          ],
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Row(
                                  children: [
                                    Image.asset(
                                      'assets/lobby/table.png',
                                      height: 20,
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      numberofTables.toString(),
                                      style: const TextStyle(
                                          color: Colors.white,
                                          shadows: [
                                            Shadow(
                                                color: Colors.black,
                                                offset: Offset(3, 3),
                                                blurRadius: 2)
                                          ],
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(
                              width: 30,
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 5),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                        width: 1,
                                        color: const Color(0xff786f37)),
                                    gradient: const LinearGradient(
                                      begin: Alignment.centerLeft,
                                      end: Alignment.centerRight,
                                      stops: [0, 0.5, 1.0],
                                      colors: [
                                        Color(0xffddd49e),
                                        Colors.white,
                                        Color(0xffddd49e),
                                      ],
                                    )),
                                child: const Text(
                                  'TOURNAMENTS',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 25,
                            )
                          ],
                        ),
                        Expanded(
                          child: Stack(
                            children: [
                              SizedBox.expand(
                                child: Stack(
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.only(top: 10),
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.8,
                                      child: PageView.builder(
                                        itemCount:
                                            totalPages, // Number of pages
                                        itemBuilder: (context, pageIndex) {
                                          if (kDebugMode) {
                                            print("page $pageIndex");
                                          }
                                          if (kDebugMode) {
                                            print("totalPages $totalPages");
                                          }
                                          if (kDebugMode) {
                                            print(
                                                "gameTables ${gameTables.length}");
                                          }
                                          int rangeEnd = 0;
                                          int rangeStart = pageIndex * 6;
                                          if (pageIndex == totalPages - 1) {
                                            rangeEnd = gameTables.length;
                                          } else {
                                            rangeEnd = rangeStart + 6;
                                          }

                                          List<GameTable> subTable =
                                              gameTablesFiltered
                                                  .getRange(
                                                      rangeStart, rangeEnd)
                                                  .toList();

                                          return Wrap(
                                            runSpacing: 10,
                                            spacing: 20,
                                            children: subTable.map((e) {
                                              return LobbyCard(
                                                table: e,
                                                currentlyLoggedInPlayerId:
                                                    currentlyLoggedInPlayer.id!,
                                                callback: (params) {
                                                  if (params['type'] == "SIT") {
                                                    sitAtTable(
                                                        params['chairId'],
                                                        e.id.toString());
                                                  } else if (params['type'] ==
                                                      "LEAVE_TABLE") {
                                                    leaveTable(e.id.toString());
                                                  }
                                                },
                                              );
                                            }).toList(),
                                          );
                                        },
                                      ),
                                    ),

                                    // Posiziona il blocco successivo attaccato al fondo dello schermo
                                    Align(
                                      alignment: Alignment.bottomCenter,
                                      child: Stack(
                                        clipBehavior: Clip.none,
                                        children: [
                                          Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.6,
                                            height: 50,

                                            decoration: BoxDecoration(
                                              color: Colors.white.withOpacity(
                                                  0.2), // Imposta un colore con opacità
                                              borderRadius:
                                                  const BorderRadius.only(
                                                topLeft: Radius.circular(
                                                    10), // Angoli arrotondati in alto a sinistra
                                                topRight: Radius.circular(10),
                                                bottomLeft: Radius.circular(
                                                    10), // Angoli arrotondati in alto a sinistra
                                                bottomRight:
                                                    Radius.circular(10),
                                              ),
                                            ),
                                            // Imposta un colore con opacità
                                            child: Padding(
                                              padding: const EdgeInsets.all(
                                                  5.0), // Aggiungi padding all'interno del Container
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  FloatingActionButton(
                                                    heroTag: null,
                                                    onPressed: () {},
                                                    backgroundColor:
                                                        Colors.transparent,
                                                    splashColor:
                                                        Colors.transparent,
                                                    elevation: 0.0,
                                                    child: Column(children: [
                                                      Image.asset(
                                                        'assets/menuIcons/mail.png',
                                                        width: 25,
                                                        height: 25,
                                                      ),
                                                      Text(
                                                          translationManager
                                                              .translate(
                                                                  'txtMessages')
                                                              .toUpperCase(),
                                                          style:
                                                              const TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize:
                                                                      10)),
                                                    ]),
                                                  ),
                                                  FloatingActionButton(
                                                    heroTag: null,
                                                    onPressed: () {},
                                                    backgroundColor:
                                                        Colors.transparent,
                                                    splashColor:
                                                        Colors.transparent,
                                                    elevation: 0.0,
                                                    child: Column(children: [
                                                      Image.asset(
                                                        'assets/menuIcons/ic_contacts.png',
                                                        width: 25,
                                                        height: 25,
                                                      ),
                                                      Text(
                                                          translationManager
                                                              .translate(
                                                                  'txtContacts')
                                                              .toUpperCase(),
                                                          style:
                                                              const TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize:
                                                                      10)),
                                                    ]),
                                                  ),
                                                  FloatingActionButton(
                                                    heroTag: null,
                                                    onPressed: () {},
                                                    backgroundColor:
                                                        Colors.transparent,
                                                    splashColor:
                                                        Colors.transparent,
                                                    elevation: 0.0,
                                                    child: Column(children: [
                                                      Image.asset(
                                                        'assets/menuIcons/ic_clubs.png',
                                                        width: 25,
                                                        height: 25,
                                                      ),
                                                      Text(
                                                          translationManager
                                                              .translate(
                                                                  'txtClubs')
                                                              .toUpperCase(),
                                                          style:
                                                              const TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize:
                                                                      10)),
                                                    ]),
                                                  ),
                                                  const SizedBox(
                                                      height: 45, width: 45),
                                                  FloatingActionButton(
                                                    heroTag: null,
                                                    onPressed: () {},
                                                    backgroundColor:
                                                        Colors.transparent,
                                                    splashColor:
                                                        Colors.transparent,
                                                    elevation: 0.0,
                                                    child: Column(children: [
                                                      Image.asset(
                                                        'assets/menuIcons/ic_settings.png',
                                                        width: 25,
                                                        height: 25,
                                                      ),
                                                      Text(
                                                          translationManager
                                                              .translate(
                                                                  'txtOptions')
                                                              .toUpperCase(),
                                                          style:
                                                              const TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize:
                                                                      10)),
                                                    ]),
                                                  ),
                                                  FloatingActionButton(
                                                    heroTag: null,
                                                    onPressed: () {},
                                                    backgroundColor:
                                                        Colors.transparent,
                                                    splashColor:
                                                        Colors.transparent,
                                                    elevation: 0.0,
                                                    child: Column(children: [
                                                      Image.asset(
                                                        'assets/menuIcons/ic_rankings.png',
                                                        width: 25,
                                                        height: 25,
                                                      ),
                                                      Text(
                                                          translationManager
                                                              .translate(
                                                                  'txtRankings')
                                                              .toUpperCase(),
                                                          style:
                                                              const TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize:
                                                                      10)),
                                                    ]),
                                                  ),
                                                  FloatingActionButton(
                                                    heroTag: null,
                                                    onPressed: () {},
                                                    backgroundColor:
                                                        Colors.transparent,
                                                    splashColor:
                                                        Colors.transparent,
                                                    elevation: 0.0,
                                                    child: Column(children: [
                                                      Image.asset(
                                                        'assets/menuIcons/ic_store.png',
                                                        width: 25,
                                                        height: 25,
                                                      ),
                                                      Text(
                                                          translationManager
                                                              .translate(
                                                                  'txtShop')
                                                              .toUpperCase(),
                                                          style:
                                                              const TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize:
                                                                      10)),
                                                    ]),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          // Pulsante che sporge fuori
                                          Positioned(
                                            top:
                                                -10, // Metà dell'altezza del FloatingActionButton per farlo sporgere correttamente
                                            left: (MediaQuery.of(context)
                                                            .size
                                                            .width *
                                                        0.6 -
                                                    70) /
                                                2,
                                            width: 70,
                                            height: 70,
                                            child: FloatingActionButton(
                                              heroTag: null,
                                              onPressed: () {},
                                              backgroundColor:
                                                  Colors.transparent,
                                              splashColor: Colors.transparent,
                                              elevation: 0.0,
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  border: Border.all(
                                                    color: Colors.white
                                                        .withOpacity(0.2),
                                                    width: 5.0,
                                                  ),
                                                ),
                                                child: Container(
                                                  width: 70,
                                                  height: 70,
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    border: Border.all(
                                                      color: Colors.white,
                                                      width: 2.0,
                                                    ),
                                                  ),
                                                  child: ClipOval(
                                                    child: Image.asset(
                                                      'assets/menuIcons/blankAvatar_2.png',
                                                      width: 60,
                                                      height: 60,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Stack(
              children: [
                if (createTablePopup)
                  Positioned.fill(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          createTablePopup = false;
                        });
                      },
                      child: Container(
                        color: Colors.black.withOpacity(0.3),
                      ),
                    ),
                  ),
                // CreateTableMP(),
                Visibility(
                  visible: createTablePopup,
                  child: Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: EdgeInsets.only(right: screenWidth * 0.03, top: screenHeight * 0.022),
                      child: Align(
                        alignment: Alignment.topRight,
                        child: Container(
                          width: isIpad
                              ? screenWidth * 0.48
                              : (isIphone ? screenWidth * 0.45 : screenWidth * 0.45),
                          height: isIpad
                              ? screenHeight * 0.9
                              : (isIphone ? screenHeight * 0.95 : screenWidth * screenHeight * 0.95),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            color: const Color.fromRGBO(210, 210, 210, 1.0),
                          ),
                          child: Stack(
                            children: [
                              Container(
                                width: isIpad
                                    ? screenWidth * 0.55
                                    : (isIphone ? screenWidth * 0.55 : screenWidth * 0.55),
                                height: isIpad
                                    ? screenHeight * 0.4
                                    : (isIphone ? screenHeight * 0.4 : screenWidth * screenHeight * 0.4),
                                decoration: const BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      Color.fromARGB(255, 90, 110, 150),
                                      Color.fromARGB(255, 115, 70, 130)
                                    ],
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                  ),
                                  borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(20.0),
                                    bottom: Radius.elliptical(200, 25),
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.only(
                                    left: screenWidth * 0.03,
                                    right: isIpad
                                        ? screenWidth * 0.02
                                        : (isIphone ? screenWidth * 0.01 : screenWidth * 0.01),
                                  ),
                                  child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(
                                            top: isIpad ? screenHeight * 0.01 : (isIphone ? screenHeight * 0.005 : screenHeight * 0.005),
                                          ),
                                          child: Text(
                                            translationManager
                                                .translate('txtCreateTable')
                                                .toUpperCase(),
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: isIpad
                                                  ? screenWidth * 0.018
                                                  : (isIphone
                                                  ? screenWidth * 0.015
                                                  : screenWidth * 0.015),
                                            ),
                                          ),
                                        ),
                                        IconButton(
                                          padding: EdgeInsets.only(top: isIpad ? screenHeight * 0.005 : (isIphone ? screenHeight * 0.0 : screenHeight * 0.0),),
                                          alignment: Alignment.topCenter,
                                          icon: const Icon(Icons.close, color: Colors.white),
                                          iconSize: isIpad ? screenWidth * 0.022 : (isIphone ? screenWidth * 0.018 : screenWidth * 0.012),
                                          onPressed: () {
                                            setState(() {
                                              createTablePopup = false;
                                            });
                                          },
                                        ),
                                      ]
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(bottom: isIpad
                                    ? screenWidth * 0.02
                                    : (isIphone ? screenWidth * 0.016 : screenWidth * 0.016),),
                                child: Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Container(
                                    width: isIpad
                                        ? screenWidth * 0.45
                                        : (isIphone ? screenWidth * 0.425 : screenWidth * 0.425),
                                    height: isIpad
                                        ? screenHeight * 0.8
                                        : (isIphone ? screenHeight * 0.85 : screenWidth * screenHeight * 0.85),
                                    decoration: BoxDecoration(
                                      color: const Color.fromRGBO(
                                          240, 240, 240, 1), // Box color
                                      borderRadius: BorderRadius.circular(20.0),
                                    ),
                                    child: Column(
                                      children: [
                                        SizedBox(height: screenHeight * 0.02),
                                        Row(
                                          children: [
                                            SizedBox(
                                              width: screenWidth * 0.022,
                                            ),
                                            Container(
                                              padding: isIpad
                                                  ? const EdgeInsets.symmetric(
                                                  horizontal: 20.0,
                                                  vertical: 15.0)
                                                  : (isIphone
                                                  ? const EdgeInsets
                                                  .symmetric(
                                                  horizontal: 10.0,
                                                  vertical: 5.0)
                                                  : const EdgeInsets
                                                  .symmetric(
                                                  horizontal: 10.0,
                                                  vertical: 5.0)),
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius: isIpad
                                                    ? BorderRadius.circular(20.0)
                                                    : (isIphone
                                                    ? BorderRadius.circular(
                                                    8.0)
                                                    : BorderRadius.circular(
                                                    8.0)),
                                              ),
                                              child: Row(
                                                children: [
                                                  Text(
                                                    translationManager.translate(
                                                        'txtBuracoRule'),
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize:
                                                      screenWidth * 0.013,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                      width: isIpad
                                                          ? screenWidth * 0.04
                                                          : (isIphone
                                                          ? screenWidth * 0.02
                                                          : screenWidth *
                                                          0.02)),
                                                  SizedBox(
                                                    width: isIpad
                                                        ? screenWidth * 0.130
                                                        : (isIphone
                                                        ? screenWidth * 0.130
                                                        : screenWidth *
                                                        0.130),
                                                    height: isIpad
                                                        ? screenHeight * 0.04
                                                        : (isIphone
                                                        ? screenHeight * 0.05
                                                        : screenHeight *
                                                        0.07),
                                                    child: ElevatedButton(
                                                      style: ButtonStyle(
                                                        padding: WidgetStateProperty.all(EdgeInsets.zero),
                                                        shape: WidgetStateProperty
                                                            .all(
                                                          RoundedRectangleBorder(
                                                            borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                4.0),
                                                          ),
                                                        ),
                                                        backgroundColor:
                                                        WidgetStateProperty
                                                            .all(
                                                          classicToggle
                                                              ? const Color
                                                              .fromRGBO(
                                                              90, 64, 126, 1)
                                                              : const Color
                                                              .fromRGBO(230,
                                                              230, 230, 1),
                                                        ),
                                                        side: WidgetStateProperty
                                                            .all(
                                                          const BorderSide(
                                                            color: Colors.black,
                                                            width: 0.4,
                                                          ),
                                                        ),
                                                      ),
                                                      onPressed: () {
                                                        toggleSelection(
                                                            "classicToggle");
                                                      },
                                                      child: Center(
                                                        child: Text(
                                                          translationManager
                                                              .translate(
                                                              'txtItalian'),
                                                          style: TextStyle(
                                                            color: classicToggle
                                                                ? Colors.white
                                                                : Colors.black87,
                                                            fontSize:
                                                            screenWidth *
                                                                0.013,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: screenWidth * 0.01,
                                                  ),
                                                  SizedBox(
                                                    width: isIpad
                                                        ? screenWidth * 0.130
                                                        : (isIphone
                                                        ? screenWidth * 0.130
                                                        : screenWidth *
                                                        0.130),
                                                    height: isIpad
                                                        ? screenHeight * 0.04
                                                        : (isIphone
                                                        ? screenHeight * 0.05
                                                        : screenHeight *
                                                        0.07),
                                                    child: ElevatedButton(
                                                      style: ButtonStyle(
                                                        padding: WidgetStateProperty.all(EdgeInsets.zero),
                                                        shape: WidgetStateProperty
                                                            .all(
                                                          RoundedRectangleBorder(
                                                            borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                4.0),
                                                          ),
                                                        ),
                                                        backgroundColor:
                                                        WidgetStateProperty
                                                            .all(
                                                          professionalToggle
                                                              ? const Color
                                                              .fromRGBO(
                                                              90, 64, 126, 1)
                                                              : const Color
                                                              .fromRGBO(230,
                                                              230, 230, 1),
                                                        ),
                                                        side: WidgetStateProperty
                                                            .all(
                                                          const BorderSide(
                                                            color: Colors.black,
                                                            width: 0.4,
                                                          ),
                                                        ),
                                                      ),
                                                      onPressed: () {
                                                        toggleSelection(
                                                            "professionalToggle");
                                                      },
                                                      child: Center(
                                                        child: Text(
                                                          translationManager
                                                              .translate(
                                                              'txtProfessional'),
                                                          style: TextStyle(
                                                            color:
                                                            professionalToggle
                                                                ? Colors.white
                                                                : Colors
                                                                .black87,
                                                            fontSize:
                                                            screenWidth *
                                                                0.013,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: isIpad
                                              ? (professionalToggle
                                              ? screenHeight * 0.01
                                              : screenHeight * 0.02)
                                              : (isIphone
                                              ? (professionalToggle
                                              ? screenHeight * 0.008
                                              : screenHeight * 0.02)
                                              : (professionalToggle
                                              ? screenHeight * 0.008
                                              : screenHeight * 0.02)),
                                        ),
                                        Row(
                                          children: [
                                            SizedBox(
                                              width: screenWidth * 0.022,
                                            ),
                                            Container(
                                              padding: isIpad
                                                  ? const EdgeInsets.symmetric(
                                                  horizontal: 20.0,
                                                  vertical: 15.0)
                                                  : (isIphone
                                                  ? const EdgeInsets
                                                  .symmetric(
                                                  horizontal: 10.0,
                                                  vertical: 5.0)
                                                  : const EdgeInsets
                                                  .symmetric(
                                                  horizontal: 10.0,
                                                  vertical: 5.0)),
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius: isIpad
                                                    ? BorderRadius.circular(20.0)
                                                    : (isIphone
                                                    ? BorderRadius.circular(
                                                    8.0)
                                                    : BorderRadius.circular(
                                                    8.0)),
                                              ),
                                              child: Row(
                                                children: [
                                                  Text(
                                                    translationManager
                                                        .translate('txtPlayers'),
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize:
                                                      screenWidth * 0.013,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                      width: isIpad
                                                          ? screenWidth * 0.065
                                                          : (isIphone
                                                          ? screenWidth *
                                                          0.046
                                                          : screenWidth *
                                                          0.046)),
                                                  SizedBox(
                                                    width: isIpad
                                                        ? screenWidth * 0.130
                                                        : (isIphone
                                                        ? screenWidth * 0.130
                                                        : screenWidth *
                                                        0.130),
                                                    height: isIpad
                                                        ? screenHeight * 0.04
                                                        : (isIphone
                                                        ? screenHeight * 0.05
                                                        : screenHeight *
                                                        0.07),
                                                    child: ElevatedButton(
                                                      style: ButtonStyle(
                                                        padding: WidgetStateProperty.all(EdgeInsets.zero),
                                                        shape: WidgetStateProperty
                                                            .all(
                                                          RoundedRectangleBorder(
                                                            borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                4.0),
                                                          ),
                                                        ),
                                                        backgroundColor:
                                                        WidgetStateProperty
                                                            .all(
                                                          twoPlayersToggle
                                                              ? const Color
                                                              .fromRGBO(
                                                              90, 64, 126, 1)
                                                              : const Color
                                                              .fromRGBO(230,
                                                              230, 230, 1),
                                                        ),
                                                        side: WidgetStateProperty
                                                            .all(
                                                          const BorderSide(
                                                            color: Colors.black,
                                                            width: 0.4,
                                                          ),
                                                        ),
                                                      ),
                                                      onPressed: () {
                                                        toggleSelection(
                                                            "twoPlayersToggle");
                                                      },
                                                      child: Center(
                                                        child: Text(
                                                          translationManager
                                                              .translate(
                                                              'txt2Players'),
                                                          style: TextStyle(
                                                            color:
                                                            twoPlayersToggle
                                                                ? Colors.white
                                                                : Colors
                                                                .black87,
                                                            fontSize:
                                                            screenWidth *
                                                                0.013,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: screenWidth * 0.01,
                                                  ),
                                                  SizedBox(
                                                    width: isIpad
                                                        ? screenWidth * 0.130
                                                        : (isIphone
                                                        ? screenWidth * 0.130
                                                        : screenWidth *
                                                        0.130),
                                                    height: isIpad
                                                        ? screenHeight * 0.04
                                                        : (isIphone
                                                        ? screenHeight * 0.05
                                                        : screenHeight *
                                                        0.07),
                                                    child: ElevatedButton(
                                                      style: ButtonStyle(
                                                        padding: WidgetStateProperty.all(EdgeInsets.zero),
                                                        shape: WidgetStateProperty
                                                            .all(
                                                          RoundedRectangleBorder(
                                                            borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                4.0),
                                                          ),
                                                        ),
                                                        backgroundColor:
                                                        WidgetStateProperty
                                                            .all(
                                                          fourPlayersToggle
                                                              ? const Color
                                                              .fromRGBO(
                                                              90, 64, 126, 1)
                                                              : const Color
                                                              .fromRGBO(230,
                                                              230, 230, 1),
                                                        ),
                                                        side: WidgetStateProperty
                                                            .all(
                                                          const BorderSide(
                                                            color: Colors.black,
                                                            width: 0.4,
                                                          ),
                                                        ),
                                                      ),
                                                      onPressed: () {
                                                        toggleSelection(
                                                            "fourPlayersToggle");
                                                      },
                                                      child: Center(
                                                        child: Text(
                                                          translationManager
                                                              .translate(
                                                              'txt4Players'),
                                                          style: TextStyle(
                                                            color:
                                                            fourPlayersToggle
                                                                ? Colors.white
                                                                : Colors
                                                                .black87,
                                                            fontSize:
                                                            screenWidth *
                                                                0.013,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: isIpad
                                              ? (professionalToggle
                                              ? screenHeight * 0.01
                                              : screenHeight * 0.02)
                                              : (isIphone
                                              ? (professionalToggle
                                              ? screenHeight * 0.008
                                              : screenHeight * 0.02)
                                              : (professionalToggle
                                              ? screenHeight * 0.008
                                              : screenHeight * 0.02)),
                                        ),
                                        Visibility(
                                          visible: professionalToggle,
                                          child: Row(
                                            children: [
                                              SizedBox(
                                                width: screenWidth * 0.022,
                                              ),
                                              Container(
                                                padding: isIpad
                                                    ? const EdgeInsets.symmetric(
                                                    horizontal: 20.0,
                                                    vertical: 15.0)
                                                    : (isIphone
                                                    ? const EdgeInsets
                                                    .symmetric(
                                                    horizontal: 10.0,
                                                    vertical: 5.0)
                                                    : const EdgeInsets
                                                    .symmetric(
                                                    horizontal: 10.0,
                                                    vertical: 5.0)),
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius: isIpad
                                                      ? BorderRadius.circular(
                                                      20.0)
                                                      : (isIphone
                                                      ? BorderRadius.circular(
                                                      8.0)
                                                      : BorderRadius.circular(
                                                      8.0)),
                                                ),
                                                child: Row(
                                                  children: [
                                                    Text(
                                                      translationManager
                                                          .translate('txtMode'),
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize:
                                                        screenWidth * 0.013,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                        width: isIpad
                                                            ? screenWidth * 0.075
                                                            : (isIphone
                                                            ? screenWidth *
                                                            0.056
                                                            : screenWidth *
                                                            0.046)),
                                                    SizedBox(
                                                      width: isIpad
                                                          ? screenWidth * 0.09
                                                          : (isIphone
                                                          ? screenWidth * 0.09
                                                          : screenWidth *
                                                          0.09),
                                                      height: isIpad
                                                          ? screenHeight * 0.04
                                                          : (isIphone
                                                          ? screenHeight *
                                                          0.05
                                                          : screenHeight *
                                                          0.07),
                                                      child: ElevatedButton(
                                                        style: ButtonStyle(
                                                          padding: WidgetStateProperty.all(EdgeInsets.zero),
                                                          shape:
                                                          WidgetStateProperty
                                                              .all(
                                                            RoundedRectangleBorder(
                                                              borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                  4.0),
                                                            ),
                                                          ),
                                                          backgroundColor:
                                                          WidgetStateProperty
                                                              .all(
                                                            directToggle
                                                                ? const Color
                                                                .fromRGBO(90,
                                                                64, 126, 1)
                                                                : const Color
                                                                .fromRGBO(230,
                                                                230, 230, 1),
                                                          ),
                                                          side:
                                                          WidgetStateProperty
                                                              .all(
                                                            const BorderSide(
                                                              color: Colors.black,
                                                              width: 0.4,
                                                            ),
                                                          ),
                                                        ),
                                                        onPressed: () {
                                                          toggleSelection(
                                                              "directToggle");
                                                        },
                                                        child: FittedBox(
                                                          fit: BoxFit.fitWidth,
                                                          child: Text(
                                                            translationManager
                                                                .translate(
                                                                'txtDirect'),
                                                            style: TextStyle(
                                                              color: directToggle
                                                                  ? Colors.white
                                                                  : Colors
                                                                  .black87,
                                                              fontSize:
                                                              screenWidth *
                                                                  0.013,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: screenWidth * 0.01,
                                                    ),
                                                    SizedBox(
                                                      width: isIpad
                                                          ? screenWidth * 0.09
                                                          : (isIphone
                                                          ? screenWidth * 0.09
                                                          : screenWidth *
                                                          0.09),
                                                      height: isIpad
                                                          ? screenHeight * 0.04
                                                          : (isIphone
                                                          ? screenHeight *
                                                          0.05
                                                          : screenHeight *
                                                          0.07),
                                                      child: ElevatedButton(
                                                        style: ButtonStyle(
                                                          padding: WidgetStateProperty.all(EdgeInsets.zero),
                                                          shape:
                                                          WidgetStateProperty
                                                              .all(
                                                            RoundedRectangleBorder(
                                                              borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                  4.0),
                                                            ),
                                                          ),
                                                          backgroundColor:
                                                          WidgetStateProperty
                                                              .all(
                                                            indirectToggle
                                                                ? const Color
                                                                .fromRGBO(90,
                                                                64, 126, 1)
                                                                : const Color
                                                                .fromRGBO(230,
                                                                230, 230, 1),
                                                          ),
                                                          side:
                                                          WidgetStateProperty
                                                              .all(
                                                            const BorderSide(
                                                              color: Colors.black,
                                                              width: 0.4,
                                                            ),
                                                          ),
                                                        ),
                                                        onPressed: () {
                                                          toggleSelection(
                                                              "indirectToggle");
                                                        },
                                                        child: FittedBox(
                                                          fit: BoxFit.fitWidth,
                                                          child: Text(
                                                            translationManager
                                                                .translate(
                                                                'txtIndirect'),
                                                            style: TextStyle(
                                                              color: indirectToggle
                                                                  ? Colors.white
                                                                  : Colors
                                                                  .black87,
                                                              fontSize:
                                                              screenWidth *
                                                                  0.013,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Row(
                                                      children: [
                                                        SizedBox(
                                                          width:
                                                          screenWidth * 0.01,
                                                        ),
                                                        ElevatedButtonTheme(
                                                          data:
                                                          ElevatedButtonThemeData(
                                                            style: ElevatedButton
                                                                .styleFrom(
                                                              backgroundColor:
                                                              Colors
                                                                  .transparent,
                                                              padding:
                                                              EdgeInsets.zero,
                                                              elevation: 0.0,
                                                            ),
                                                          ),
                                                          child: Row(
                                                            children: [
                                                              Text(
                                                                translationManager
                                                                    .translate(
                                                                    'txtMakart'),
                                                                style: TextStyle(
                                                                  color: Colors
                                                                      .black87,
                                                                  fontSize:
                                                                  screenWidth *
                                                                      0.013,
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                width:
                                                                screenWidth *
                                                                    0.01,
                                                              ),
                                                              SizedBox(
                                                                width: isIpad
                                                                    ? screenWidth *
                                                                    0.02
                                                                    : (isIphone
                                                                    ? screenWidth *
                                                                    0.02
                                                                    : screenWidth *
                                                                    0.02),
                                                                height: isIpad
                                                                    ? screenHeight *
                                                                    0.03
                                                                    : (isIphone
                                                                    ? screenHeight *
                                                                    0.05
                                                                    : screenHeight *
                                                                    0.05),
                                                                child:
                                                                ElevatedButton(
                                                                  style:
                                                                  ButtonStyle(
                                                                    padding: WidgetStateProperty.all(EdgeInsets.zero),
                                                                    shape:
                                                                    WidgetStateProperty
                                                                        .all(
                                                                      RoundedRectangleBorder(
                                                                        borderRadius:
                                                                        BorderRadius.circular(
                                                                            0.0),
                                                                      ),
                                                                    ),
                                                                    backgroundColor:
                                                                    WidgetStateProperty
                                                                        .all(
                                                                      const Color
                                                                          .fromRGBO(
                                                                          230,
                                                                          230,
                                                                          230,
                                                                          1),
                                                                    ),
                                                                    side:
                                                                    WidgetStateProperty
                                                                        .all(
                                                                      const BorderSide(
                                                                        color: Colors
                                                                            .black,
                                                                        width:
                                                                        0.4,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  onPressed:
                                                                      () {},
                                                                  child: Stack(
                                                                    children: [
                                                                      Ink.image(
                                                                        // image: const AssetImage(
                                                                        //     'assets/buttons/button_22_curved.png'),
                                                                        image: makartCheckbox
                                                                            ? const AssetImage(
                                                                            'assets/ic_check_gradiant2.png')
                                                                            : const AssetImage(
                                                                            'assets/buttons/empty_image.png'),
                                                                        fit: BoxFit
                                                                            .fill,
                                                                        width: isIpad
                                                                            ? screenWidth *
                                                                            0.015
                                                                            : (isIphone
                                                                            ? screenWidth * 0.015
                                                                            : screenWidth * 0.015),
                                                                        height: isIpad
                                                                            ? screenHeight *
                                                                            0.02
                                                                            : (isIphone
                                                                            ? screenHeight * 0.033
                                                                            : screenHeight * 0.033),
                                                                        child:
                                                                        InkWell(
                                                                          onTap:
                                                                              () {
                                                                            toggleSelection(
                                                                                "makartCheckbox");
                                                                          },
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: isIpad
                                              ? (professionalToggle
                                              ? screenHeight * 0.01
                                              : screenHeight * 0.0)
                                              : (isIphone
                                              ? (professionalToggle
                                              ? screenHeight * 0.008
                                              : screenHeight * 0.00)
                                              : (professionalToggle
                                              ? screenHeight * 0.008
                                              : screenHeight * 0.00)),
                                        ),
                                        Row(
                                          children: [
                                            SizedBox(
                                              width: screenWidth * 0.022,
                                            ),
                                            Container(
                                              padding: isIpad
                                                  ? const EdgeInsets.symmetric(
                                                  horizontal: 20.0,
                                                  vertical: 15.0)
                                                  : (isIphone
                                                  ? const EdgeInsets
                                                  .symmetric(
                                                  horizontal: 10.0,
                                                  vertical: 5.0)
                                                  : const EdgeInsets
                                                  .symmetric(
                                                  horizontal: 10.0,
                                                  vertical: 5.0)),
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius: isIpad
                                                    ? BorderRadius.circular(20.0)
                                                    : (isIphone
                                                    ? BorderRadius.circular(
                                                    8.0)
                                                    : BorderRadius.circular(
                                                    8.0)),
                                              ),
                                              child: Row(
                                                children: [
                                                  Text(
                                                    translationManager
                                                        .translate('txtTurnTime'),
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize:
                                                      screenWidth * 0.013,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                      width: isIpad
                                                          ? screenWidth * 0.051
                                                          : (isIphone
                                                          ? screenWidth *
                                                          0.0315
                                                          : screenWidth *
                                                          0.0315)),
                                                  SizedBox(
                                                    width: isIpad
                                                        ? screenWidth * 0.0564
                                                        : (isIphone
                                                        ? screenWidth * 0.063
                                                        : screenWidth *
                                                        0.63),
                                                    height: isIpad
                                                        ? screenHeight * 0.04
                                                        : (isIphone
                                                        ? screenHeight * 0.05
                                                        : screenHeight *
                                                        0.07),
                                                    child: ElevatedButton(
                                                      style: ButtonStyle(
                                                        padding: WidgetStateProperty.all(EdgeInsets.zero),
                                                        shape: WidgetStateProperty
                                                            .all(
                                                          RoundedRectangleBorder(
                                                            borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                4.0),
                                                          ),
                                                        ),
                                                        backgroundColor:
                                                        WidgetStateProperty
                                                            .all(
                                                          turnTimeOne
                                                              ? const Color
                                                              .fromRGBO(
                                                              90, 64, 126, 1)
                                                              : const Color
                                                              .fromRGBO(230,
                                                              230, 230, 1),
                                                        ),
                                                        side: WidgetStateProperty
                                                            .all(
                                                          const BorderSide(
                                                            color: Colors.black,
                                                            width: 0.4,
                                                          ),
                                                        ),
                                                      ),
                                                      onPressed: () {
                                                        toggleSelection(
                                                            "turnTimeOne");
                                                      },
                                                      child: Text(
                                                        translationManager
                                                            .translate('txtTurnTime15'),
                                                        style: TextStyle(
                                                          color: turnTimeOne
                                                              ? Colors.white
                                                              : Colors.black87,
                                                          fontSize:
                                                          isIpad
                                                              ? screenWidth * 0.013
                                                              : (isIphone
                                                              ? screenWidth * 0.01
                                                              : screenWidth *
                                                              0.01),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: isIpad
                                                        ? screenWidth * 0.015
                                                        : (isIphone
                                                        ? screenWidth * 0.0065
                                                        : screenWidth *
                                                        0.0065),
                                                  ),
                                                  SizedBox(
                                                    width: isIpad
                                                        ? screenWidth * 0.0564
                                                        : (isIphone
                                                        ? screenWidth * 0.063
                                                        : screenWidth *
                                                        0.063),
                                                    height: isIpad
                                                        ? screenHeight * 0.04
                                                        : (isIphone
                                                        ? screenHeight * 0.05
                                                        : screenHeight *
                                                        0.07),
                                                    child: ElevatedButton(
                                                      style: ButtonStyle(
                                                        padding: WidgetStateProperty.all(EdgeInsets.zero),
                                                        shape: WidgetStateProperty
                                                            .all(
                                                          RoundedRectangleBorder(
                                                            borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                4.0),
                                                          ),
                                                        ),
                                                        backgroundColor:
                                                        WidgetStateProperty
                                                            .all(
                                                          turnTimeTwo
                                                              ? const Color
                                                              .fromRGBO(
                                                              90, 64, 126, 1)
                                                              : const Color
                                                              .fromRGBO(230,
                                                              230, 230, 1),
                                                        ),
                                                        side: WidgetStateProperty
                                                            .all(
                                                          const BorderSide(
                                                            color: Colors.black,
                                                            width: 0.4,
                                                          ),
                                                        ),
                                                      ),
                                                      onPressed: () {
                                                        toggleSelection(
                                                            "turnTimeTwo");
                                                      },
                                                      child: Center(
                                                        child: Text(
                                                          translationManager
                                                              .translate(
                                                              'txtTurnTime30'),
                                                          style: TextStyle(
                                                            color: turnTimeTwo
                                                                ? Colors.white
                                                                : Colors.black87,
                                                            fontSize:
                                                            isIpad
                                                                ? screenWidth * 0.013
                                                                : (isIphone
                                                                ? screenWidth * 0.01
                                                                : screenWidth *
                                                                0.01),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: isIpad
                                                        ? screenWidth * 0.015
                                                        : (isIphone
                                                        ? screenWidth * 0.0065
                                                        : screenWidth *
                                                        0.0065),
                                                  ),
                                                  SizedBox(
                                                    width: isIpad
                                                        ? screenWidth * 0.0564
                                                        : (isIphone
                                                        ? screenWidth * 0.063
                                                        : screenWidth *
                                                        0.063),
                                                    height: isIpad
                                                        ? screenHeight * 0.04
                                                        : (isIphone
                                                        ? screenHeight * 0.05
                                                        : screenHeight *
                                                        0.07),
                                                    child: ElevatedButton(
                                                      style: ButtonStyle(
                                                        padding: WidgetStateProperty.all(EdgeInsets.zero),
                                                        shape: WidgetStateProperty
                                                            .all(
                                                          RoundedRectangleBorder(
                                                            borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                4.0),
                                                          ),
                                                        ),
                                                        backgroundColor:
                                                        WidgetStateProperty
                                                            .all(
                                                          turnTimeThree
                                                              ? const Color
                                                              .fromRGBO(
                                                              90, 64, 126, 1)
                                                              : const Color
                                                              .fromRGBO(230,
                                                              230, 230, 1),
                                                        ),
                                                        side: WidgetStateProperty
                                                            .all(
                                                          const BorderSide(
                                                            color: Colors.black,
                                                            width: 0.4,
                                                          ),
                                                        ),
                                                      ),
                                                      onPressed: () {
                                                        toggleSelection(
                                                            "turnTimeThree");
                                                      },
                                                      child: Center(
                                                        child: Text(
                                                          translationManager
                                                              .translate(
                                                              'txtTurnTime45'),
                                                          style: TextStyle(
                                                            color: turnTimeThree
                                                                ? Colors.white
                                                                : Colors.black87,
                                                            fontSize:
                                                            isIpad
                                                                ? screenWidth * 0.013
                                                                : (isIphone
                                                                ? screenWidth * 0.01
                                                                : screenWidth *
                                                                0.01),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: isIpad
                                                        ? screenWidth * 0.015
                                                        : (isIphone
                                                        ? screenWidth * 0.0065
                                                        : screenWidth *
                                                        0.0065),
                                                  ),
                                                  SizedBox(
                                                    width: isIpad
                                                        ? screenWidth * 0.0564
                                                        : (isIphone
                                                        ? screenWidth * 0.063
                                                        : screenWidth *
                                                        0.063),
                                                    height: isIpad
                                                        ? screenHeight * 0.04
                                                        : (isIphone
                                                        ? screenHeight * 0.05
                                                        : screenHeight *
                                                        0.07),
                                                    child: ElevatedButton(
                                                      style: ButtonStyle(
                                                        padding: WidgetStateProperty.all(EdgeInsets.zero),
                                                        shape: WidgetStateProperty
                                                            .all(
                                                          RoundedRectangleBorder(
                                                            borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                4.0),
                                                          ),
                                                        ),
                                                        backgroundColor:
                                                        WidgetStateProperty
                                                            .all(
                                                          turnTimeFour
                                                              ? const Color
                                                              .fromRGBO(
                                                              90, 64, 126, 1)
                                                              : const Color
                                                              .fromRGBO(230,
                                                              230, 230, 1),
                                                        ),
                                                        side: WidgetStateProperty
                                                            .all(
                                                          const BorderSide(
                                                            color: Colors.black,
                                                            width: 0.4,
                                                          ),
                                                        ),
                                                      ),
                                                      onPressed: () {
                                                        toggleSelection(
                                                            "turnTimeFour");
                                                      },
                                                      child: Center(
                                                        child: Text(
                                                          translationManager
                                                              .translate(
                                                              'txtTurnTime60'),
                                                          style: TextStyle(
                                                            color: turnTimeFour
                                                                ? Colors.white
                                                                : Colors.black87,
                                                            fontSize:
                                                            isIpad
                                                                ? screenWidth * 0.013
                                                                : (isIphone
                                                                ? screenWidth * 0.01
                                                                : screenWidth *
                                                                0.01),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: isIpad
                                              ? (professionalToggle
                                              ? screenHeight * 0.01
                                              : screenHeight * 0.02)
                                              : (isIphone
                                              ? (professionalToggle
                                              ? screenHeight * 0.008
                                              : screenHeight * 0.02)
                                              : (professionalToggle
                                              ? screenHeight * 0.008
                                              : screenHeight * 0.02)),
                                        ),
                                        Row(
                                          children: [
                                            SizedBox(
                                              width: screenWidth * 0.022,
                                            ),
                                            Container(
                                              padding: isIpad
                                                  ? const EdgeInsets.symmetric(
                                                  horizontal: 20.0,
                                                  vertical: 15.0)
                                                  : (isIphone
                                                  ? const EdgeInsets
                                                  .symmetric(
                                                  horizontal: 10.0,
                                                  vertical: 5.0)
                                                  : const EdgeInsets
                                                  .symmetric(
                                                  horizontal: 10.0,
                                                  vertical: 5.0)),
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius: isIpad
                                                    ? BorderRadius.circular(20.0)
                                                    : (isIphone
                                                    ? BorderRadius.circular(
                                                    8.0)
                                                    : BorderRadius.circular(
                                                    8.0)),
                                              ),
                                              child: Row(
                                                children: [
                                                  Text(
                                                    translationManager
                                                        .translate('txtPoints'),
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize:
                                                      screenWidth * 0.013,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                      width: isIpad
                                                          ? screenWidth * 0.07
                                                          : (isIphone
                                                          ? screenWidth *
                                                          0.0515
                                                          : screenWidth *
                                                          0.0515)),
                                                  SizedBox(
                                                    width: isIpad
                                                        ? (professionalToggle ? screenWidth * 0.08 : screenWidth * 0.0564)
                                                        : (isIphone
                                                        ? (professionalToggle ? screenWidth * 0.086 : screenWidth * 0.063)
                                                        : (professionalToggle ? screenWidth * 0.086 : screenWidth * 0.063)
                                                    ),
                                                    height: isIpad
                                                        ? screenHeight * 0.04
                                                        : (isIphone
                                                        ? screenHeight * 0.05
                                                        : screenHeight *
                                                        0.07),
                                                    child: ElevatedButton(
                                                      style: ButtonStyle(
                                                        padding: WidgetStateProperty.all(EdgeInsets.zero),
                                                        shape: WidgetStateProperty
                                                            .all(
                                                          RoundedRectangleBorder(
                                                            borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                4.0),
                                                          ),
                                                        ),
                                                        backgroundColor:
                                                        WidgetStateProperty
                                                            .all(
                                                          pointsOne
                                                              ? const Color
                                                              .fromRGBO(
                                                              90, 64, 126, 1)
                                                              : const Color
                                                              .fromRGBO(230,
                                                              230, 230, 1),
                                                        ),
                                                        side: WidgetStateProperty
                                                            .all(
                                                          const BorderSide(
                                                            color: Colors.black,
                                                            width: 0.4,
                                                          ),
                                                        ),
                                                      ),
                                                      onPressed: () {
                                                        toggleSelection(
                                                            "pointsOne");
                                                      },
                                                      child: Text(
                                                        translationManager
                                                            .translate('txtOneHand'),
                                                        style: TextStyle(
                                                          color: pointsOne
                                                              ? Colors.white
                                                              : Colors.black87,
                                                          fontSize:
                                                          isIpad
                                                              ? screenWidth * 0.011
                                                              : (isIphone
                                                              ? screenWidth * 0.01
                                                              : screenWidth *
                                                              0.01),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: isIpad
                                                        ? screenWidth * 0.015
                                                        : (isIphone
                                                        ? screenWidth * 0.0065
                                                        : screenWidth *
                                                        0.0065),
                                                  ),
                                                  SizedBox(
                                                    width: isIpad
                                                        ? (professionalToggle ? screenWidth * 0.08 : screenWidth * 0.0564)
                                                        : (isIphone
                                                        ? (professionalToggle ? screenWidth * 0.086 : screenWidth * 0.063)
                                                        : (professionalToggle ? screenWidth * 0.086 : screenWidth * 0.063)
                                                    ),
                                                    height: isIpad
                                                        ? screenHeight * 0.04
                                                        : (isIphone
                                                        ? screenHeight * 0.05
                                                        : screenHeight *
                                                        0.07),
                                                    child: ElevatedButton(
                                                      style: ButtonStyle(
                                                        padding: WidgetStateProperty.all(EdgeInsets.zero),
                                                        shape: WidgetStateProperty
                                                            .all(
                                                          RoundedRectangleBorder(
                                                            borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                4.0),
                                                          ),
                                                        ),
                                                        backgroundColor:
                                                        WidgetStateProperty
                                                            .all(
                                                          pointsTwo
                                                              ? const Color
                                                              .fromRGBO(
                                                              90, 64, 126, 1)
                                                              : const Color
                                                              .fromRGBO(230,
                                                              230, 230, 1),
                                                        ),
                                                        side: WidgetStateProperty
                                                            .all(
                                                          const BorderSide(
                                                            color: Colors.black,
                                                            width: 0.4,
                                                          ),
                                                        ),
                                                      ),
                                                      onPressed: () {
                                                        toggleSelection(
                                                            "pointsTwo");
                                                      },
                                                      child: Center(
                                                        child: Text(
                                                          classicToggle
                                                              ? translationManager
                                                              .translate(
                                                              'txtPoints1005')
                                                              : translationManager
                                                              .translate(
                                                              'txtPoints1505'),
                                                          style: TextStyle(
                                                            color: pointsTwo
                                                                ? Colors.white
                                                                : Colors.black87,
                                                            fontSize:
                                                            isIpad
                                                                ? screenWidth * 0.013
                                                                : (isIphone
                                                                ? screenWidth * 0.01
                                                                : screenWidth *
                                                                0.01),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: isIpad
                                                        ? screenWidth * 0.015
                                                        : (isIphone
                                                        ? screenWidth * 0.0065
                                                        : screenWidth *
                                                        0.0065),
                                                  ),
                                                  SizedBox(
                                                    width: isIpad
                                                        ? (professionalToggle ? screenWidth * 0.08 : screenWidth * 0.0564)
                                                        : (isIphone
                                                        ? (professionalToggle ? screenWidth * 0.086 : screenWidth * 0.063)
                                                        : (professionalToggle ? screenWidth * 0.086 : screenWidth * 0.063)
                                                    ),
                                                    height: isIpad
                                                        ? screenHeight * 0.04
                                                        : (isIphone
                                                        ? screenHeight * 0.05
                                                        : screenHeight * 0.07),
                                                    child: ElevatedButton(
                                                      style: ButtonStyle(
                                                        padding: WidgetStateProperty.all(EdgeInsets.zero),
                                                        shape: WidgetStateProperty.all(
                                                          RoundedRectangleBorder(
                                                            borderRadius: BorderRadius.circular(4.0),
                                                          ),
                                                        ),
                                                        backgroundColor: WidgetStateProperty.all(
                                                          pointsThree
                                                              ? const Color.fromRGBO(90, 64, 126, 1)
                                                              : const Color.fromRGBO(230, 230, 230, 1),
                                                        ),
                                                        side: WidgetStateProperty.all(
                                                          const BorderSide(
                                                            color: Colors.black,
                                                            width: 0.4,
                                                          ),
                                                        ),
                                                      ),
                                                      onPressed: () {
                                                        toggleSelection("pointsThree");
                                                      },
                                                      child: Center(
                                                        child: Text(
                                                          classicToggle
                                                              ? translationManager.translate('txtPoints1505')
                                                              : translationManager.translate('txtPoints2000'),
                                                          style: TextStyle(
                                                            color: pointsThree ? Colors.white : Colors.black87,
                                                            fontSize: isIpad
                                                                ? screenWidth * 0.013
                                                                : (isIphone ? screenWidth * 0.01 : screenWidth * 0.01),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Visibility(
                                                    visible: classicToggle,
                                                    child: SizedBox(
                                                      width: isIpad
                                                          ? screenWidth * 0.015
                                                          : (isIphone
                                                          ? screenWidth * 0.0065
                                                          : screenWidth *
                                                          0.0065),
                                                    ),
                                                  ),
                                                  Visibility(
                                                    visible: classicToggle,
                                                    child: SizedBox(
                                                      width: isIpad
                                                          ? screenWidth * 0.0564
                                                          : (isIphone
                                                          ? screenWidth * 0.063
                                                          : screenWidth *
                                                          0.063),
                                                      height: isIpad
                                                          ? screenHeight * 0.04
                                                          : (isIphone
                                                          ? screenHeight * 0.05
                                                          : screenHeight *
                                                          0.07),
                                                      child: ElevatedButton(
                                                        style: ButtonStyle(
                                                          padding: WidgetStateProperty.all(EdgeInsets.zero),
                                                          shape: WidgetStateProperty
                                                              .all(
                                                            RoundedRectangleBorder(
                                                              borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                  4.0),
                                                            ),
                                                          ),
                                                          backgroundColor:
                                                          WidgetStateProperty
                                                              .all(
                                                            pointsFour
                                                                ? const Color
                                                                .fromRGBO(
                                                                90, 64, 126, 1)
                                                                : const Color
                                                                .fromRGBO(230,
                                                                230, 230, 1),
                                                          ),
                                                          side: WidgetStateProperty
                                                              .all(
                                                            const BorderSide(
                                                              color: Colors.black,
                                                              width: 0.4,
                                                            ),
                                                          ),
                                                        ),
                                                        onPressed: () {
                                                          toggleSelection(
                                                              "pointsFour");
                                                        },
                                                        child: Center(
                                                          child: Text(
                                                            translationManager
                                                                .translate(
                                                                'txtPoints2005'),
                                                            style: TextStyle(
                                                              color: pointsFour
                                                                  ? Colors.white
                                                                  : Colors.black87,
                                                              fontSize:
                                                              isIpad
                                                                  ? screenWidth * 0.013
                                                                  : (isIphone
                                                                  ? screenWidth * 0.01
                                                                  : screenWidth *
                                                                  0.01),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: isIpad
                                              ? (professionalToggle
                                              ? screenHeight * 0.01
                                              : screenHeight * 0.02)
                                              : (isIphone
                                              ? (professionalToggle
                                              ? screenHeight * 0.008
                                              : screenHeight * 0.02)
                                              : (professionalToggle
                                              ? screenHeight * 0.008
                                              : screenHeight * 0.02)),
                                        ),
                                        Row(
                                          children: [
                                            SizedBox(
                                              width: screenWidth * 0.022,
                                            ),
                                            Container(
                                              padding: isIpad
                                                  ? const EdgeInsets.symmetric(
                                                  horizontal: 20.0,
                                                  vertical: 15.0)
                                                  : (isIphone
                                                  ? const EdgeInsets
                                                  .symmetric(
                                                  horizontal: 10.0,
                                                  vertical: 5.0)
                                                  : const EdgeInsets
                                                  .symmetric(
                                                  horizontal: 10.0,
                                                  vertical: 5.0)),
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius: isIpad
                                                    ? BorderRadius.circular(20.0)
                                                    : (isIphone
                                                    ? BorderRadius.circular(
                                                    8.0)
                                                    : BorderRadius.circular(
                                                    8.0)),
                                              ),
                                              child: Row(
                                                children: [
                                                  Text(
                                                    translationManager
                                                        .translate('txtPassword'),
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize:
                                                      screenWidth * 0.013,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                      width: isIpad
                                                          ? screenWidth * 0.01
                                                          : (isIphone
                                                          ? screenWidth *
                                                          0.02
                                                          : screenWidth *
                                                          0.02)),
                                                  SizedBox(
                                                    width: isIpad
                                                        ? (professionalToggle ? screenWidth * 0.085 : screenWidth * 0.0564)
                                                        : (isIphone
                                                        ? (professionalToggle ? screenWidth * 0.0635 : screenWidth * 0.0635)
                                                        : (professionalToggle ? screenWidth * 0.0635 : screenWidth * 0.0635)
                                                    ),
                                                    height: isIpad
                                                        ? screenHeight * 0.04
                                                        : (isIphone
                                                        ? screenHeight * 0.05
                                                        : screenHeight *
                                                        0.07),
                                                    child: Transform.scale(
                                                      scaleX: isIpad ? screenWidth * 0.00085 : (isIphone ? screenWidth * 0.0008 : screenWidth * 0.0008),
                                                      scaleY: isIpad ? screenHeight * 0.0011 : (isIphone ? screenHeight * 0.0016 : screenHeight * 0.0016),
                                                      child: Switch(
                                                        thumbIcon:
                                                        WidgetStateProperty.resolveWith<Icon> ((Set < WidgetState > states) {
                                                          if (states.contains(
                                                              WidgetState.selected)) {
                                                            return const Icon(Icons.check);
                                                          }
                                                          return const Icon(Icons.close);
                                                        },
                                                        ),
                                                        value: passwordToggle,
                                                        onChanged: (bool newValue) {
                                                          setState(() {
                                                            passwordToggle = !passwordToggle;
                                                          });
                                                        },
                                                      ),
                                                    ),
                                                  ),
                                                  Text(
                                                    translationManager
                                                        .translate('txtChat'),
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize:
                                                      screenWidth * 0.013,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                      width: isIpad
                                                          ? screenWidth * 0.01
                                                          : (isIphone
                                                          ? screenWidth *
                                                          0.02
                                                          : screenWidth *
                                                          0.02)),
                                                  SizedBox(
                                                    width: isIpad
                                                        ? (professionalToggle ? screenWidth * 0.08 : screenWidth * 0.0564)
                                                        : (isIphone
                                                        ? (professionalToggle ? screenWidth * 0.0635 : screenWidth * 0.0635)
                                                        : (professionalToggle ? screenWidth * 0.0635 : screenWidth * 0.0635)
                                                    ),
                                                    height: isIpad
                                                        ? screenHeight * 0.04
                                                        : (isIphone
                                                        ? screenHeight * 0.05
                                                        : screenHeight *
                                                        0.07),
                                                    child: Transform.scale(
                                                      scaleX: isIpad ? screenWidth * 0.00085 : (isIphone ? screenWidth * 0.0008 : screenWidth * 0.0008),
                                                      scaleY: isIpad ? screenHeight * 0.0011 : (isIphone ? screenHeight * 0.0016 : screenHeight * 0.0016),
                                                      child: Switch(
                                                        thumbIcon:
                                                        WidgetStateProperty.resolveWith<Icon> ((Set < WidgetState > states) {
                                                          if (states.contains(
                                                              WidgetState.selected)) {
                                                            return const Icon(Icons.check);
                                                          }
                                                          return const Icon(Icons.close);
                                                        },
                                                        ),
                                                        value: chatToggle,
                                                        onChanged: (bool newValue) {
                                                          setState(() {
                                                            chatToggle = !chatToggle;
                                                          });
                                                        },
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    width: isIpad ? screenWidth * 0.11 : (isIphone ? screenWidth * 0.11 : screenWidth * 0.11),
                                                    height: isIpad ? screenHeight * 0.04 : (isIphone ? screenHeight * 0.05 : screenHeight * 0.05),
                                                    padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                                                    decoration: BoxDecoration(
                                                      color: const Color.fromRGBO(90, 64, 126, 1), // Background color of the button
                                                      borderRadius: BorderRadius.circular(5.0),
                                                      border: Border.all(color: Colors.black), // Border color
                                                    ),
                                                    child: DropdownButtonHideUnderline(
                                                      child: DropdownButton<String>(
                                                        value: selectedLevel,
                                                        hint: Text(
                                                          "Min. Level",
                                                          style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: isIpad ? screenWidth * 0.012 : (isIphone ? screenWidth * 0.01 : screenWidth * 0.01),
                                                          ),
                                                        ),
                                                        items: levels.toSet().map((String level) {
                                                          return DropdownMenuItem<String>(
                                                            value: level,
                                                            child: Text(
                                                              level,
                                                              style: TextStyle(
                                                                color: Colors.white,
                                                                fontSize: isIpad ? screenWidth * 0.012 : (isIphone ? screenWidth * 0.01 : screenWidth * 0.01),
                                                              ),
                                                            ),
                                                          );
                                                        }).toList(),
                                                        onChanged: (String? newValue) {
                                                          setState(() {
                                                            selectedLevel = newValue;
                                                          });
                                                        },
                                                        dropdownColor: const Color.fromRGBO(90, 64, 126, 1),
                                                        style: const TextStyle(color: Colors.white), // Selected text color
                                                        iconEnabledColor: Colors.white,
                                                        iconSize: isIpad ? screenWidth * 0.02 : (isIphone ? screenWidth * 0.015 : screenWidth * 0.015),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: isIpad
                                              ? (professionalToggle
                                              ? screenHeight * 0.01
                                              : screenHeight * 0.02)
                                              : (isIphone
                                              ? (professionalToggle
                                              ? screenHeight * 0.008
                                              : screenHeight * 0.02)
                                              : (professionalToggle
                                              ? screenHeight * 0.008
                                              : screenHeight * 0.02)),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(left: screenWidth * 0.022, right: screenWidth * 0.022,),
                                          child: Row(
                                            children: [
                                              Container(
                                                width: isIpad ? screenWidth * 0.12 : (isIphone ? screenWidth * 0.12 : screenWidth * 0.12),
                                                height: isIpad ? screenHeight * 0.22 : (isIphone ? screenHeight * 0.25 : screenHeight * 0.25),
                                                padding: isIpad
                                                    ? const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0)
                                                    : (isIphone ? const EdgeInsets.symmetric(horizontal: 0.0, vertical: 2.0) : const EdgeInsets.symmetric(horizontal: 5.0, vertical: 2.0)),
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius: isIpad ? BorderRadius.circular(20.0) : (isIphone ? BorderRadius.circular(8.0) : BorderRadius.circular(8.0)),
                                                ),
                                                child: Column(
                                                  children: [
                                                    Text(
                                                      translationManager.translate("txtStyle").toUpperCase(),
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: screenWidth * 0.012,
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: PageView.builder(
                                                        controller: frontCardImageController,
                                                        onPageChanged: (int index) {
                                                          setState(() {
                                                            currentFrontCardImage = index;
                                                          });
                                                        },
                                                        itemCount: cardImageFrontPaths.length,
                                                        itemBuilder: (context, index) {
                                                          return Image.asset(cardImageFrontPaths[index]);
                                                        },
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: EdgeInsets.all(
                                                          isIpad ? screenWidth * 0.00
                                                              : (isIphone ? screenWidth * 0.005
                                                              : screenWidth * 0.005)
                                                      ),
                                                      child: Row(
                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                        children: [
                                                          SizedBox(
                                                            width: isIpad ? screenWidth * 0.025
                                                                : (isIphone ? screenWidth * 0.025
                                                                : screenWidth * 0.025),
                                                            height: isIpad ? screenHeight * 0.035
                                                                : (isIphone ? screenHeight * 0.06
                                                                : screenHeight * 0.06),
                                                            child: DecoratedBox(
                                                              decoration: BoxDecoration(
                                                                color: const Color.fromRGBO(83, 32, 95, 1),
                                                                borderRadius: BorderRadius.circular(7.0),
                                                                border: Border.all(
                                                                  color: Colors.black,
                                                                  width: 1.0,
                                                                ),
                                                              ),
                                                              child: IconButton(
                                                                padding: const EdgeInsets.all(0.0),
                                                                icon: const Icon(Icons.arrow_back_ios_rounded),
                                                                iconSize: isIpad ? screenWidth * 0.022
                                                                    : (isIphone ? screenWidth * 0.02
                                                                    : screenWidth * 0.02),
                                                                color: Colors.white,
                                                                onPressed: () {
                                                                  if (currentFrontCardImage > 0) {
                                                                    frontCardImageController.previousPage(
                                                                      duration: const Duration(milliseconds: 300),
                                                                      curve: Curves.easeInOut,
                                                                    );
                                                                  }
                                                                },
                                                              ),
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            width: isIpad ? screenWidth * 0.025
                                                                : (isIphone ? screenWidth * 0.025
                                                                : screenWidth * 0.025),
                                                            height: isIpad ? screenHeight * 0.035
                                                                : (isIphone ? screenHeight * 0.06
                                                                : screenHeight * 0.06),
                                                            child: DecoratedBox(
                                                              decoration: BoxDecoration(
                                                                color: const Color.fromRGBO(83, 32, 95, 1),
                                                                borderRadius: BorderRadius.circular(7.0),
                                                                border: Border.all(
                                                                  color: Colors.black,
                                                                  width: 1.0,
                                                                ),
                                                              ),
                                                              child: IconButton(
                                                                padding: const EdgeInsets.all(0.0),
                                                                icon: const Icon(Icons.arrow_forward_ios_rounded),
                                                                iconSize: isIpad ? screenWidth * 0.022
                                                                    : (isIphone ? screenWidth * 0.02
                                                                    : screenWidth * 0.02),
                                                                color: Colors.white,
                                                                onPressed: () {
                                                                  if (currentFrontCardImage < cardImageFrontPaths.length - 1) {
                                                                    frontCardImageController.nextPage(
                                                                      duration: const Duration(milliseconds: 300),
                                                                      curve: Curves.easeInOut,
                                                                    );
                                                                  }
                                                                },
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              SizedBox(
                                                  width: isIpad
                                                      ? screenHeight * 0.03
                                                      : (isIphone
                                                      ? screenHeight * 0.02
                                                      : screenHeight * 0.03)
                                              ),
                                              Container(
                                                width: isIpad ? screenWidth * 0.12 : (isIphone ? screenWidth * 0.12 : screenWidth * 0.12),
                                                height: isIpad ? screenHeight * 0.22 : (isIphone ? screenHeight * 0.25 : screenHeight * 0.25),
                                                padding: isIpad
                                                    ? const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0)
                                                    : (isIphone ? const EdgeInsets.symmetric(horizontal: 0.0, vertical: 2.0) : const EdgeInsets.symmetric(horizontal: 5.0, vertical: 2.0)),
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius: isIpad ? BorderRadius.circular(20.0) : (isIphone ? BorderRadius.circular(8.0) : BorderRadius.circular(8.0)),
                                                ),
                                                child: Column(
                                                  children: [
                                                    Text(
                                                      translationManager.translate("txtDeck").toUpperCase(),
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: screenWidth * 0.012,
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: PageView.builder(
                                                        controller: backCardImageController,
                                                        onPageChanged: (int index) {
                                                          setState(() {
                                                            currentBackCardImage = index;
                                                          });
                                                        },
                                                        itemCount: cardImageBackPaths.length,
                                                        itemBuilder: (context, index) {
                                                          return Image.asset(cardImageBackPaths[index]);
                                                        },
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: EdgeInsets.all(
                                                          isIpad ? screenWidth * 0.00
                                                              : (isIphone ? screenWidth * 0.005
                                                              : screenWidth * 0.005)
                                                      ),
                                                      child: Row(
                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                        children: [
                                                          SizedBox(
                                                            width: isIpad ? screenWidth * 0.025
                                                                : (isIphone ? screenWidth * 0.025
                                                                : screenWidth * 0.025),
                                                            height: isIpad ? screenHeight * 0.035
                                                                : (isIphone ? screenHeight * 0.06
                                                                : screenHeight * 0.06),
                                                            child: DecoratedBox(
                                                              decoration: BoxDecoration(
                                                                color: const Color.fromRGBO(83, 32, 95, 1),
                                                                borderRadius: BorderRadius.circular(7.0),
                                                                border: Border.all(
                                                                  color: Colors.black,
                                                                  width: 1.0,
                                                                ),
                                                              ),
                                                              child: IconButton(
                                                                padding: const EdgeInsets.all(0.0),
                                                                icon: const Icon(Icons.arrow_back_ios_rounded),
                                                                iconSize: isIpad ? screenWidth * 0.022
                                                                    : (isIphone ? screenWidth * 0.02
                                                                    : screenWidth * 0.02),
                                                                color: Colors.white,
                                                                onPressed: () {
                                                                  if (currentBackCardImage > 0) {
                                                                    backCardImageController.previousPage(
                                                                      duration: const Duration(milliseconds: 300),
                                                                      curve: Curves.easeInOut,
                                                                    );
                                                                  }
                                                                },
                                                              ),
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            width: isIpad ? screenWidth * 0.025
                                                                : (isIphone ? screenWidth * 0.025
                                                                : screenWidth * 0.025),
                                                            height: isIpad ? screenHeight * 0.035
                                                                : (isIphone ? screenHeight * 0.06
                                                                : screenHeight * 0.06),
                                                            child: DecoratedBox(
                                                              decoration: BoxDecoration(
                                                                color: const Color.fromRGBO(83, 32, 95, 1),
                                                                borderRadius: BorderRadius.circular(7.0),
                                                                border: Border.all(
                                                                  color: Colors.black,
                                                                  width: 1.0,
                                                                ),
                                                              ),
                                                              child: IconButton(
                                                                padding: const EdgeInsets.all(0.0),
                                                                icon: const Icon(Icons.arrow_forward_ios_rounded),
                                                                iconSize: isIpad ? screenWidth * 0.022
                                                                    : (isIphone ? screenWidth * 0.02
                                                                    : screenWidth * 0.02),
                                                                color: Colors.white,
                                                                onPressed: () {
                                                                  if (currentBackCardImage < cardImageBackPaths.length - 1) {
                                                                    backCardImageController.nextPage(
                                                                      duration: const Duration(milliseconds: 300),
                                                                      curve: Curves.easeInOut,
                                                                    );
                                                                  }
                                                                },
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              SizedBox(
                                                  width: isIpad
                                                      ? screenHeight * 0.03
                                                      : (isIphone
                                                      ? screenHeight * 0.02
                                                      : screenHeight * 0.03)
                                              ),
                                              Container(
                                                width: isIpad ? screenWidth * 0.12 : (isIphone ? screenWidth * 0.12 : screenWidth * 0.12),
                                                height: isIpad ? screenHeight * 0.22 : (isIphone ? screenHeight * 0.25 : screenHeight * 0.25),
                                                padding: isIpad
                                                    ? const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0)
                                                    : (isIphone ? const EdgeInsets.symmetric(horizontal: 0.0, vertical: 2.0) : const EdgeInsets.symmetric(horizontal: 5.0, vertical: 2.0)),
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius: isIpad ? BorderRadius.circular(20.0) : (isIphone ? BorderRadius.circular(8.0) : BorderRadius.circular(8.0)),
                                                ),
                                                child: Column(
                                                  children: [
                                                    Text(
                                                      translationManager.translate("txtTable").toUpperCase(),
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: screenWidth * 0.012,
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: PageView.builder(
                                                        controller: tableImageController,
                                                        onPageChanged: (int index) {
                                                          setState(() {
                                                            currentTableImage = index;
                                                          });
                                                        },
                                                        itemCount: tableImagePaths.length,
                                                        itemBuilder: (context, index) {
                                                          return Image.asset(tableImagePaths[index]);
                                                        },
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: EdgeInsets.all(
                                                          isIpad ? screenWidth * 0.00
                                                              : (isIphone ? screenWidth * 0.005
                                                              : screenWidth * 0.005)
                                                      ),
                                                      child: Row(
                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                        children: [
                                                          SizedBox(
                                                            width: isIpad ? screenWidth * 0.025
                                                                : (isIphone ? screenWidth * 0.025
                                                                : screenWidth * 0.025),
                                                            height: isIpad ? screenHeight * 0.035
                                                                : (isIphone ? screenHeight * 0.06
                                                                : screenHeight * 0.06),
                                                            child: DecoratedBox(
                                                              decoration: BoxDecoration(
                                                                color: const Color.fromRGBO(83, 32, 95, 1),
                                                                borderRadius: BorderRadius.circular(7.0),
                                                                border: Border.all(
                                                                  color: Colors.black,
                                                                  width: 1.0,
                                                                ),
                                                              ),
                                                              child: IconButton(
                                                                padding: const EdgeInsets.all(0.0),
                                                                icon: const Icon(Icons.arrow_back_ios_rounded),
                                                                iconSize: isIpad ? screenWidth * 0.022
                                                                    : (isIphone ? screenWidth * 0.02
                                                                    : screenWidth * 0.02),
                                                                color: Colors.white,
                                                                onPressed: () {
                                                                  if (currentTableImage > 0) {
                                                                    tableImageController.previousPage(
                                                                      duration: const Duration(milliseconds: 300),
                                                                      curve: Curves.easeInOut,
                                                                    );
                                                                  }
                                                                },
                                                              ),
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            width: isIpad ? screenWidth * 0.025
                                                                : (isIphone ? screenWidth * 0.025
                                                                : screenWidth * 0.025),
                                                            height: isIpad ? screenHeight * 0.035
                                                                : (isIphone ? screenHeight * 0.06
                                                                : screenHeight * 0.06),
                                                            child: DecoratedBox(
                                                              decoration: BoxDecoration(
                                                                color: const Color.fromRGBO(83, 32, 95, 1),
                                                                borderRadius: BorderRadius.circular(7.0),
                                                                border: Border.all(
                                                                  color: Colors.black,
                                                                  width: 1.0,
                                                                ),
                                                              ),
                                                              child: IconButton(
                                                                padding: const EdgeInsets.all(0.0),
                                                                icon: const Icon(Icons.arrow_forward_ios_rounded),
                                                                iconSize: isIpad ? screenWidth * 0.022
                                                                    : (isIphone ? screenWidth * 0.02
                                                                    : screenWidth * 0.02),
                                                                color: Colors.white,
                                                                onPressed: () {
                                                                  if (currentTableImage < tableImagePaths.length - 1) {
                                                                    tableImageController.nextPage(
                                                                      duration: const Duration(milliseconds: 300),
                                                                      curve: Curves.easeInOut,
                                                                    );
                                                                  }
                                                                },
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: isIpad
                                              ? (professionalToggle
                                              ? screenHeight * 0.02
                                              : screenHeight * 0.03)
                                              : (isIphone
                                              ? (professionalToggle
                                              ? screenHeight * 0.02
                                              : screenHeight * 0.03)
                                              : (professionalToggle
                                              ? screenHeight * 0.02
                                              : screenHeight * 0.03)),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                            left: isIpad
                                                ? screenWidth * 0.02
                                                : (isIphone
                                                ? screenWidth * 0.016
                                                : screenWidth * 0.016),
                                          ),
                                          child: Align(
                                            alignment: Alignment.bottomCenter,
                                            child: Row(
                                              children: [
                                                SizedBox(
                                                    width: screenWidth * 0.01),
                                                SizedBox(
                                                  width: isIpad
                                                      ? screenWidth * 0.13
                                                      : (isIphone
                                                      ? screenWidth * 0.124
                                                      : screenWidth * 0.124),
                                                  height: isIpad
                                                      ? screenHeight * 0.04
                                                      : (isIphone
                                                      ? screenHeight * 0.055
                                                      : screenHeight * 0.055),
                                                  child: ElevatedButton(
                                                    style: ButtonStyle(
                                                      shape:
                                                      WidgetStateProperty.all(
                                                        RoundedRectangleBorder(
                                                          borderRadius:
                                                          BorderRadius.only(
                                                            topLeft: isIpad
                                                                ? const Radius
                                                                .circular(
                                                                20.0)
                                                                : (isIphone
                                                                ? const Radius
                                                                .circular(
                                                                12.0)
                                                                : const Radius
                                                                .circular(
                                                                12.0)),
                                                            topRight: const Radius
                                                                .circular(0.0),
                                                            bottomLeft: isIpad
                                                                ? const Radius
                                                                .circular(
                                                                20.0)
                                                                : (isIphone
                                                                ? const Radius
                                                                .circular(
                                                                12.0)
                                                                : const Radius
                                                                .circular(
                                                                12.0)),
                                                            bottomRight:
                                                            const Radius
                                                                .circular(
                                                                0.0),
                                                          ),
                                                        ),
                                                      ),
                                                      backgroundColor:
                                                      WidgetStateProperty.all(
                                                        const Color.fromRGBO(
                                                            83, 32, 95, 1),
                                                      ),
                                                      side:
                                                      WidgetStateProperty.all(
                                                        BorderSide(
                                                          color: Colors.white
                                                              .withOpacity(0.5),
                                                          width: isIpad
                                                              ? 3
                                                              : (isIphone
                                                              ? 2
                                                              : 2),
                                                        ),
                                                      ),
                                                    ),
                                                    onPressed: () {
                                                      setState(() {
                                                        createTablePopup = false;
                                                      });
                                                    },
                                                    child: Center(
                                                      child: Text(
                                                        translationManager
                                                            .translate(
                                                            'txtCancel')
                                                            .toUpperCase(),
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                          fontWeight:
                                                          FontWeight.bold,
                                                          fontSize:
                                                          screenWidth * 0.011,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: isIpad
                                                      ? screenWidth * 0.13
                                                      : (isIphone
                                                      ? screenWidth * 0.124
                                                      : screenWidth * 0.124),
                                                  height: isIpad
                                                      ? screenHeight * 0.04
                                                      : (isIphone
                                                      ? screenHeight * 0.055
                                                      : screenHeight * 0.055),
                                                  child: ElevatedButton(
                                                    style: ButtonStyle(
                                                      shape:
                                                      WidgetStateProperty.all(
                                                        const RoundedRectangleBorder(
                                                          borderRadius:
                                                          BorderRadius.only(
                                                            topLeft:
                                                            Radius.circular(
                                                                0.0),
                                                            topRight:
                                                            Radius.circular(
                                                                0.0),
                                                            bottomLeft:
                                                            Radius.circular(
                                                                0.0),
                                                            bottomRight:
                                                            Radius.circular(
                                                                0.0),
                                                          ),
                                                        ),
                                                      ),
                                                      backgroundColor:
                                                      WidgetStateProperty.all(
                                                        const Color.fromRGBO(
                                                            62, 15, 74, 1),
                                                      ),
                                                      side:
                                                      WidgetStateProperty.all(
                                                        BorderSide(
                                                          color: Colors.white
                                                              .withOpacity(0.5),
                                                          width: isIpad
                                                              ? 3
                                                              : (isIphone
                                                              ? 2
                                                              : 2),
                                                        ),
                                                      ),
                                                    ),
                                                    onPressed: () {},
                                                    child: Center(
                                                      child: Text(
                                                        translationManager
                                                            .translate(
                                                            'txtCreateTable')
                                                            .toUpperCase(),
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                          fontWeight:
                                                          FontWeight.bold,
                                                          fontSize: screenWidth *
                                                              0.0105,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: isIpad
                                                      ? screenWidth * 0.13
                                                      : (isIphone
                                                      ? screenWidth * 0.124
                                                      : screenWidth * 0.124),
                                                  height: isIpad
                                                      ? screenHeight * 0.04
                                                      : (isIphone
                                                      ? screenHeight * 0.055
                                                      : screenHeight * 0.055),
                                                  child: ElevatedButton(
                                                    style: ButtonStyle(
                                                      shape:
                                                      WidgetStateProperty.all(
                                                        RoundedRectangleBorder(
                                                          borderRadius:
                                                          BorderRadius.only(
                                                            topLeft: const Radius
                                                                .circular(0.0),
                                                            topRight: isIpad
                                                                ? const Radius
                                                                .circular(
                                                                20.0)
                                                                : (isIphone
                                                                ? const Radius
                                                                .circular(
                                                                12.0)
                                                                : const Radius
                                                                .circular(
                                                                12.0)),
                                                            bottomLeft:
                                                            const Radius
                                                                .circular(
                                                                0.0),
                                                            bottomRight: isIpad
                                                                ? const Radius
                                                                .circular(
                                                                20.0)
                                                                : (isIphone
                                                                ? const Radius
                                                                .circular(
                                                                12.0)
                                                                : const Radius
                                                                .circular(
                                                                12.0)),
                                                          ),
                                                        ),
                                                      ),
                                                      backgroundColor:
                                                      WidgetStateProperty.all(
                                                        const Color.fromRGBO(
                                                            83, 32, 95, 1),
                                                      ),
                                                      side:
                                                      WidgetStateProperty.all(
                                                        BorderSide(
                                                          color: Colors.white
                                                              .withOpacity(0.5),
                                                          width: isIpad
                                                              ? 3
                                                              : (isIphone
                                                              ? 2
                                                              : 2),
                                                        ),
                                                      ),
                                                    ),
                                                    onPressed: () {},
                                                    child: Center(
                                                      child: Text(
                                                        translationManager
                                                            .translate(
                                                            'txtInviteFriend')
                                                            .toUpperCase(),
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                          fontWeight:
                                                          FontWeight.bold,
                                                          fontSize: screenWidth *
                                                              0.0105,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class Btn extends StatelessWidget {
  final String text;
  final Function f;
  final bool enabled;
  const Btn(
    this.text,
    this.f,
    this.enabled, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => f(),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: const [0, 0.8, 1.0, 1.0],
              colors: [
                enabled == true ? Colors.white : const Color(0xffd3d5e0),
                enabled == true ? Colors.white : const Color(0xffd3d5e0),
                const Color(0xffb7b6b5).withOpacity(0.5),
                const Color(0xffb7b6b5)
              ],
            ),
            border: Border.all(width: 1, color: Colors.black)),
        child: Text(
          text,
          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
