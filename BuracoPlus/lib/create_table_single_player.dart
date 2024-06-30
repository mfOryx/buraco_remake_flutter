import 'dart:io';
import 'package:buracoplus/home.dart';
import 'package:buracoplus/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:buracoplus/gameplay_single_player.dart';
import 'package:provider/provider.dart';
import 'package:buracoplus/common/translation_manager.dart';

class CreateTableSP extends StatefulWidget {
  const CreateTableSP({super.key});

  @override
  State<CreateTableSP> createState() => _CreateTableSPState();
}

class _CreateTableSPState extends State<CreateTableSP> {
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
  bool difficultyEasy = true;
  bool difficultyNormal = false;

  bool isIOS() {
    return Platform.isIOS;
  }

  bool isAndroid() {
    return Platform.isAndroid;
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
      case "difficultyEasy":
        setState(() {
          difficultyEasy = true;
          difficultyNormal = false;
        });
        return;
      case "difficultyNormal":
        setState(() {
          difficultyNormal = true;
          difficultyEasy = false;
        });
        return;
      default:
        return;
    }
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final colors = themeProvider.currentColors;
    final translationManager = Provider.of<TranslationManager>(context);
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                gradient: colors.gradient,
              ),
            ),
            Positioned(
              top: screenHeight * 0.022,
              right: screenWidth * 0.075,
              child: Container(
                width: screenWidth * 0.122,
                height: screenHeight * 0.105,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                ),
              ),
            ),
            Center(
                child: Column(
              children: [
                Image.asset(
                  'assets/logo-and-cards.png',
                  width: isIOS() ? screenWidth * 0.1 : screenWidth * 0.08,
                  height: isIOS() ? screenHeight * 0.11 : screenHeight * 0.075,
                ),
              ],
            )),
            Positioned.fill(
              child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                    Container(
                      width: isIOS() ? screenWidth * 0.5 : screenWidth * 0.53,
                      height: isIOS() ? screenHeight * 0.8 : screenHeight * 0.87,
                      decoration: BoxDecoration(
                        color:
                            const Color.fromRGBO(255, 255, 255, 20), // Box color
                        borderRadius:
                            BorderRadius.circular(10.0), // Rounded corners
                      ),
                      child: Column(
                        children: [
                        Text(
                            translationManager.translate('txtGameOptions'),
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: screenWidth * 0.016,
                                fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: screenHeight * 0.015),
                        Row(
                          children: [
                            SizedBox(width: screenWidth * 0.022),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16.0, vertical: 0.0),
                              decoration: BoxDecoration(
                                color: Colors.blueAccent.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              child: Row(
                                children: [
                                  Text(
                                    translationManager.translate('txtBuracoRule'),
                                    style: TextStyle(
                                        color: Colors.black, fontSize: screenWidth * 0.015),
                                  ),
                                  SizedBox(width: screenWidth * 0.019),
                                  ElevatedButtonTheme(
                                    data: ElevatedButtonThemeData(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.transparent,
                                        padding: EdgeInsets.zero,
                                        elevation: 0.0,
                                      ),
                                    ),
                                    child: ElevatedButton(
                                      style: ButtonStyle(
                                        fixedSize: WidgetStateProperty.all(
                                            Size(screenWidth * 0.150, screenHeight * 0.04)),
                                      ),
                                      onPressed: () {},
                                      child: Ink.image(
                                        image: classicToggle
                                            ? const AssetImage(
                                                'assets/buttons/button_23_curved.png')
                                            : const AssetImage(
                                                'assets/buttons/button_22_curved.png'),
                                        fit: BoxFit.fill,
                                        child: InkWell(
                                          onTap: () {
                                            toggleSelection("classicToggle");
                                          },
                                          child: Center(
                                            child: Text(
                                              translationManager.translate('txtItalian'),
                                              style: TextStyle(
                                                color: classicToggle
                                                    ? Colors.white
                                                    : Colors.black87,
                                                fontSize: screenWidth * 0.015,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: screenWidth * 0.022),
                                  ElevatedButtonTheme(
                                    data: ElevatedButtonThemeData(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.transparent,
                                        padding: EdgeInsets.zero,
                                        elevation: 0.0,
                                      ),
                                    ),
                                    child: ElevatedButton(
                                      style: ButtonStyle(
                                        fixedSize: WidgetStateProperty.all(
                                            Size(screenWidth * 0.150, screenHeight * 0.04)),
                                      ),
                                      onPressed: () {},
                                      child: Ink.image(
                                        image: professionalToggle
                                            ? const AssetImage(
                                                'assets/buttons/button_23_curved.png')
                                            : const AssetImage(
                                                'assets/buttons/button_22_curved.png'),
                                        fit: BoxFit.fill,
                                        child: InkWell(
                                          onTap: () {
                                            toggleSelection("professionalToggle");
                                          },
                                          child: Center(
                                            child: Text(
                                              translationManager.translate('txtProfessional'),
                                              style: TextStyle(
                                                color: professionalToggle
                                                    ? Colors.white
                                                    : Colors.black87,
                                                fontSize: screenWidth * 0.015,
                                              ),
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
                        SizedBox(height: professionalToggle ? screenHeight * 0.012 : screenHeight * 0.05),
                        Row(
                          children: [
                            SizedBox(width: screenWidth * 0.022),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16.0, vertical: 0.0),
                              decoration: BoxDecoration(
                                color: Colors.blueAccent.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              child: Row(
                                children: [
                                  Text(
                                    translationManager.translate('txtPlayers'),
                                    style: TextStyle(
                                        color: Colors.black, fontSize: screenWidth * 0.015),
                                  ),
                                  SizedBox(width: screenWidth * 0.049),
                                  ElevatedButtonTheme(
                                    data: ElevatedButtonThemeData(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.transparent,
                                        padding: EdgeInsets.zero,
                                        elevation: 0.0,
                                      ),
                                    ),
                                    child: ElevatedButton(
                                      style: ButtonStyle(
                                        fixedSize: WidgetStateProperty.all(
                                            Size(screenWidth * 0.150, screenHeight * 0.04)),
                                      ),
                                      onPressed: () {},
                                      child: Ink.image(
                                        image: twoPlayersToggle
                                            ? const AssetImage(
                                                'assets/buttons/button_23_curved.png')
                                            : const AssetImage(
                                                'assets/buttons/button_22_curved.png'),
                                        fit: BoxFit.fill,
                                        child: InkWell(
                                          onTap: () {
                                            toggleSelection("twoPlayersToggle");
                                          },
                                          child: Center(
                                            child: Text(
                                              translationManager.translate('txt2Players'),
                                              style: TextStyle(
                                                color: twoPlayersToggle
                                                    ? Colors.white
                                                    : Colors.black87,
                                                fontSize: screenWidth * 0.015,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: screenWidth * 0.022),
                                  ElevatedButtonTheme(
                                    data: ElevatedButtonThemeData(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.transparent,
                                        padding: EdgeInsets.zero,
                                        elevation: 0.0,
                                      ),
                                    ),
                                    child: ElevatedButton(
                                      style: ButtonStyle(
                                        fixedSize: WidgetStateProperty.all(
                                            Size(screenWidth * 0.150, screenHeight * 0.04)),
                                      ),
                                      onPressed: () {},
                                      child: Ink.image(
                                        image: fourPlayersToggle
                                            ? const AssetImage(
                                                'assets/buttons/button_23_curved.png')
                                            : const AssetImage(
                                                'assets/buttons/button_22_curved.png'),
                                        fit: BoxFit.fill,
                                        child: InkWell(
                                          onTap: () {
                                            toggleSelection("fourPlayersToggle");
                                          },
                                          child: Center(
                                            child: Text(
                                              translationManager.translate('txt4Players'),
                                              style: TextStyle(
                                                color: fourPlayersToggle
                                                    ? Colors.white
                                                    : Colors.black87,
                                                fontSize: screenWidth * 0.015,
                                              ),
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
                        Visibility(
                            visible: professionalToggle,
                            child: Column(
                              children: [
                                SizedBox(height: professionalToggle ? screenHeight * 0.012 : screenHeight * 0.05),
                                Row(
                                  children: [
                                    SizedBox(width: screenHeight * 0.05),
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 16.0, vertical: 0.0),
                                      decoration: BoxDecoration(
                                        color:
                                            Colors.blueAccent.withOpacity(0.1),
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                      ),
                                      child: Row(
                                        children: [
                                          Text(
                                            translationManager.translate('txtMode'),
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: screenWidth * 0.015),
                                          ),
                                          SizedBox(width: screenWidth * 0.06),
                                          ElevatedButtonTheme(
                                            data: ElevatedButtonThemeData(
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor:
                                                    Colors.transparent,
                                                padding: EdgeInsets.zero,
                                                elevation: 0.0,
                                              ),
                                            ),
                                            child: ElevatedButton(
                                              style: ButtonStyle(
                                                fixedSize:
                                                    WidgetStateProperty.all(
                                                        Size(screenWidth * 0.085, screenHeight * 0.05)),
                                              ),
                                              onPressed: () {},
                                              child: Ink.image(
                                                image: directToggle
                                                    ? const AssetImage(
                                                        'assets/buttons/button_23_curved.png')
                                                    : const AssetImage(
                                                        'assets/buttons/button_22_curved.png'),
                                                fit: BoxFit.fill,
                                                child: InkWell(
                                                  onTap: () {
                                                    toggleSelection("directToggle");
                                                  },
                                                  child: Center(
                                                    child: Text(
                                                      translationManager.translate('txtDirect'),
                                                      style: TextStyle(
                                                        color: directToggle
                                                            ? Colors.white
                                                            : Colors.black87,
                                                        fontSize: screenWidth * 0.015,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(width: screenWidth * 0.022),
                                          ElevatedButtonTheme(
                                            data: ElevatedButtonThemeData(
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor:
                                                    Colors.transparent,
                                                padding: EdgeInsets.zero,
                                                elevation: 0.0,
                                              ),
                                            ),
                                            child: ElevatedButton(
                                              style: ButtonStyle(
                                                fixedSize:
                                                    WidgetStateProperty.all(
                                                        Size(screenWidth * 0.085, screenHeight * 0.05)),
                                              ),
                                              onPressed: () {},
                                              child: Ink.image(
                                                image: indirectToggle
                                                    ? const AssetImage(
                                                        'assets/buttons/button_23_curved.png')
                                                    : const AssetImage(
                                                        'assets/buttons/button_22_curved.png'),
                                                fit: BoxFit.fill,
                                                child: InkWell(
                                                  onTap: () {
                                                    toggleSelection("indirectToggle");
                                                  },
                                                  child: Center(
                                                    child: Text(
                                                      translationManager.translate('txtIndirect'),
                                                      style: TextStyle(
                                                        color: indirectToggle
                                                            ? Colors.white
                                                            : Colors.black87,
                                                        fontSize: screenWidth * 0.015,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(width: screenWidth * 0.014),
                                          ElevatedButtonTheme(
                                            data: ElevatedButtonThemeData(
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor:
                                                    Colors.transparent,
                                                padding: EdgeInsets.zero,
                                                elevation: 0.0,
                                              ),
                                            ),
                                            child: Row(
                                              children: [
                                                Text(
                                                  translationManager.translate('txtMakart'),
                                                  style: TextStyle(
                                                    color: Colors.black87,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: screenWidth * 0.015,
                                                  ),
                                                ),
                                                ElevatedButton(
                                                  onPressed: () {},
                                                  child: Stack(
                                                    children: [
                                                      Ink.image(
                                                        image: const AssetImage(
                                                            'assets/buttons/button_22_curved.png'),
                                                        fit: BoxFit.fill,
                                                        width: screenWidth * 0.034,
                                                        height: screenHeight * 0.07,
                                                        child: InkWell(
                                                          onTap: () {
                                                            toggleSelection("makartCheckbox");
                                                          },
                                                        ),
                                                      ),
                                                      Positioned(
                                                        top: screenHeight * 0.01,
                                                        right: screenWidth * 0.003,
                                                        left: screenWidth * 0.003,
                                                        child: Ink.image(
                                                          image: makartCheckbox
                                                              ? const AssetImage(
                                                                  'assets/ic_check_gradiant2.png')
                                                              : const AssetImage(
                                                                  'assets/buttons/white_empty.png'),
                                                          width: screenWidth * 0.034,
                                                          height: screenHeight * 0.05,
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
                              ],
                            )),
                          SizedBox(height: professionalToggle ? screenHeight * 0.012 : screenHeight * 0.05),
                        Row(
                          children: [
                            SizedBox(width: screenWidth * 0.022),
                            Container(
                              width: isIOS() ? screenWidth * 0.4532 : screenWidth * 0.495,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16.0, vertical: 0.0),
                              decoration: BoxDecoration(
                                color: Colors.blueAccent.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              child: Row(
                                children: [
                                  Text(
                                    translationManager.translate('txtPoints'),
                                    style: TextStyle(
                                        color: Colors.black, fontSize: screenWidth * 0.015),
                                  ),
                                  SizedBox(width: screenWidth * 0.057),
                                  ElevatedButtonTheme(
                                    data: ElevatedButtonThemeData(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.transparent,
                                        padding: EdgeInsets.zero,
                                        elevation: 0.0,
                                      ),
                                    ),
                                    child: ElevatedButton(
                                      style: ButtonStyle(
                                        fixedSize: WidgetStateProperty.all(
                                            Size(screenWidth * 0.07, screenHeight * 0.05)),
                                      ),
                                      onPressed: () {},
                                      child: Ink.image(
                                        image: pointsOne
                                            ? const AssetImage(
                                                'assets/buttons/button_23_curved.png')
                                            : const AssetImage(
                                                'assets/buttons/button_22_curved.png'),
                                        fit: BoxFit.fill,
                                        child: InkWell(
                                          onTap: () {
                                            toggleSelection("pointsOne");
                                          },
                                          child: Center(
                                            child: Text(
                                              translationManager.translate('txtOneHand'),
                                              style: TextStyle(
                                                color: pointsOne
                                                    ? Colors.white
                                                    : Colors.black87,
                                                fontSize: screenWidth * 0.013,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: isIOS() ? screenWidth * 0.012 : screenWidth * 0.0),
                                  ElevatedButtonTheme(
                                    data: ElevatedButtonThemeData(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.transparent,
                                        padding: EdgeInsets.zero,
                                        elevation: 0.0,
                                      ),
                                    ),
                                    child: ElevatedButton(
                                      style: ButtonStyle(
                                        fixedSize: WidgetStateProperty.all(
                                            Size(screenWidth * 0.07, screenHeight * 0.05)),
                                      ),
                                      onPressed: () {},
                                      child: Ink.image(
                                        image: pointsTwo
                                            ? const AssetImage(
                                                'assets/buttons/button_23_curved.png')
                                            : const AssetImage(
                                                'assets/buttons/button_22_curved.png'),
                                        fit: BoxFit.fill,
                                        child: InkWell(
                                          onTap: () {
                                            toggleSelection("pointsTwo");
                                          },
                                          child: Center(
                                            child: Text(
                                              classicToggle ? translationManager.translate('txtPoints1005') : translationManager.translate('txtPoints1505'),
                                              style: TextStyle(
                                                color: pointsTwo
                                                    ? Colors.white
                                                    : Colors.black87,
                                                fontSize: screenWidth * 0.015,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: isIOS() ? screenWidth * 0.012 : screenWidth * 0.0),
                                  ElevatedButtonTheme(
                                    data: ElevatedButtonThemeData(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.transparent,
                                        padding: EdgeInsets.zero,
                                        elevation: 0.0,
                                      ),
                                    ),
                                    child: ElevatedButton(
                                      style: ButtonStyle(
                                        fixedSize: WidgetStateProperty.all(
                                            Size(screenWidth * 0.07, screenHeight * 0.05)),
                                      ),
                                      onPressed: () {},
                                      child: Ink.image(
                                        image: pointsThree
                                            ? const AssetImage(
                                                'assets/buttons/button_23_curved.png')
                                            : const AssetImage(
                                                'assets/buttons/button_22_curved.png'),
                                        fit: BoxFit.fill,
                                        child: InkWell(
                                          onTap: () {
                                            toggleSelection("pointsThree");
                                          },
                                          child: Center(
                                            child: Text(
                                              classicToggle ? translationManager.translate('txtPoints1505') : translationManager.translate('txtPoints2000'),
                                              style: TextStyle(
                                                color: pointsThree
                                                    ? Colors.white
                                                    : Colors.black87,
                                                fontSize: screenWidth * 0.015,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: isIOS() ? screenWidth * 0.012 : screenWidth * 0.0),
                                  Visibility(
                                    visible: classicToggle,
                                    child: ElevatedButtonTheme(
                                      data: ElevatedButtonThemeData(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.transparent,
                                          padding: EdgeInsets.zero,
                                          elevation: 0.0,
                                        ),
                                      ),
                                      child: ElevatedButton(
                                        style: ButtonStyle(
                                          fixedSize: WidgetStateProperty.all(
                                              Size(screenWidth * 0.07, screenHeight * 0.05)),
                                        ),
                                        onPressed: () {
                                          // Your onPressed logic here
                                        },
                                        child: Ink.image(
                                          image: pointsFour
                                              ? const AssetImage(
                                                  'assets/buttons/button_23_curved.png')
                                              : const AssetImage(
                                                  'assets/buttons/button_22_curved.png'),
                                          fit: BoxFit.fill,
                                          width: double
                                              .infinity, // Make the image fill the button
                                          height: double
                                              .infinity, // Make the image fill the button
                                          child: InkWell(
                                            onTap: () {
                                              toggleSelection("pointsFour");
                                            },
                                            child: Center(
                                              child: Text(
                                                translationManager.translate('txtPoints2005'),
                                                style: TextStyle(
                                                  color: pointsFour
                                                      ? Colors.white
                                                      : Colors.black87,
                                                  fontSize: screenWidth * 0.015,
                                                ),
                                              ),
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
                          SizedBox(height: professionalToggle ? screenHeight * 0.012 : screenHeight * 0.05),
                        Row(
                          children: [
                            SizedBox(width: screenWidth * 0.022),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16.0, vertical: 0.0),
                              decoration: BoxDecoration(
                                color: Colors.blueAccent.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              child: Row(
                                children: [
                                  Text(
                                    translationManager.translate('txtDifficulty'),
                                    style: TextStyle(
                                        color: Colors.black, fontSize: screenWidth * 0.015),
                                  ),
                                  SizedBox(width: screenWidth * 0.038),
                                  ElevatedButtonTheme(
                                    data: ElevatedButtonThemeData(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.transparent,
                                        padding: EdgeInsets.zero,
                                        elevation: 0.0,
                                      ),
                                    ),
                                    child: ElevatedButton(
                                      style: ButtonStyle(
                                        fixedSize: WidgetStateProperty.all(
                                            Size(screenWidth * 0.150, screenHeight * 0.04)),
                                      ),
                                      onPressed: () {},
                                      child: Ink.image(
                                        image: difficultyEasy
                                            ? const AssetImage(
                                                'assets/buttons/button_23_curved.png')
                                            : const AssetImage(
                                                'assets/buttons/button_22_curved.png'),
                                        fit: BoxFit.fill,
                                        child: InkWell(
                                          onTap: () {
                                            toggleSelection("difficultyEasy");
                                          },
                                          child: Center(
                                            child: Text(
                                              translationManager.translate('txtEasy'),
                                              style: TextStyle(
                                                color: difficultyEasy
                                                    ? Colors.white
                                                    : Colors.black87,
                                                fontSize: screenWidth * 0.015,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: screenWidth * 0.022),
                                  ElevatedButtonTheme(
                                    data: ElevatedButtonThemeData(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.transparent,
                                        padding: EdgeInsets.zero,
                                        elevation: 0.0,
                                      ),
                                    ),
                                    child: ElevatedButton(
                                      style: ButtonStyle(
                                        fixedSize: WidgetStateProperty.all(
                                            Size(screenWidth * 0.150, screenHeight * 0.04)),
                                      ),
                                      onPressed: () {},
                                      child: Ink.image(
                                        image: difficultyNormal
                                            ? const AssetImage(
                                                'assets/buttons/button_23_curved.png')
                                            : const AssetImage(
                                                'assets/buttons/button_22_curved.png'),
                                        fit: BoxFit.fill,
                                        child: InkWell(
                                          onTap: () {
                                            toggleSelection("difficultyNormal");
                                          },
                                          child: Center(
                                            child: Text(
                                              translationManager.translate('txtNormal'),
                                              style: TextStyle(
                                                color: difficultyNormal
                                                    ? Colors.white
                                                    : Colors.black87,
                                                fontSize: screenWidth * 0.015,
                                              ),
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
                          SizedBox(height: screenHeight * 0.01),
                        ElevatedButtonTheme(
                          data: ElevatedButtonThemeData(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              padding: EdgeInsets.zero,
                              elevation: 0.0,
                            ),
                          ),
                          child: ElevatedButton(
                            style: ButtonStyle(
                              fixedSize: WidgetStateProperty.all(
                                  Size(screenWidth * 0.16, screenHeight * 0.04)),
                            ),
                            onPressed: () {},
                            child: Ink.image(
                              image: const AssetImage(
                                  'assets/buttons/square_curved_2.png'),
                              fit: BoxFit.fill,
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const GameplaySP()));
                                },
                                child: Center(
                                  child: Text(
                                    translationManager.translate('txtPlayGame'),
                                    style: TextStyle(
                                      color: Colors.black87,
                                      fontWeight: FontWeight.bold,
                                      fontSize: screenWidth * 0.015,
                                    ),
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
              )),
            ),
          ],
        ),
      ),
      floatingActionButton: Stack(
        children: [
          Positioned(
            width: screenWidth * 0.08,
            bottom: screenHeight * 0.001,
            left: isIOS() ? screenWidth * 0.1 : screenWidth * 0.05,
            child: FloatingActionButton(
              heroTag: null,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                      const Home()),
                );
              },
              backgroundColor: Colors.transparent,
              splashColor: Colors.transparent,
              elevation: 0.0,
              child: Row(children: [
                Transform.rotate(
                  angle: 1.6,
                  child: Image.asset(
                    'assets/simple_arrow_down.png',
                    width: screenWidth * 0.03,
                    height: screenHeight * 0.07,
                  ),
                ),
                Text(translationManager.translate('txtBack').toUpperCase(), style: const TextStyle(color: Colors.white)),
              ]),
            ),
          ),
          Positioned(
            width: screenWidth * 0.055,
            height: screenHeight * 0.115,
            top: isIOS() ? screenHeight * 0.115 : screenHeight * 0.068,
            right: isIOS() ? screenWidth * 0.058 : screenWidth * 0.12,
            child: FloatingActionButton(
              heroTag: null,
              onPressed: () {
                //exit(0);
              },
              backgroundColor: Colors.transparent,
              splashColor: Colors.transparent,
              elevation: 0.0,
              child: Column(children: [
                Image.asset(
                  'assets/menuIcons/ic_settings.png',
                  width: screenWidth * 0.04,
                  height: screenHeight * 0.06,
                ),
                Text(translationManager.translate('txtOptions').toUpperCase(),
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: screenWidth * 0.011,
                        fontWeight: FontWeight.bold
                    )
                ),
              ]),
            ),
          ),
          Positioned(
            width: screenWidth * 0.055,
            height: screenHeight * 0.115,
            top: isIOS() ? screenHeight * 0.115 : screenHeight * 0.068,
            right: isIOS() ? screenWidth * 0.0 : screenWidth * 0.06,
            child: FloatingActionButton(
              heroTag: null,
              onPressed: () {
                //exit(0);
              },
              backgroundColor: Colors.transparent,
              splashColor: Colors.transparent,
              elevation: 0.0,
              child: Column(
                children: [
                  Image.asset(
                    'assets/menuIcons/ic_rankings.png',
                    width: screenWidth * 0.04,
                    height: screenHeight * 0.06,
                  ),
                  Text(translationManager.translate('txtRankings').toUpperCase(),
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: screenWidth * 0.011,
                          fontWeight: FontWeight.bold
                      )
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
