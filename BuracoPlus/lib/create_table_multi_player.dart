import 'dart:io';
import 'package:buracoplus/providers/create_table_provider.dart';
import 'package:buracoplus/providers/dialog_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:buracoplus/common/translation_manager.dart';
import 'package:device_info_plus/device_info_plus.dart';

class CreateTableMP extends StatefulWidget {
  const CreateTableMP({super.key});

  @override
  State<CreateTableMP> createState() => _CreateTableMPState();
}

class _CreateTableMPState extends State<CreateTableMP> {
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
    'assets/tablesImages/table_blue.png',
    'assets/tablesImages/shop_table_champagne.png',
    'assets/tablesImages/shop_table_emerald.png',
    'assets/tablesImages/shop_table_green.png',
    'assets/tablesImages/shop_table_maroon.png',
    'assets/tablesImages/shop_table_mars.png',
    'assets/tablesImages/shop_table_navy.png',
    'assets/tablesImages/shop_table_petrol.png',
    'assets/tablesImages/shop_table_red_risess.png',
    'assets/tablesImages/shop_table_teal.png',
    'assets/tablesImages/shop_table_black.png',
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

  @override
  Widget build(BuildContext context) {
    final createTableManager = Provider.of<CreateTableProvider>(context);
    final translationManager = Provider.of<TranslationManager>(context);
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    checkDeviceType();

    return Stack(
      children: [
        Consumer<DialogProvider>(
          builder: (context, dialogProvider, child) {
            return dialogProvider.isCreateTableDialogVisible ?
            Stack(
              children: [
                Positioned.fill(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        dialogProvider.hideCreateTableDialog();
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
                                            dialogProvider.hideCreateTableDialog();
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
                                                        createTableManager.getClassicToggle
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
                                                      createTableManager.toggleSelection("classicToggle");
                                                    },
                                                    child: Center(
                                                      child: Text(
                                                        translationManager
                                                            .translate(
                                                            'txtItalian'),
                                                        style: TextStyle(
                                                          color: createTableManager.getClassicToggle
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
                                                        createTableManager.getProfessionalToggle
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
                                                      createTableManager.toggleSelection(
                                                          "professionalToggle");
                                                    },
                                                    child: Center(
                                                      child: Text(
                                                        translationManager
                                                            .translate(
                                                            'txtProfessional'),
                                                        style: TextStyle(
                                                          color:
                                                          createTableManager.getProfessionalToggle
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
                                            ? (createTableManager.getProfessionalToggle
                                            ? screenHeight * 0.01
                                            : screenHeight * 0.02)
                                            : (isIphone
                                            ? (createTableManager.getProfessionalToggle
                                            ? screenHeight * 0.008
                                            : screenHeight * 0.02)
                                            : (createTableManager.getProfessionalToggle
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
                                                        createTableManager.getTwoPlayersToggle
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
                                                      createTableManager.toggleSelection(
                                                          "twoPlayersToggle");
                                                    },
                                                    child: Center(
                                                      child: Text(
                                                        translationManager
                                                            .translate(
                                                            'txt2Players'),
                                                        style: TextStyle(
                                                          color:
                                                          createTableManager.getTwoPlayersToggle
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
                                                        createTableManager.getFourPlayersToggle
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
                                                      createTableManager.toggleSelection(
                                                          "fourPlayersToggle");
                                                    },
                                                    child: Center(
                                                      child: Text(
                                                        translationManager
                                                            .translate(
                                                            'txt4Players'),
                                                        style: TextStyle(
                                                          color:
                                                          createTableManager.getFourPlayersToggle
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
                                            ? (createTableManager.getProfessionalToggle
                                            ? screenHeight * 0.01
                                            : screenHeight * 0.02)
                                            : (isIphone
                                            ? (createTableManager.getProfessionalToggle
                                            ? screenHeight * 0.008
                                            : screenHeight * 0.02)
                                            : (createTableManager.getProfessionalToggle
                                            ? screenHeight * 0.008
                                            : screenHeight * 0.02)),
                                      ),
                                      Visibility(
                                        visible: createTableManager.getProfessionalToggle,
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
                                                          createTableManager.getDirectToggle
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
                                                        createTableManager.toggleSelection(
                                                            "directToggle");
                                                      },
                                                      child: FittedBox(
                                                        fit: BoxFit.fitWidth,
                                                        child: Text(
                                                          translationManager
                                                              .translate(
                                                              'txtDirect'),
                                                          style: TextStyle(
                                                            color: createTableManager.getDirectToggle
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
                                                          createTableManager.getIndirectToggle
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
                                                        createTableManager.toggleSelection(
                                                            "indirectToggle");
                                                      },
                                                      child: FittedBox(
                                                        fit: BoxFit.fitWidth,
                                                        child: Text(
                                                          translationManager
                                                              .translate(
                                                              'txtIndirect'),
                                                          style: TextStyle(
                                                            color: createTableManager.getIndirectToggle
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
                                                                      image: createTableManager.getMakartCheckbox
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
                                                                              createTableManager.toggleSelection(
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
                                            ? (createTableManager.getProfessionalToggle
                                            ? screenHeight * 0.01
                                            : screenHeight * 0.0)
                                            : (isIphone
                                            ? (createTableManager.getProfessionalToggle
                                            ? screenHeight * 0.008
                                            : screenHeight * 0.00)
                                            : (createTableManager.getProfessionalToggle
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
                                                        createTableManager.getTurnTimeOne
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
                                                      createTableManager.toggleSelection(
                                                          "turnTimeOne");
                                                    },
                                                    child: Text(
                                                      translationManager
                                                          .translate('txtTurnTime15'),
                                                      style: TextStyle(
                                                        color: createTableManager.getTurnTimeOne
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
                                                        createTableManager.getTurnTimeTwo
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
                                                      createTableManager.toggleSelection(
                                                          "turnTimeTwo");
                                                    },
                                                    child: Center(
                                                      child: Text(
                                                        translationManager
                                                            .translate(
                                                            'txtTurnTime30'),
                                                        style: TextStyle(
                                                          color: createTableManager.getTurnTimeTwo
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
                                                        createTableManager.getTurnTimeThree
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
                                                      createTableManager.toggleSelection(
                                                          "turnTimeThree");
                                                    },
                                                    child: Center(
                                                      child: Text(
                                                        translationManager
                                                            .translate(
                                                            'txtTurnTime45'),
                                                        style: TextStyle(
                                                          color: createTableManager.getTurnTimeThree
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
                                                        createTableManager.getTurnTimeFour
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
                                                      createTableManager.toggleSelection(
                                                          "turnTimeFour");
                                                    },
                                                    child: Center(
                                                      child: Text(
                                                        translationManager
                                                            .translate(
                                                            'txtTurnTime60'),
                                                        style: TextStyle(
                                                          color: createTableManager.getTurnTimeFour
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
                                            ? (createTableManager.getProfessionalToggle
                                            ? screenHeight * 0.01
                                            : screenHeight * 0.02)
                                            : (isIphone
                                            ? (createTableManager.getProfessionalToggle
                                            ? screenHeight * 0.008
                                            : screenHeight * 0.02)
                                            : (createTableManager.getProfessionalToggle
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
                                                      ? (createTableManager.getProfessionalToggle ? screenWidth * 0.08 : screenWidth * 0.0564)
                                                      : (isIphone
                                                      ? (createTableManager.getProfessionalToggle ? screenWidth * 0.086 : screenWidth * 0.063)
                                                      : (createTableManager.getProfessionalToggle ? screenWidth * 0.086 : screenWidth * 0.063)
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
                                                      createTableManager.toggleSelection(
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
                                                      ? (createTableManager.getProfessionalToggle ? screenWidth * 0.08 : screenWidth * 0.0564)
                                                      : (isIphone
                                                      ? (createTableManager.getProfessionalToggle ? screenWidth * 0.086 : screenWidth * 0.063)
                                                      : (createTableManager.getProfessionalToggle ? screenWidth * 0.086 : screenWidth * 0.063)
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
                                                      createTableManager.toggleSelection(
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
                                                      ? (createTableManager.getProfessionalToggle ? screenWidth * 0.08 : screenWidth * 0.0564)
                                                      : (isIphone
                                                      ? (createTableManager.getProfessionalToggle ? screenWidth * 0.086 : screenWidth * 0.063)
                                                      : (createTableManager.getProfessionalToggle ? screenWidth * 0.086 : screenWidth * 0.063)
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
                                                      createTableManager.toggleSelection("pointsThree");
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
                                                        createTableManager.toggleSelection(
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
                                            ? (createTableManager.getProfessionalToggle
                                            ? screenHeight * 0.01
                                            : screenHeight * 0.02)
                                            : (isIphone
                                            ? (createTableManager.getProfessionalToggle
                                            ? screenHeight * 0.008
                                            : screenHeight * 0.02)
                                            : (createTableManager.getProfessionalToggle
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
                                                      ? (createTableManager.getProfessionalToggle ? screenWidth * 0.085 : screenWidth * 0.0564)
                                                      : (isIphone
                                                      ? (createTableManager.getProfessionalToggle ? screenWidth * 0.0635 : screenWidth * 0.0635)
                                                      : (createTableManager.getProfessionalToggle ? screenWidth * 0.0635 : screenWidth * 0.0635)
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
                                                      ? (createTableManager.getProfessionalToggle ? screenWidth * 0.08 : screenWidth * 0.0564)
                                                      : (isIphone
                                                      ? (createTableManager.getProfessionalToggle ? screenWidth * 0.0635 : screenWidth * 0.0635)
                                                      : (createTableManager.getProfessionalToggle ? screenWidth * 0.0635 : screenWidth * 0.0635)
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
                                            ? (createTableManager.getProfessionalToggle
                                            ? screenHeight * 0.01
                                            : screenHeight * 0.02)
                                            : (isIphone
                                            ? (createTableManager.getProfessionalToggle
                                            ? screenHeight * 0.008
                                            : screenHeight * 0.02)
                                            : (createTableManager.getProfessionalToggle
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
                                            ? (createTableManager.getProfessionalToggle
                                            ? screenHeight * 0.02
                                            : screenHeight * 0.03)
                                            : (isIphone
                                            ? (createTableManager.getProfessionalToggle
                                            ? screenHeight * 0.02
                                            : screenHeight * 0.03)
                                            : (createTableManager.getProfessionalToggle
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
                                                      dialogProvider.hideCreateTableDialog();
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
                                                  onPressed: () {
                                                    Provider.of<DialogProvider>(context, listen: false).showInviteFriendsDialog();
                                                  },
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
              ],
            )
            : const SizedBox.shrink();
          },
        ),
      ],
    );
  }
}
