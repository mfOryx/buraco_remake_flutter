import 'dart:io' show Platform;
import 'package:buracoplus/blocks/lobby_card.dart' show LobbyCard;
import 'package:buracoplus/blocks/lobby_user_stats.dart' show LobbyUserStats;
import 'package:buracoplus/create_table_multi_player.dart' show CreateTableMP;
import 'package:buracoplus/helpers/user.dart' show User;
import 'package:buracoplus/menu_views/notices/notices_menu.dart'
    show NoticesMenu;
import 'package:buracoplus/models/logged_in_player.dart' show LoggedInPlayer;
import 'package:buracoplus/models/tables.dart' show GameTable;
import 'package:buracoplus/providers/dialog_provider.dart' show DialogProvider;
import 'package:buracoplus/sockets/socket_service.dart' show SocketService;
import 'package:device_info_plus/device_info_plus.dart'
    show DeviceInfoPlugin, IosDeviceInfo;
import 'package:flutter/foundation.dart' show kDebugMode;
import 'package:flutter/material.dart'
    show
        Align,
        Alignment,
        AnimationController,
        Border,
        BorderRadius,
        BoxDecoration,
        BoxFit,
        BoxShape,
        BuildContext,
        Center,
        Clip,
        ClipOval,
        Color,
        Colors,
        Column,
        Container,
        EdgeInsets,
        ElevatedButton,
        Expanded,
        Flexible,
        FloatingActionButton,
        FontWeight,
        GestureDetector,
        Icon,
        IconButton,
        Icons,
        Image,
        LinearGradient,
        MainAxisAlignment,
        MediaQuery,
        Offset,
        Padding,
        PageView,
        Positioned,
        Radius,
        Row,
        SafeArea,
        Scaffold,
        Shadow,
        SingleTickerProviderStateMixin,
        SizedBox,
        Stack,
        State,
        StatefulWidget,
        StatelessWidget,
        Text,
        TextStyle,
        Widget,
        Wrap;
import 'package:provider/provider.dart' show Provider;
import 'common/general_functions.dart' show getPublicIP;
import 'common/translation_manager.dart' show TranslationManager;
import 'invite_friends.dart' show InviteFriends;
import 'profile/opponent_profile_view.dart';

class Lobby extends StatefulWidget {
  const Lobby({
    super.key,
  });

  @override
  State<Lobby> createState() {
    return _LobbyState();
  }
}

class _LobbyState extends State<Lobby> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late final socketService = Provider.of<SocketService>(context, listen: false);
  int totalPages = 0;
  int playerOnline = 100;
  int numberofTables = 70;
  List<GameTable> gameTables = [];
  List<GameTable> gameTablesFiltered = [];
  LoggedInPlayer currentlyLoggedInPlayer = User().getPlayer();
  bool isIpad = false;
  bool isIphone = false;

//// BARRA START \\\\
  bool isMenuVisible = false;
  bool isNoticesVisible = false;
  List<Map<String, dynamic>> _noticeList = [];

  @override
  void initState() {
    super.initState();
    getTables();
    checkDeviceType();
    //_getPlayerNotifications();
    _getDummyNotices(); // To be removed
  }

  void _toggleNotices() {
    setState(
      () {
        isNoticesVisible = !isNoticesVisible;
        if (kDebugMode) {
          print(isNoticesVisible.toString());
        }
      },
    );
  }

  //// To be removed (start)
  void _getDummyNotices() {
    _noticeList = [
      {
        'title': 'SYSTEM',
        'message':
            'I am going to configure the following boxes to pickup data from socket.io',
        'date': '2024-08-05',
        'time': '10:00',
        'isRead': false
      },
      {
        'title': 'SYSTEM',
        'message': 'You can scroll to infinite this text but the box will never exceed a given size...\n'
            'You can scroll to infinite this text but the box will never exceed a given size...\n'
            'You can scroll to infinite this text but the box will never exceed a given size...\n'
            'You can scroll to infinite this text but the box will never exceed a given size...\n'
            'You can scroll to infinite this text but the box will never exceed a given size...\n'
            'You can scroll to infinite this text but the box will never exceed a given size...\n'
            'You can scroll to infinite this text but the box will never exceed a given size...\n'
            'You can scroll to infinite this text but the box will never exceed a given size...\n'
            'You can scroll to infinite this text but the box will never exceed a given size...\n'
            'You can scroll to infinite this text but the box will never exceed a given size...\n'
            'You can scroll to infinite this text but the box will never exceed a given size...\n'
            'You can scroll to infinite this text but the box will never exceed a given size...\n'
            'You can scroll to infinite this text but the box will never exceed a given size...\n'
            'You can scroll to infinite this text but the box will never exceed a given size...\n'
            'You can scroll to infinite this text but the box will never exceed a given size...\n'
            'You can scroll to infinite this text but the box will never exceed a given size...\n'
            'You can scroll to infinite this text but the box will never exceed a given size...\n'
            'You can scroll to infinite this text but the box will never exceed a given size...\n'
            'You can scroll to infinite this text but the box will never exceed a given size...\n'
            'You can scroll to infinite this text but the box will never exceed a given size...\n'
            'You can scroll to infinite this text but the box will never exceed a given size...\n'
            'You can scroll to infinite this text but the box will never exceed a given size...\n'
            'You can scroll to infinite this text but the box will never exceed a given size...\n',
        'date': '2024-08-05',
        'time': '17:00',
        'isRead': false
      },
      {
        'title': 'SYSTEM',
        'message': 'blablabla',
        'date': '2024-08-05',
        'time': '10:00',
        'isRead': false
      },
      {
        'title': 'SYSTEM',
        'message': 'blablabla',
        'date': '2024-08-05',
        'time': '10:00',
        'isRead': false
      },
      {
        'title': 'SYSTEM',
        'message': 'blablabla',
        'date': '2024-08-05',
        'time': '10:00',
        'isRead': false
      },
    ];
  }
  //// To be removed (end)

  // _getPlayerNotifications() async {
  //   if (socketService.isConnected()) {
  //     print('start from here' + currentlyLoggedInPlayer.id.toString());
  //     Map<String, dynamic> getAllPlayerNotifications = await socketService
  //         .emitWithAck('getPlayerNotifications',
  //             {'playerId': currentlyLoggedInPlayer.oldId});
  //     print(getAllPlayerNotifications);
  //     if (getAllPlayerNotifications.containsKey('notificationsList')) {
  //       List<Map<String, dynamic>> allNotifications =
  //           List<Map<String, dynamic>>.from(
  //               getAllPlayerNotifications['notificationsList']);
  //       if (allNotifications.isNotEmpty) {
  //         _noticeList = allNotifications;
  //       }
  //       setState(
  //         () {
  //           totalPages = (_noticeList.length / 6).ceil();
  //         },
  //       );
  //     }
  //   }
  // }
//// BARRA END \\\\

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
        setState(
          () {
            totalPages = (gameTablesFiltered.length / 6).ceil();
          },
        );
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
    // double screenWidth = MediaQuery.of(context).size.width;
    // double screenHeight = MediaQuery.of(context).size.height;
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
                                //// BARRA START \\\\
                                Container(
                                  height: 44,
                                  width: 44,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.rectangle,
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.white.withOpacity(0.2),
                                  ),
                                  child: IconButton(
                                    icon: const Icon(
                                      Icons.message,
                                      color: Colors.white,
                                    ),
                                    style: ElevatedButton.styleFrom(
                                      foregroundColor: Colors.transparent,
                                      backgroundColor: Colors.transparent,
                                    ),
                                    onPressed: _toggleNotices,
                                  ),
                                ),
                                //// BARRA END \\\\
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
                                Provider.of<DialogProvider>(context,
                                        listen: false)
                                    .showCreateTableDialog();
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
                                              onPressed: () {
                                                setState(() {
                                                  Provider.of<DialogProvider>(
                                                          context,
                                                          listen: false)
                                                      .showPlayerProfileDialog();
                                                });
                                              },
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
            const CreateTableMP(),
            //// BARRA START \\\\
            NoticesMenu(
              isNoticesVisible: isNoticesVisible,
              onClose: _toggleNotices,
              noticeList: _noticeList,
            ),
            //// BARRA END \\\\
            const InviteFriends(),
            const OpponentProfileView()
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
