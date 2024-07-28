import 'dart:io';
import 'package:buracoplus/providers/dialog_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:buracoplus/common/translation_manager.dart';
import 'package:device_info_plus/device_info_plus.dart';

class InviteFriends extends StatefulWidget {
  const InviteFriends({super.key});

  @override
  State<InviteFriends> createState() => _CreateInviteFriends();
}

class _CreateInviteFriends extends State<InviteFriends> {
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
  final List<String> levels = [
    "None",
    "Level 5",
    "Level 10",
    "Level 15",
    "Level 20",
    "Level 25",
    "Level 30",
    "Level 35",
    "Level 40",
    "Level 45",
    "Level 50",
    "Level 55",
    "Level 60",
    "Level 65",
    "Level 70",
    "Level 75",
    "Level 80",
    "Level 85",
    "Level 90",
    "Level 95",
    "Level 100",
    "Level 105",
    "Level 110",
    "Level 115",
    "Level 120",
    "Level 125",
    "Level 130",
    "Level 135",
    "Level 140"
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

  @override
  Widget build(BuildContext context) {
    //final themeProvider = Provider.of<ThemeProvider>(context);
    //final colors = themeProvider.currentColors;
    final translationManager = Provider.of<TranslationManager>(context);
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    checkDeviceType();

    return Stack(
      children: [
        Consumer<DialogProvider>(
          builder: (context, dialogProvider, child) {
            return dialogProvider.isInviteFriendsDialogVisible
                ? Stack(
                    children: [
                      Positioned.fill(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              dialogProvider.hideInviteFriendsDialog();
                            });
                          },
                          child: Container(
                            color: Colors.black.withOpacity(0.3),
                          ),
                        ),
                      ),
                      // CreateTableMP(),
                      Align(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: EdgeInsets.only(
                              right: screenWidth * 0.03,
                              top: screenHeight * 0.022),
                          child: Align(
                            alignment: Alignment.topRight,
                            child: Container(
                              width: isIpad
                                  ? screenWidth * 0.48
                                  : (isIphone
                                      ? screenWidth * 0.45
                                      : screenWidth * 0.45),
                              height: isIpad
                                  ? screenHeight * 0.9
                                  : (isIphone
                                      ? screenHeight * 0.95
                                      : screenWidth * screenHeight * 0.95),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0),
                                color: const Color.fromRGBO(210, 210, 210, 1.0),
                              ),
                              child: Stack(
                                children: [
                                  Container(
                                    width: isIpad
                                        ? screenWidth * 0.55
                                        : (isIphone
                                            ? screenWidth * 0.55
                                            : screenWidth * 0.55),
                                    height: isIpad
                                        ? screenHeight * 0.4
                                        : (isIphone
                                            ? screenHeight * 0.4
                                            : screenWidth * screenHeight * 0.4),
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
                                            : (isIphone
                                                ? screenWidth * 0.01
                                                : screenWidth * 0.01),
                                      ),
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.only(
                                                top: isIpad
                                                    ? screenHeight * 0.01
                                                    : (isIphone
                                                        ? screenHeight * 0.005
                                                        : screenHeight * 0.005),
                                              ),
                                              child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      translationManager
                                                          .translate(
                                                              'txtInviteFriends')
                                                          .toUpperCase(),
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: isIpad
                                                            ? screenWidth *
                                                                0.018
                                                            : (isIphone
                                                                ? screenWidth *
                                                                    0.015
                                                                : screenWidth *
                                                                    0.015),
                                                      ),
                                                    ),
                                                    Text(
                                                      translationManager.translate(
                                                          'txtSelectAChairToInviteYourFriend'),
                                                      style: TextStyle(
                                                        color: Colors.white
                                                            .withOpacity(0.5),
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: isIpad
                                                            ? screenWidth *
                                                                0.011
                                                            : (isIphone
                                                                ? screenWidth *
                                                                    0.009
                                                                : screenWidth *
                                                                    0.009),
                                                      ),
                                                    ),
                                                  ]),
                                            ),
                                            IconButton(
                                              padding: EdgeInsets.only(
                                                top: isIpad
                                                    ? screenHeight * 0.005
                                                    : (isIphone
                                                        ? screenHeight * 0.0
                                                        : screenHeight * 0.0),
                                              ),
                                              alignment: Alignment.topCenter,
                                              icon: const Icon(Icons.close,
                                                  color: Colors.white),
                                              iconSize: isIpad
                                                  ? screenWidth * 0.022
                                                  : (isIphone
                                                      ? screenWidth * 0.018
                                                      : screenWidth * 0.012),
                                              onPressed: () {
                                                setState(() {
                                                  dialogProvider
                                                      .hideInviteFriendsDialog();
                                                });
                                              },
                                            ),
                                          ]),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                      bottom: isIpad
                                          ? screenWidth * 0.02
                                          : (isIphone
                                              ? screenWidth * 0.016
                                              : screenWidth * 0.016),
                                    ),
                                    child: Align(
                                      alignment: Alignment.bottomCenter,
                                      child: Container(
                                        width: isIpad
                                            ? screenWidth * 0.45
                                            : (isIphone
                                                ? screenWidth * 0.425
                                                : screenWidth * 0.425),
                                        height: isIpad
                                            ? screenHeight * 0.55
                                            : (isIphone
                                                ? screenHeight * 0.6
                                                : screenWidth *
                                                    screenHeight *
                                                    0.85),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                        ),
                                        child: Column(
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.only(
                                                top: isIpad
                                                    ? screenWidth * 0.015
                                                    : screenWidth * 0.01,
                                                bottom: isIpad
                                                    ? screenWidth * 0.015
                                                    : screenWidth * 0.001,
                                              ),
                                              child: SizedBox(
                                                width: isIpad
                                                    ? screenWidth * 0.35
                                                    : screenWidth * 0.3,
                                                height: isIpad
                                                    ? screenHeight * 0.04
                                                    : screenHeight * 0.06,
                                                child: DecoratedBox(
                                                  decoration: BoxDecoration(
                                                    color: const Color.fromRGBO(
                                                        83, 32, 95, 1),
                                                    borderRadius:
                                                        BorderRadius.only(
                                                      topLeft: isIpad
                                                          ? const Radius
                                                              .circular(20.0)
                                                          : const Radius
                                                              .circular(12.0),
                                                      topRight: isIpad
                                                          ? const Radius
                                                              .circular(20.0)
                                                          : const Radius
                                                              .circular(12.0),
                                                      bottomLeft: isIpad
                                                          ? const Radius
                                                              .circular(20.0)
                                                          : const Radius
                                                              .circular(12.0),
                                                      bottomRight: isIpad
                                                          ? const Radius
                                                              .circular(20.0)
                                                          : const Radius
                                                              .circular(12.0),
                                                    ),
                                                    border: Border.all(
                                                      color: Colors.white
                                                          .withOpacity(0.5),
                                                      width: isIpad ? 3 : 2,
                                                    ),
                                                  ),
                                                  child: Center(
                                                    child: Text(
                                                      translationManager
                                                          .translate(
                                                              'txtFriends')
                                                          .toUpperCase(),
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize:
                                                            screenWidth * 0.01,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                bottom: isIpad
                                                    ? screenWidth * 0.02
                                                    : (isIphone
                                                        ? screenWidth * 0.016
                                                        : screenWidth * 0.016),
                                              ),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  SizedBox(
                                                    width: isIpad
                                                        ? screenWidth * 0.24
                                                        : (isIphone
                                                            ? screenWidth * 0.18
                                                            : screenWidth *
                                                                0.02),
                                                    height: isIpad
                                                        ? screenHeight * 0.04
                                                        : (isIphone
                                                            ? screenHeight *
                                                                0.06
                                                            : screenWidth *
                                                                screenHeight *
                                                                0.07),
                                                    child: TextField(
                                                      maxLines: 1,
                                                      textAlign: TextAlign.left,
                                                      cursorHeight: isIpad
                                                          ? screenHeight * 0.02
                                                          : (isIphone
                                                              ? screenHeight *
                                                                  0.035
                                                              : screenWidth *
                                                                  screenHeight *
                                                                  0.035),
                                                      cursorColor: Colors.black,
                                                      decoration:
                                                          InputDecoration(
                                                        contentPadding:
                                                            EdgeInsets.only(
                                                          left: isIpad
                                                              ? screenWidth *
                                                                  0.005
                                                              : (isIphone
                                                                  ? screenWidth *
                                                                      0.005
                                                                  : screenWidth *
                                                                      0.005),
                                                        ),
                                                        hintText: translationManager
                                                            .translate(
                                                                'txtSearchAPlayer...'),
                                                        hintStyle: TextStyle(
                                                          fontSize:
                                                              screenWidth *
                                                                  0.015,
                                                          color: Colors.white,
                                                        ),
                                                        suffixIcon: Icon(
                                                          Icons.search,
                                                          color: Colors.white,
                                                          size: isIpad
                                                              ? screenWidth *
                                                                  0.02
                                                              : (isIphone
                                                                  ? screenWidth *
                                                                      0.02
                                                                  : screenWidth *
                                                                      0.02),
                                                        ),
                                                        filled: true,
                                                        fillColor: Colors.grey
                                                            .withOpacity(0.8),
                                                        border:
                                                            OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      5.0),
                                                          borderSide:
                                                              BorderSide.none,
                                                        ),
                                                        enabledBorder:
                                                            OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      5.0),
                                                          borderSide:
                                                              BorderSide.none,
                                                        ),
                                                        focusedBorder:
                                                            OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      5.0),
                                                          borderSide:
                                                              BorderSide.none,
                                                        ),
                                                        errorBorder:
                                                            OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      5.0),
                                                          borderSide:
                                                              BorderSide.none,
                                                        ),
                                                        disabledBorder:
                                                            OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      5.0),
                                                          borderSide:
                                                              BorderSide.none,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  IconButton(
                                                    icon: Icon(
                                                      Icons.refresh,
                                                      size: isIpad
                                                          ? screenWidth * 0.025
                                                          : (isIphone
                                                              ? screenWidth *
                                                                  0.02
                                                              : screenWidth *
                                                                  0.02),
                                                    ),
                                                    onPressed: () {},
                                                  ),
                                                  Text(
                                                    translationManager
                                                        .translate('txtRefresh')
                                                        .toUpperCase(),
                                                    style: TextStyle(
                                                      fontSize: isIpad
                                                          ? screenWidth * 0.012
                                                          : (isIphone
                                                              ? screenWidth *
                                                                  0.01
                                                              : screenWidth *
                                                                  0.01),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Expanded(
                                              child: ListView.builder(
                                                itemCount: 10,
                                                itemBuilder: (context, index) {
                                                  return Padding(
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                        vertical: 5.0,
                                                        horizontal: 50.0),
                                                    child: Row(
                                                      children: [
                                                        Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            shape:
                                                                BoxShape.circle,
                                                            border: Border.all(
                                                              color: Colors
                                                                  .black
                                                                  .withOpacity(
                                                                      0.1),
                                                              width: 3.0,
                                                            ),
                                                          ),
                                                          child: CircleAvatar(
                                                            radius: isIpad
                                                                ? screenWidth *
                                                                    0.03
                                                                : (isIphone
                                                                    ? screenWidth *
                                                                        0.02
                                                                    : screenWidth *
                                                                        0.02),
                                                            backgroundImage:
                                                                const AssetImage(
                                                                    'assets/menuIcons/blankAvatar_2.png'),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: isIpad
                                                              ? screenWidth *
                                                                  0.01
                                                              : (isIphone
                                                                  ? screenWidth *
                                                                      0.01
                                                                  : screenWidth *
                                                                      0.01),
                                                        ),
                                                        Expanded(
                                                          child: Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                'Player Name',
                                                                style:
                                                                    TextStyle(
                                                                  fontSize: isIpad
                                                                      ? screenWidth *
                                                                          0.015
                                                                      : (isIphone
                                                                          ? screenWidth *
                                                                              0.012
                                                                          : screenWidth *
                                                                              0.012),
                                                                  color: Colors
                                                                      .black,
                                                                ),
                                                              ),
                                                              Row(
                                                                children: [
                                                                  // SizedBox(width: screenWidth * 0.02),
                                                                  Padding(
                                                                    padding: const EdgeInsets
                                                                        .only(
                                                                        top: 5,
                                                                        bottom:
                                                                            5),
                                                                    child:
                                                                        Container(
                                                                      height: 2,
                                                                      width: screenWidth *
                                                                          0.14,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        gradient:
                                                                            LinearGradient(
                                                                          colors: [
                                                                            Colors.transparent,
                                                                            Colors.grey.withOpacity(0.3),
                                                                            Colors.transparent,
                                                                          ],
                                                                          stops: const [
                                                                            0.0,
                                                                            0.5,
                                                                            1.0
                                                                          ],
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
                                                          width: isIpad
                                                              ? screenWidth *
                                                                  0.012
                                                              : (isIphone
                                                                  ? screenWidth *
                                                                      0.012
                                                                  : screenWidth *
                                                                      0.012),
                                                        ),
                                                        SizedBox(
                                                          width: isIpad
                                                              ? screenWidth *
                                                                  0.12
                                                              : (isIphone
                                                                  ? screenWidth *
                                                                      0.1
                                                                  : screenWidth *
                                                                      0.1),
                                                          height: isIpad
                                                              ? screenHeight *
                                                                  0.05
                                                              : (isIphone
                                                                  ? screenHeight *
                                                                      0.07
                                                                  : screenWidth *
                                                                      screenHeight *
                                                                      0.07),
                                                          child: OutlinedButton(
                                                            onPressed: () {},
                                                            style:
                                                                OutlinedButton
                                                                    .styleFrom(
                                                              padding:
                                                                  EdgeInsets
                                                                      .zero,
                                                              side: const BorderSide(
                                                                  color: Colors
                                                                      .black),
                                                              shape:
                                                                  RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            5.0),
                                                              ),
                                                              backgroundColor:
                                                                  const Color
                                                                      .fromRGBO(
                                                                      240,
                                                                      240,
                                                                      240,
                                                                      1),
                                                            ),
                                                            child: Text(
                                                              translationManager
                                                                  .translate(
                                                                      'txtInvite')
                                                                  .toUpperCase(),
                                                              style: TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontSize: isIpad
                                                                    ? screenWidth *
                                                                        0.015
                                                                    : (isIphone
                                                                        ? screenWidth *
                                                                            0.012
                                                                        : screenWidth *
                                                                            0.012),
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
      ],
    );
  }
}
