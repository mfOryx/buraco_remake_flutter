import 'dart:io';
import 'package:buracoplus/models/logged_in_player.dart';
import 'package:buracoplus/providers/create_table_provider.dart';
import 'package:buracoplus/providers/dialog_provider.dart';
import 'package:buracoplus/sockets/socket_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:buracoplus/common/translation_manager.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'common/general_functions.dart';
import 'helpers/user.dart';
import 'models/tables.dart';

class InviteFriends extends StatefulWidget {
  const InviteFriends({super.key});

  @override
  State<InviteFriends> createState() => _CreateInviteFriends();
}

class _CreateInviteFriends extends State<InviteFriends> {

  late final socketService = Provider.of<SocketService>(context, listen: false);
  int totalPages = 0;
  List<GameTable> gameTables = [];
  List<GameTable> gameTablesFiltered = [];
  LoggedInPlayer currentlyLoggedInPlayer = User().getPlayer();
  late Map<String, dynamic> friendsList;
  late List<dynamic> playersData;
  bool isIphone = false;
  bool isIpad = false;
  bool isChairSelected = true;
  String? username;

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

  // getTables() async {
  //   if (socketService.isConnected()) {
  //     Map<String, dynamic> getAllTables = await socketService.emitWithAck(
  //         'getAllTables', {'playerId': currentlyLoggedInPlayer.id});
  //
  //     if (getAllTables.containsKey('tablesList')) {
  //       List allTables = getAllTables['tablesList'];
  //
  //       if (allTables.isNotEmpty) {
  //         gameTables =
  //             allTables.map((element) => GameTable.fromJson(element)).toList();
  //         gameTablesFiltered = gameTables;
  //       }
  //       setState(
  //             () {
  //           totalPages = (gameTablesFiltered.length / 6).ceil();
  //         },
  //       );
  //     }
  //   }
  // }
  //
  // sitAtTable(int chairId, String tableId) async {
  //   if (kDebugMode) {
  //     print('chairId: $chairId, tableId: $tableId');
  //   }
  //   String ipAddress = await getPublicIP();
  //
  //   if (socketService.isConnected()) {
  //     Map<String, dynamic> response =
  //     await socketService.emitWithAck('sitAtTable', {
  //       'playerId': currentlyLoggedInPlayer.id,
  //       "tableId": tableId,
  //       "chairId": chairId,
  //       "ip": ipAddress
  //     });
  //
  //     getTables();
  //
  //     if (kDebugMode) {
  //       print(response);
  //     }
  //   }
  // }

  getFriends() async {
    try{
      print(currentlyLoggedInPlayer.oldId);
      if (socketService.isConnected()) {
        Map<String, dynamic> response = await socketService.emitWithAck('getFriends', {
          currentlyLoggedInPlayer.oldId,
        });
        if (kDebugMode) {
          print(response);
        }
        List<int> friendsIds = (response['friendsList'] as List<dynamic>)
            .map((friend) => friend['oldReceiverId'] as int)
            .toList();
        if (kDebugMode) {
          print(friendsIds);
        }
        friendsList = await socketService.emitWithAck('getPlayersData', {
          friendsIds,
        });
        if (kDebugMode) {
          print(friendsList);
        }
      }
    }
    catch(error){
      print(error);
    }
  }

  @override
  Widget build(BuildContext context) {
    //final themeProvider = Provider.of<ThemeProvider>(context);
    //final colors = themeProvider.currentColors;
    final translationManager = Provider.of<TranslationManager>(context);
    final createTableManager = Provider.of<CreateTableProvider>(context);
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    username = currentlyLoggedInPlayer.playerName;
    checkDeviceType();

    return Stack(
      children: [
        Consumer<DialogProvider>(
          builder: (context, dialogProvider, child) {
            if(dialogProvider.isInviteFriendsDialogVisible) {
              getFriends();
              playersData = friendsList['playersData'];
            }
            return dialogProvider.isInviteFriendsDialogVisible ?
            Stack(
              children: [
                Positioned.fill(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        dialogProvider.hideInviteFriendsDialog();
                        createTableManager.setIsLeftChairSelected(false);
                        createTableManager.setIsRightChairSelected(false);
                        createTableManager.setIsTopChairSelected(false);
                        createTableManager.setIsBottomChairSelected(false);
                        createTableManager.setIsLeftChairOccupied(false);
                        createTableManager.setIsRightChairOccupied(false);
                        createTableManager.setIsTopChairOccupied(false);
                        createTableManager.setIsBottomChairOccupied(false);
                      });
                    },
                    child: Container(
                      color: Colors.black.withOpacity(0.3),
                    ),
                  ),
                ),
                Align(
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
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // Top Row
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        // Title
                                        Padding(
                                          padding: EdgeInsets.only(
                                            top: isIpad ? screenHeight * 0.01 : (isIphone ? screenHeight * 0.005 : screenHeight * 0.005),
                                          ),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                translationManager
                                                    .translate('txtInviteFriends')
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
                                              Text(
                                                translationManager
                                                    .translate('txtSelectAChairToInviteYourFriend'),
                                                style: TextStyle(
                                                  color: Colors.white.withOpacity(0.5),
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: isIpad
                                                      ? screenWidth * 0.011
                                                      : (isIphone
                                                      ? screenWidth * 0.009
                                                      : screenWidth * 0.009),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        // Close Button
                                        IconButton(
                                          padding: EdgeInsets.only(
                                            top: isIpad ? screenHeight * 0.005 : (isIphone ? screenHeight * 0.0 : screenHeight * 0.0),
                                          ),
                                          alignment: Alignment.topCenter,
                                          icon: const Icon(Icons.close, color: Colors.white),
                                          iconSize: isIpad ? screenWidth * 0.022 : (isIphone ? screenWidth * 0.018 : screenWidth * 0.012),
                                          onPressed: () {
                                            setState(() {
                                              dialogProvider.hideInviteFriendsDialog();
                                              createTableManager.setIsLeftChairSelected(false);
                                              createTableManager.setIsRightChairSelected(false);
                                              createTableManager.setIsTopChairSelected(false);
                                              createTableManager.setIsBottomChairSelected(false);
                                              createTableManager.setIsLeftChairOccupied(false);
                                              createTableManager.setIsRightChairOccupied(false);
                                              createTableManager.setIsTopChairOccupied(false);
                                              createTableManager.setIsBottomChairOccupied(false);
                                            });
                                          },
                                        ),
                                      ],
                                    ),
                                    // Middle Section
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                          right: isIpad
                                              ? screenWidth * 0.04
                                              : (isIphone
                                              ? screenWidth * 0.04
                                              : screenWidth * 0.04),
                                          left: isIpad
                                              ? screenWidth * 0.03
                                              : (isIphone
                                              ? screenWidth * 0.02
                                              : screenWidth * 0.02),
                                          top: isIpad
                                              ? screenHeight * 0.02
                                              : (isIphone
                                              ? screenHeight * 0.00
                                              : screenHeight * 0.00),
                                        ),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Row(
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: [
                                                Column(
                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                  children: [
                                                    Container(
                                                      width: isIpad
                                                          ? screenWidth * 0.05
                                                          : (isIphone ? screenWidth * 0.035 : screenWidth * 0.035),
                                                      height: isIpad
                                                          ? screenHeight * 0.0775
                                                          : (isIphone ? screenHeight * 0.067 : screenHeight * 0.067),
                                                      decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        border: Border.all(color: const Color.fromRGBO(83, 32, 95, 1)),
                                                      ),
                                                      child: Column(
                                                        mainAxisAlignment: MainAxisAlignment.start,
                                                        children: [
                                                          Container(
                                                            decoration: BoxDecoration(
                                                              shape: BoxShape.circle,
                                                              border: Border.all(
                                                                color: Colors.black.withOpacity(0.1),
                                                                width: 1.0,
                                                              ),
                                                            ),
                                                            child: CircleAvatar(
                                                              radius: isIpad ? screenWidth * 0.02
                                                                  : (isIphone ? screenWidth * 0.008
                                                                  : screenWidth * 0.008),
                                                              backgroundImage: const AssetImage('assets/menuIcons/blankAvatar_2.png'),
                                                            ),
                                                          ),
                                                          Container(
                                                            width: isIpad
                                                                ? screenWidth * 0.05
                                                                : (isIphone ? screenWidth * 0.05 : screenWidth * 0.05),
                                                            height: isIpad
                                                                ? screenHeight * 0.02
                                                                : (isIphone ? screenHeight * 0.023 : screenHeight * 0.023),
                                                            color: const Color.fromRGBO(8, 39, 76, 1),
                                                            child: Text(
                                                              username!,
                                                              textAlign: TextAlign.center,
                                                              style: TextStyle(
                                                                color: Colors.white,
                                                                fontSize: isIpad
                                                                    ? screenWidth * 0.01
                                                                    : (isIphone ? screenWidth * 0.008 : screenWidth * 0.008),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    //Middle of the Table
                                                    Row(
                                                      children: [
                                                        createTableManager.getIsLeftChairOccupied
                                                            ?
                                                        Container(
                                                          width: isIpad
                                                              ? screenWidth * 0.05
                                                              : (isIphone ? screenWidth * 0.035 : screenWidth * 0.035),
                                                          height: isIpad
                                                              ? screenHeight * 0.0775
                                                              : (isIphone ? screenHeight * 0.067 : screenHeight * 0.067),
                                                          decoration: BoxDecoration(
                                                            color: Colors.white,
                                                            border: Border.all(color: const Color.fromRGBO(83, 32, 95, 1)),
                                                          ),
                                                          child: Column(
                                                            mainAxisAlignment: MainAxisAlignment.start,
                                                            children: [
                                                              Container(
                                                                decoration: BoxDecoration(
                                                                  shape: BoxShape.circle,
                                                                  border: Border.all(
                                                                    color: Colors.black.withOpacity(0.1),
                                                                    width: 1.0,
                                                                  ),
                                                                ),
                                                                child: CircleAvatar(
                                                                  radius: isIpad ? screenWidth * 0.02
                                                                      : (isIphone ? screenWidth * 0.008
                                                                      : screenWidth * 0.008),
                                                                  backgroundImage: const AssetImage('assets/menuIcons/blankAvatar_2.png'),
                                                                ),
                                                              ),
                                                              Container(
                                                                width: isIpad
                                                                    ? screenWidth * 0.05
                                                                    : (isIphone ? screenWidth * 0.05 : screenWidth * 0.05),
                                                                height: isIpad
                                                                    ? screenHeight * 0.02
                                                                    : (isIphone ? screenHeight * 0.023 : screenHeight * 0.023),
                                                                color: const Color.fromRGBO(8, 39, 76, 1),
                                                                child: Text(
                                                                  'ABC',
                                                                  textAlign: TextAlign.center,
                                                                  style: TextStyle(
                                                                    color: Colors.white,
                                                                    fontSize: isIpad
                                                                        ? screenWidth * 0.01
                                                                        : (isIphone ? screenWidth * 0.008 : screenWidth * 0.008),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        )
                                                            :
                                                        Stack(
                                                          children: [
                                                            Image.asset(
                                                              "assets/seats/sidechairdraft.png",
                                                              height: isIpad
                                                                  ? screenHeight * 0.05
                                                                  : (isIphone
                                                                  ? screenHeight * 0.065
                                                                  : screenHeight * 0.065),
                                                            ),
                                                            Positioned(
                                                              right: isIpad
                                                                  ? screenWidth * 0.008
                                                                  : (isIphone
                                                                  ? screenWidth * 0.009
                                                                  : screenWidth * 0.009),
                                                              bottom: isIpad
                                                                  ? screenHeight * 0.024
                                                                  : (isIphone
                                                                  ? screenHeight * 0.032
                                                                  : screenHeight * 0.032),
                                                              child: Container(
                                                                width: isIpad
                                                                    ? screenWidth * 0.025
                                                                    : (isIphone
                                                                    ? screenWidth * 0.015
                                                                    : screenWidth * 0.015),
                                                                height: isIpad
                                                                    ? screenHeight * 0.025
                                                                    : (isIphone
                                                                    ? screenHeight * 0.032
                                                                    : screenHeight * 0.032),
                                                                decoration: const BoxDecoration(
                                                                  color: Color.fromRGBO(83, 32, 95, 1),
                                                                  shape: BoxShape.circle,
                                                                ),
                                                                child: IconButton(
                                                                  padding: EdgeInsets.zero,
                                                                  onPressed: () {
                                                                    setState(() {
                                                                      createTableManager.setIsLeftChairSelected(true);
                                                                      createTableManager.setIsRightChairSelected(false);
                                                                      createTableManager.setIsTopChairSelected(false);
                                                                      createTableManager.setIsBottomChairSelected(false);
                                                                    });
                                                                  },
                                                                  icon: const Icon(
                                                                    Icons.add,
                                                                    color: Colors.white,
                                                                  ),
                                                                  iconSize: isIpad
                                                                      ? screenWidth * 0.02
                                                                      : (isIphone
                                                                      ? screenWidth * 0.015
                                                                      : screenWidth * 0.015),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        //Table Image
                                                        Padding(
                                                          padding: EdgeInsets.only(
                                                            top: createTableManager.getIsTopChairOccupied
                                                                ? (isIpad
                                                                ? screenHeight * 0.03
                                                                : (isIphone
                                                                ? screenHeight * 0.005
                                                                : screenHeight * 0.005))
                                                                : (isIpad
                                                                ? screenHeight * 0.008
                                                                : (isIphone
                                                                ? screenHeight * 0.0
                                                                : screenHeight * 0.0)),
                                                            bottom: createTableManager.getIsBottomChairOccupied
                                                                ? (isIpad
                                                                ? screenHeight * 0.015
                                                                : (isIphone
                                                                ? screenHeight * 0.0
                                                                : screenHeight * 0.0))
                                                                : (isIpad
                                                                ? screenHeight * 0.01
                                                                : (isIphone
                                                                ? screenHeight * 0.0
                                                                : screenHeight * 0.0)),
                                                            left: createTableManager.getIsLeftChairOccupied
                                                                ? (isIpad
                                                                ? screenWidth * 0.015
                                                                : (isIphone
                                                                ? screenWidth * 0.008
                                                                : screenWidth * 0.008))
                                                                : (isIpad
                                                                ? screenWidth * 0.0
                                                                : (isIphone
                                                                ? screenWidth * 0.0
                                                                : screenWidth * 0.0)),
                                                            right: createTableManager.getIsRightChairOccupied
                                                                ? (isIpad
                                                                ? screenWidth * 0.015
                                                                : (isIphone
                                                                ? screenWidth * 0.008
                                                                : screenWidth * 0.008))
                                                                : (isIpad
                                                                ? screenWidth * 0.0
                                                                : (isIphone
                                                                ? screenWidth * 0.0
                                                                : screenWidth * 0.0)),
                                                          ),
                                                          child:
                                                            Image.asset(
                                                              "assets/seats/tabledraft.png",
                                                              width: isIpad
                                                                  ? screenWidth * 0.08
                                                                  : (isIphone
                                                                  ? screenWidth * 0.06
                                                                  : screenWidth * 0.06),
                                                              height: isIpad
                                                                  ? screenHeight * 0.05
                                                                  : (isIphone
                                                                  ? screenHeight * 0.06
                                                                  : screenHeight * 0.06),
                                                            ),
                                                        ),
                                                        createTableManager.getIsRightChairOccupied
                                                            ?
                                                        Container(
                                                          width: isIpad
                                                              ? screenWidth * 0.05
                                                              : (isIphone ? screenWidth * 0.035 : screenWidth * 0.035),
                                                          height: isIpad
                                                              ? screenHeight * 0.0775
                                                              : (isIphone ? screenHeight * 0.067 : screenHeight * 0.067),
                                                          decoration: BoxDecoration(
                                                            color: Colors.white,
                                                            border: Border.all(color: const Color.fromRGBO(83, 32, 95, 1)),
                                                          ),
                                                          child: Column(
                                                            mainAxisAlignment: MainAxisAlignment.start,
                                                            children: [
                                                              Container(
                                                                decoration: BoxDecoration(
                                                                  shape: BoxShape.circle,
                                                                  border: Border.all(
                                                                    color: Colors.black.withOpacity(0.1),
                                                                    width: 1.0,
                                                                  ),
                                                                ),
                                                                child: CircleAvatar(
                                                                  radius: isIpad ? screenWidth * 0.02
                                                                      : (isIphone ? screenWidth * 0.008
                                                                      : screenWidth * 0.008),
                                                                  backgroundImage: const AssetImage('assets/menuIcons/blankAvatar_2.png'),
                                                                ),
                                                              ),
                                                              Container(
                                                                width: isIpad
                                                                    ? screenWidth * 0.05
                                                                    : (isIphone ? screenWidth * 0.05 : screenWidth * 0.05),
                                                                height: isIpad
                                                                    ? screenHeight * 0.02
                                                                    : (isIphone ? screenHeight * 0.023 : screenHeight * 0.023),
                                                                color: const Color.fromRGBO(8, 39, 76, 1),
                                                                child: Text(
                                                                  'ABC',
                                                                  textAlign: TextAlign.center,
                                                                  style: TextStyle(
                                                                    color: Colors.white,
                                                                    fontSize: isIpad
                                                                        ? screenWidth * 0.01
                                                                        : (isIphone ? screenWidth * 0.008 : screenWidth * 0.008),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        )
                                                            :
                                                        Stack(
                                                          children: [
                                                            Transform(
                                                              transform: Matrix4.rotationY(3.14159),
                                                              alignment: Alignment.center,
                                                              child: Image.asset(
                                                                "assets/seats/sidechairdraft.png",
                                                                height: isIpad
                                                                    ? screenHeight * 0.05
                                                                    : (isIphone
                                                                    ? screenHeight * 0.065
                                                                    : screenHeight * 0.065),
                                                              ),
                                                            ),
                                                            Positioned(
                                                              right: isIpad
                                                                  ? screenWidth * 0.001
                                                                  : (isIphone
                                                                  ? screenWidth * 0.003
                                                                  : screenWidth * 0.003),
                                                              bottom: isIpad
                                                                  ? screenHeight * 0.024
                                                                  : (isIphone
                                                                  ? screenHeight * 0.032
                                                                  : screenHeight * 0.032),
                                                              child: Container(
                                                                width: isIpad
                                                                    ? screenWidth * 0.025
                                                                    : (isIphone
                                                                    ? screenWidth * 0.015
                                                                    : screenWidth * 0.015),
                                                                height: isIpad
                                                                    ? screenHeight * 0.025
                                                                    : (isIphone
                                                                    ? screenHeight * 0.032
                                                                    : screenHeight * 0.032),
                                                                decoration: const BoxDecoration(
                                                                  color: Color.fromRGBO(83, 32, 95, 1),
                                                                  shape: BoxShape.circle,
                                                                ),
                                                                child: IconButton(
                                                                  padding: EdgeInsets.zero,
                                                                  onPressed: () {
                                                                    setState(() {
                                                                      createTableManager.setIsLeftChairSelected(false);
                                                                      createTableManager.setIsRightChairSelected(true);
                                                                      createTableManager.setIsTopChairSelected(false);
                                                                      createTableManager.setIsBottomChairSelected(false);
                                                                    });
                                                                  },
                                                                  icon: const Icon(
                                                                    Icons.add,
                                                                    color: Colors.white,
                                                                  ),
                                                                  iconSize: isIpad
                                                                      ? screenWidth * 0.02
                                                                      : (isIphone
                                                                      ? screenWidth * 0.015
                                                                      : screenWidth * 0.015),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                    createTableManager.getIsBottomChairOccupied
                                                        ?
                                                    Container(
                                                      width: isIpad
                                                          ? screenWidth * 0.05
                                                          : (isIphone ? screenWidth * 0.035 : screenWidth * 0.035),
                                                      height: isIpad
                                                          ? screenHeight * 0.0775
                                                          : (isIphone ? screenHeight * 0.067 : screenHeight * 0.067),
                                                      decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        border: Border.all(color: const Color.fromRGBO(83, 32, 95, 1)),
                                                      ),
                                                      child: Column(
                                                        mainAxisAlignment: MainAxisAlignment.start,
                                                        children: [
                                                          Container(
                                                            decoration: BoxDecoration(
                                                              shape: BoxShape.circle,
                                                              border: Border.all(
                                                                color: Colors.black.withOpacity(0.1),
                                                                width: 1.0,
                                                              ),
                                                            ),
                                                            child: CircleAvatar(
                                                              radius: isIpad ? screenWidth * 0.02
                                                                  : (isIphone ? screenWidth * 0.008
                                                                  : screenWidth * 0.008),
                                                              backgroundImage: const AssetImage('assets/menuIcons/blankAvatar_2.png'),
                                                            ),
                                                          ),
                                                          Container(
                                                            width: isIpad
                                                                ? screenWidth * 0.05
                                                                : (isIphone ? screenWidth * 0.05 : screenWidth * 0.05),
                                                            height: isIpad
                                                                ? screenHeight * 0.02
                                                                : (isIphone ? screenHeight * 0.023 : screenHeight * 0.023),
                                                            color: const Color.fromRGBO(8, 39, 76, 1),
                                                            child: Text(
                                                              'ABC',
                                                              textAlign: TextAlign.center,
                                                              style: TextStyle(
                                                                color: Colors.white,
                                                                fontSize: isIpad
                                                                    ? screenWidth * 0.01
                                                                    : (isIphone ? screenWidth * 0.008 : screenWidth * 0.008),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    )
                                                        :
                                                    Stack(
                                                      children: [
                                                        Image.asset(
                                                          "assets/seats/b-chairdraft.png",
                                                          height: isIpad
                                                              ? screenHeight * 0.05
                                                              : (isIphone
                                                              ? screenHeight * 0.065
                                                              : screenHeight * 0.065),
                                                        ),
                                                        Positioned(
                                                          right: isIpad
                                                              ? screenWidth * 0.004
                                                              : (isIphone
                                                              ? screenWidth * 0.005
                                                              : screenWidth * 0.005),
                                                          bottom: isIpad
                                                              ? screenHeight * 0.024
                                                              : (isIphone
                                                              ? screenHeight * 0.032
                                                              : screenHeight * 0.032),
                                                          child: Container(
                                                            width: isIpad
                                                                ? screenWidth * 0.025
                                                                : (isIphone
                                                                ? screenWidth * 0.015
                                                                : screenWidth * 0.015),
                                                            height: isIpad
                                                                ? screenHeight * 0.025
                                                                : (isIphone
                                                                ? screenHeight * 0.032
                                                                : screenHeight * 0.032),
                                                            decoration: const BoxDecoration(
                                                              color: Color.fromRGBO(83, 32, 95, 1),
                                                              shape: BoxShape.circle,
                                                            ),
                                                            child: IconButton(
                                                              padding: EdgeInsets.zero,
                                                              onPressed: () {
                                                                setState(() {
                                                                  createTableManager.setIsLeftChairSelected(false);
                                                                  createTableManager.setIsRightChairSelected(false);
                                                                  createTableManager.setIsTopChairSelected(false);
                                                                  createTableManager.setIsBottomChairSelected(true);
                                                                });
                                                              },
                                                              icon: const Icon(
                                                                Icons.add,
                                                                color: Colors.white,
                                                              ),
                                                              iconSize: isIpad
                                                                  ? screenWidth * 0.02
                                                                  : (isIphone
                                                                  ? screenWidth * 0.015
                                                                  : screenWidth * 0.015),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                top: isIpad
                                                    ? screenHeight * 0.03
                                                    : (isIphone ? screenHeight * 0.0
                                                    : screenHeight * 0.0),
                                              ),
                                              child: Column(
                                                children: [
                                                  Text(
                                                    translationManager.translate("txtTableOf") + (username!),
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: isIpad
                                                          ? screenWidth * 0.012
                                                          : (isIphone
                                                          ? screenWidth * 0.01
                                                          : screenWidth * 0.01),
                                                    ),
                                                  ),
                                                  Text(
                                                    (createTableManager.getClassicToggle 
                                                        ? translationManager.translate("txtItalian")
                                                        : (createTableManager.getProfessionalToggle
                                                        ? translationManager.translate("txtProfessional")
                                                        : translationManager.translate("txtNone")
                                                    ))
                                                    + " - "
                                                    + (createTableManager.getTurnTimeOne
                                                        ? translationManager.translate("txtTurnTime15")
                                                        : (createTableManager.getTurnTimeTwo
                                                        ? translationManager.translate("txtTurnTime30")
                                                        : (createTableManager.getTurnTimeThree
                                                        ? translationManager.translate("txtTurnTime45")
                                                        : (createTableManager.getTurnTimeFour
                                                        ? translationManager.translate("txtTurnTime60")
                                                        : translationManager.translate("txtNone")
                                                    )
                                                    )
                                                    ))
                                                    + "s - "
                                                    + (createTableManager.getPointsOne
                                                        ? translationManager.translate("txtOneHand")
                                                        : (createTableManager.getPointsTwo
                                                        ? (createTableManager.getClassicToggle
                                                        ? translationManager.translate('txtPoints1005')
                                                        : translationManager.translate('txtPoints1505'))
                                                        : (createTableManager.getPointsThree
                                                        ? (createTableManager.getClassicToggle
                                                        ? translationManager.translate('txtPoints1505')
                                                        : translationManager.translate('txtPoints2000'))
                                                        : (createTableManager.getPointsFour
                                                        ? translationManager.translate("txtPoints2005")
                                                        : translationManager.translate("txtNone")
                                                    )
                                                    )
                                                    )),
                                                    style: TextStyle(
                                                      color: Colors.amber,
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: isIpad
                                                          ? screenWidth * 0.012
                                                          : (isIphone
                                                          ? screenWidth * 0.01
                                                          : screenWidth * 0.01),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: isIpad
                                                        ? screenHeight * 0.02
                                                        : (isIphone ? screenHeight * 0.03 : screenHeight * 0.03),
                                                  ),
                                                  SizedBox(
                                                    width: isIpad ? screenWidth * 0.12
                                                        : (isIphone ? screenWidth * 0.11
                                                        : screenWidth * 0.11),
                                                    height: isIpad
                                                        ? screenHeight * 0.04
                                                        : (isIphone ? screenHeight * 0.06 : screenHeight * 0.06),
                                                    child: OutlinedButton(
                                                      onPressed: () {},
                                                      style: OutlinedButton.styleFrom(
                                                        padding: EdgeInsets.zero,
                                                        side: const BorderSide(color: Colors.black),
                                                        shape: RoundedRectangleBorder(
                                                          borderRadius: BorderRadius.circular(5.0),
                                                        ),
                                                        backgroundColor: const Color.fromRGBO(240, 240, 240, 1),
                                                      ),
                                                      child: Text(
                                                        translationManager.translate('txtOpenTable').toUpperCase(),
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          fontWeight: FontWeight.bold,
                                                          fontSize: isIpad ? screenWidth * 0.012
                                                              : (isIphone ? screenWidth * 0.01
                                                              : screenWidth * 0.01 ),
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
                                    ),
                                  ],
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
                                      ? screenHeight * 0.55
                                      : (isIphone ? screenHeight * 0.6 : screenHeight * 0.6),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(
                                          top: isIpad ? screenWidth * 0.015 : screenWidth * 0.01,
                                          bottom: isIpad ? screenWidth * 0.015 : screenWidth * 0.001,
                                        ),
                                        child: SizedBox(
                                          width: isIpad ? screenWidth * 0.35 : screenWidth * 0.3,
                                          height: isIpad ? screenHeight * 0.04 : screenHeight * 0.06,
                                          child: DecoratedBox(
                                            decoration: BoxDecoration(
                                              color: const Color.fromRGBO(83, 32, 95, 1),
                                              borderRadius: BorderRadius.only(
                                                topLeft: isIpad ? const Radius.circular(20.0) : const Radius.circular(12.0),
                                                topRight: isIpad ? const Radius.circular(20.0) : const Radius.circular(12.0),
                                                bottomLeft: isIpad ? const Radius.circular(20.0) : const Radius.circular(12.0),
                                                bottomRight: isIpad ? const Radius.circular(20.0) : const Radius.circular(12.0),
                                              ),
                                              border: Border.all(
                                                color: Colors.white.withOpacity(0.5),
                                                width: isIpad ? 3 : 2,
                                              ),
                                            ),
                                            child: Center(
                                              child: Text(
                                                translationManager.translate('txtFriends').toUpperCase(),
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: screenWidth * 0.01,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                          bottom: isIpad ? screenWidth * 0.02 : (isIphone ? screenWidth * 0.016 : screenWidth * 0.016),
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            SizedBox(
                                              width: isIpad ? screenWidth * 0.24 : (isIphone ? screenWidth * 0.18 : screenWidth * 0.02),
                                              height: isIpad ? screenHeight * 0.04 : (isIphone ? screenHeight * 0.06 : screenWidth * screenHeight * 0.07),
                                              child: TextField(
                                                maxLines: 1,
                                                textAlign: TextAlign.left,
                                                cursorHeight: isIpad ? screenHeight * 0.02 : (isIphone ? screenHeight * 0.035 : screenWidth * screenHeight * 0.035),
                                                cursorColor: Colors.black,
                                                decoration: InputDecoration(
                                                  contentPadding: EdgeInsets.only(
                                                    left: isIpad ? screenWidth * 0.005 : (isIphone ? screenWidth * 0.005 : screenWidth * 0.005),
                                                  ),
                                                  hintText: translationManager.translate('txtSearchAPlayer...'),
                                                  hintStyle: TextStyle(
                                                    fontSize: screenWidth * 0.015,
                                                    color: Colors.white,
                                                  ),
                                                  suffixIcon: Icon(
                                                    Icons.search,
                                                    color: Colors.white,
                                                    size: isIpad ? screenWidth * 0.02 : (isIphone ? screenWidth * 0.02 : screenWidth * 0.02),
                                                  ),
                                                  filled: true,
                                                  fillColor: Colors.grey.withOpacity(0.8),
                                                  border: OutlineInputBorder(
                                                    borderRadius: BorderRadius.circular(5.0),
                                                    borderSide: BorderSide.none,
                                                  ),
                                                  enabledBorder: OutlineInputBorder(
                                                    borderRadius: BorderRadius.circular(5.0),
                                                    borderSide: BorderSide.none,
                                                  ),
                                                  focusedBorder: OutlineInputBorder(
                                                    borderRadius: BorderRadius.circular(5.0),
                                                    borderSide: BorderSide.none,
                                                  ),
                                                  errorBorder: OutlineInputBorder(
                                                    borderRadius: BorderRadius.circular(5.0),
                                                    borderSide: BorderSide.none,
                                                  ),
                                                  disabledBorder: OutlineInputBorder(
                                                    borderRadius: BorderRadius.circular(5.0),
                                                    borderSide: BorderSide.none,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            IconButton(
                                              icon: Icon(
                                                Icons.refresh,
                                                size: isIpad ? screenWidth * 0.025
                                                    : (isIphone ? screenWidth * 0.02
                                                    : screenWidth * 0.02),
                                              ),
                                              onPressed: () {},
                                            ),
                                            Text(
                                              translationManager.translate('txtRefresh').toUpperCase(),
                                              style: TextStyle(
                                                fontSize: isIpad ? screenWidth * 0.012
                                                    : (isIphone ? screenWidth * 0.01
                                                    : screenWidth * 0.01),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: ListView.builder(
                                          itemCount: playersData.length,
                                          itemBuilder: (context, index) {
                                            final player = playersData[index];
                                            final playerName = player['playerName'] ?? 'Name not found';
                                            return Padding(
                                              padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 50.0),
                                              child: Row(
                                                children: [
                                                  Container(
                                                    decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      border: Border.all(
                                                        color: Colors.black.withOpacity(0.1),
                                                        width: 3.0,
                                                      ),
                                                    ),
                                                    child: CircleAvatar(
                                                      radius: isIpad ? screenWidth * 0.03
                                                          : (isIphone ? screenWidth * 0.02
                                                          : screenWidth * 0.02),
                                                      backgroundImage: const AssetImage('assets/menuIcons/blankAvatar_2.png'),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: isIpad ? screenWidth * 0.01
                                                      : (isIphone ? screenWidth * 0.01
                                                      : screenWidth * 0.01),
                                                  ),
                                                  Expanded(
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Text(
                                                          playerName,
                                                          style: TextStyle(
                                                            fontSize: isIpad ? screenWidth * 0.015
                                                                : (isIphone ? screenWidth * 0.012
                                                                : screenWidth * 0.012),
                                                            color: Colors.black,
                                                          ),
                                                        ),
                                                        Row(
                                                          children: [
                                                            // SizedBox(width: screenWidth * 0.02),
                                                            Padding(
                                                              padding: const EdgeInsets.only(top: 5,bottom: 5),
                                                              child: Container(
                                                                height: 2,
                                                                width: screenWidth * 0.14,
                                                                decoration: BoxDecoration(
                                                                  gradient: LinearGradient(
                                                                    colors: [
                                                                      Colors.transparent,
                                                                      Colors.grey.withOpacity(0.3),
                                                                      Colors.transparent,
                                                                    ],
                                                                    stops: const [0.0, 0.5, 1.0],
                                                                  ),
                                                                ),
                                                              ),
                                                            ),

                                                          ],
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                  SizedBox(
                                                      width: isIpad ? screenWidth * 0.012
                                                          : (isIphone ? screenWidth * 0.012
                                                          : screenWidth * 0.012),
                                                  ),
                                                  SizedBox(
                                                    width: isIpad ? screenWidth * 0.12
                                                        : (isIphone ? screenWidth * 0.1
                                                        : screenWidth * 0.1),
                                                    height: isIpad
                                                        ? screenHeight * 0.05
                                                        : (isIphone ? screenHeight * 0.07 : screenWidth * screenHeight * 0.07),
                                                    child: OutlinedButton(
                                                      onPressed: () {
                                                        setState(() {
                                                          if(createTableManager.getIsTopChairSelected
                                                              || createTableManager.getIsBottomChairSelected
                                                              || createTableManager.getIsLeftChairSelected
                                                              || createTableManager.getIsRightChairSelected
                                                          )
                                                          {
                                                            if(createTableManager.getIsLeftChairSelected && !createTableManager.getIsLeftChairOccupied)
                                                            {
                                                              createTableManager.setIsLeftChairOccupied(true);
                                                            }
                                                            else if(createTableManager.getIsRightChairSelected && !createTableManager.getIsRightChairOccupied)
                                                            {
                                                              createTableManager.setIsRightChairOccupied(true);
                                                            }
                                                            else if(createTableManager.getIsTopChairSelected && !createTableManager.getIsTopChairOccupied)
                                                            {
                                                              createTableManager.setIsTopChairOccupied(true);
                                                            }
                                                            else if(createTableManager.getIsBottomChairSelected && !createTableManager.getIsBottomChairOccupied)
                                                            {
                                                              createTableManager.setIsBottomChairOccupied(true);
                                                            }
                                                            else
                                                            {
                                                              isChairSelected = false;
                                                            }
                                                          }
                                                          else
                                                          {
                                                            isChairSelected = false;
                                                          }
                                                        });
                                                      },
                                                      style: OutlinedButton.styleFrom(
                                                        padding: EdgeInsets.zero,
                                                        side: const BorderSide(color: Colors.black),
                                                        shape: RoundedRectangleBorder(
                                                          borderRadius: BorderRadius.circular(5.0),
                                                        ),
                                                        backgroundColor: const Color.fromRGBO(240, 240, 240, 1),
                                                      ),
                                                      child: Text(
                                                        translationManager.translate('txtInvite').toUpperCase(),
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: isIpad ? screenWidth * 0.015
                                                              : (isIphone ? screenWidth * 0.012
                                                              : screenWidth * 0.012 ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            );
                                          },
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
              ],
            )
                : const SizedBox.shrink();
          },
        ),
        Stack(
          children: [
            if (!isChairSelected)
              Positioned.fill(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      isChairSelected = true;
                    });
                  },
                  child: Container(
                    color: Colors.black.withOpacity(0.3),
                  ),
                ),
              ),
            Visibility(
              visible: !isChairSelected,
              child: Align(
                alignment: Alignment.center,
                child: Container(
                  width: screenWidth * 0.35,
                  height: screenHeight * 0.3,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 5,
                        offset: Offset(2, 2),
                      ),
                    ],
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          translationManager
                              .translate('txtPleaseSelectAChair'),
                          style: TextStyle(
                              fontSize: screenWidth * 0.02,
                              color: Colors.black),
                        ),
                        const Spacer(),
                        OutlinedButton(
                          onPressed: () {
                            setState(() {
                              isChairSelected = true;
                            });
                          },
                          style: OutlinedButton.styleFrom(
                            padding: EdgeInsets.zero,
                            side: const BorderSide(color: Colors.black),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            backgroundColor: const Color.fromRGBO(240, 240, 240, 1),
                          ),
                          child: Text(
                            translationManager.translate('txtOk').toUpperCase(),
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: isIpad ? screenWidth * 0.015
                                  : (isIphone ? screenWidth * 0.012
                                  : screenWidth * 0.012 ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}