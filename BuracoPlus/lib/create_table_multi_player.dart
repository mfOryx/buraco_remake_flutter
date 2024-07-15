import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:buracoplus/common/translation_manager.dart';

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

    return Stack(
      children: [
        Positioned.fill(
          child: Center(
              child: Stack(
                children: [
                  Container(
                    width: isIOS() ? screenWidth * 0.55 : screenWidth * 0.53,
                    height: isIOS() ? screenHeight * 0.95 : screenHeight * 0.87,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      gradient: const LinearGradient(
                        begin: AlignmentDirectional.topCenter,
                        end: AlignmentDirectional.bottomCenter,
                        colors: [
                          Color.fromRGBO(88, 104, 147, 1.0),
                          Color.fromRGBO(96, 132, 166, 1.0),
                          Color.fromRGBO(114, 60, 125, 1.0),
                          Color.fromRGBO(114, 60, 125, 1.0),
                        ],
                        stops: [
                          0.0,
                          0.33,
                          0.66,
                          1.0
                        ],
                      ),
                    ),
                    child: Column(
                      children: [
                        Text(
                          translationManager
                              .translate('txtCreateTable').toUpperCase(),
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: screenWidth * 0.018,
                          ),
                        ),
                        Container(
                          width: isIOS() ? screenWidth * 0.5 : screenWidth * 0.53,
                          height: isIOS() ? screenHeight * 0.85 : screenHeight * 0.87,
                          decoration: BoxDecoration(
                            color:
                            const Color.fromRGBO(255, 255, 255, 1), // Box color
                            borderRadius:
                            BorderRadius.circular(20.0),
                          ),
                          child: Column(
                            children: [
                              SizedBox(height: screenHeight * 0.001),
                              Row(
                                children: [
                                  SizedBox(width: screenWidth * 0.022),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16.0, vertical: 0.0),
                                    decoration: BoxDecoration(
                                      color: Colors.blueAccent.withOpacity(0.1),
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    child: Row(
                                      children: [
                                        Text(
                                          translationManager
                                              .translate('txtBuracoRule'),
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: screenWidth * 0.013,
                                          ),
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
                                                  Size(screenWidth * 0.150,
                                                      screenHeight * 0.04)),
                                            ),
                                            onPressed: () {},
                                            child: SizedBox(
                                              width: screenWidth * 0.13,
                                              height: screenHeight * 0.07,
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
                                                      translationManager
                                                          .translate('txtItalian'),
                                                      style: TextStyle(
                                                        color: classicToggle
                                                            ? Colors.white
                                                            : Colors.black87,
                                                        fontWeight: FontWeight.bold,
                                                        fontSize: screenWidth * 0.013,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
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
                                                  Size(screenWidth * 0.150,
                                                      screenHeight * 0.04)),
                                            ),
                                            onPressed: () {},
                                            child: SizedBox(
                                              width: screenWidth * 0.13,
                                              height: screenHeight * 0.07,
                                              child: Ink.image(
                                                image: professionalToggle
                                                    ? const AssetImage(
                                                    'assets/buttons/button_23_curved.png')
                                                    : const AssetImage(
                                                    'assets/buttons/button_22_curved.png'),
                                                fit: BoxFit.fill,
                                                child: InkWell(
                                                  onTap: () {
                                                    toggleSelection(
                                                        "professionalToggle");
                                                  },
                                                  child: Center(
                                                    child: Text(
                                                      translationManager
                                                          .translate('txtProfessional'),
                                                      style: TextStyle(
                                                        color: professionalToggle
                                                            ? Colors.white
                                                            : Colors.black87,
                                                        fontWeight: FontWeight.bold,
                                                        fontSize: screenWidth * 0.013,
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
                              SizedBox(
                                  height: professionalToggle
                                      ? screenHeight * 0.012
                                      : screenHeight * 0.05),
                              Row(
                                children: [
                                  SizedBox(width: screenWidth * 0.022),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16.0, vertical: 0.0),
                                    decoration: BoxDecoration(
                                      color: Colors.blueAccent.withOpacity(0.1),
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    child: Row(
                                      children: [
                                        Text(
                                          translationManager.translate('txtPlayers'),
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: screenWidth * 0.013),
                                        ),
                                        SizedBox(width: screenWidth * 0.045),
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
                                                  Size(screenWidth * 0.150,
                                                      screenHeight * 0.04)),
                                            ),
                                            onPressed: () {},
                                            child: SizedBox(
                                              width: screenWidth * 0.13,
                                              height: screenHeight * 0.07,
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
                                                      translationManager
                                                          .translate('txt2Players'),
                                                      style: TextStyle(
                                                        color: twoPlayersToggle
                                                            ? Colors.white
                                                            : Colors.black87,
                                                        fontWeight: FontWeight.bold,
                                                        fontSize: screenWidth * 0.013,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
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
                                                  Size(screenWidth * 0.150,
                                                      screenHeight * 0.04)),
                                            ),
                                            onPressed: () {},
                                            child: SizedBox(
                                              width: screenWidth * 0.13,
                                              height: screenHeight * 0.07,
                                              child: Ink.image(
                                                image: fourPlayersToggle
                                                    ? const AssetImage(
                                                    'assets/buttons/button_23_curved.png')
                                                    : const AssetImage(
                                                    'assets/buttons/button_22_curved.png'),
                                                fit: BoxFit.fill,
                                                child: InkWell(
                                                  onTap: () {
                                                    toggleSelection(
                                                        "fourPlayersToggle");
                                                  },
                                                  child: Center(
                                                    child: Text(
                                                      translationManager
                                                          .translate('txt4Players'),
                                                      style: TextStyle(
                                                        color: fourPlayersToggle
                                                            ? Colors.white
                                                            : Colors.black87,
                                                        fontWeight: FontWeight.bold,
                                                        fontSize: screenWidth * 0.013,
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
                              Visibility(
                                  visible: professionalToggle,
                                  child: Column(
                                    children: [
                                      SizedBox(
                                          height: professionalToggle
                                              ? screenHeight * 0.012
                                              : screenHeight * 0.05),
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
                                              BorderRadius.circular(10.0),
                                            ),
                                            child: Row(
                                              children: [
                                                Text(
                                                  translationManager
                                                      .translate('txtMode'),
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: screenWidth * 0.013),
                                                ),
                                                SizedBox(width: screenWidth * 0.065),
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
                                                          Size(
                                                              screenWidth * 0.085,
                                                              screenHeight *
                                                                  0.05)),
                                                    ),
                                                    onPressed: () {},
                                                    child: SizedBox(
                                                      width: screenWidth * 0.13,
                                                      height: screenHeight * 0.07,
                                                      child: Ink.image(
                                                        image: directToggle
                                                            ? const AssetImage(
                                                            'assets/buttons/button_23_curved.png')
                                                            : const AssetImage(
                                                            'assets/buttons/button_22_curved.png'),
                                                        fit: BoxFit.fill,
                                                        child: InkWell(
                                                          onTap: () {
                                                            toggleSelection(
                                                                "directToggle");
                                                          },
                                                          child: Center(
                                                            child: Text(
                                                              translationManager
                                                                  .translate(
                                                                  'txtDirect'),
                                                              style: TextStyle(
                                                                color: directToggle
                                                                    ? Colors.white
                                                                    : Colors.black87,
                                                                fontWeight: FontWeight.bold,
                                                                fontSize:
                                                                screenWidth * 0.013,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(width: screenWidth * 0.008),
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
                                                          Size(
                                                              screenWidth * 0.085,
                                                              screenHeight *
                                                                  0.05)),
                                                    ),
                                                    onPressed: () {},
                                                    child: SizedBox(
                                                      width: screenWidth * 0.13,
                                                      height: screenHeight * 0.07,
                                                      child: Ink.image(
                                                        image: indirectToggle
                                                            ? const AssetImage(
                                                            'assets/buttons/button_23_curved.png')
                                                            : const AssetImage(
                                                            'assets/buttons/button_22_curved.png'),
                                                        fit: BoxFit.fill,
                                                        child: InkWell(
                                                          onTap: () {
                                                            toggleSelection(
                                                                "indirectToggle");
                                                          },
                                                          child: Center(
                                                            child: Text(
                                                              translationManager
                                                                  .translate(
                                                                  'txtIndirect'),
                                                              style: TextStyle(
                                                                color: indirectToggle
                                                                    ? Colors.white
                                                                    : Colors.black87,
                                                                fontWeight: FontWeight.bold,
                                                                fontSize:
                                                                screenWidth * 0.013,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(width: screenWidth * 0.01),
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
                                                        translationManager
                                                            .translate('txtMakart'),
                                                        style: TextStyle(
                                                          color: Colors.black87,
                                                          fontWeight: FontWeight.bold,
                                                          fontSize:
                                                          screenWidth * 0.013,
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
                                                              width:
                                                              screenWidth * 0.025,
                                                              height:
                                                              screenHeight * 0.058,
                                                              child: InkWell(
                                                                onTap: () {
                                                                  toggleSelection(
                                                                      "makartCheckbox");
                                                                },
                                                              ),
                                                            ),
                                                            Positioned(
                                                              top:
                                                              screenHeight * 0.01,
                                                              right:
                                                              screenWidth * 0.003,
                                                              left:
                                                              screenWidth * 0.003,
                                                              child: Ink.image(
                                                                image: makartCheckbox
                                                                    ? const AssetImage(
                                                                    'assets/ic_check_gradiant2.png')
                                                                    : const AssetImage(
                                                                    'assets/buttons/white_empty.png'),
                                                                width: screenWidth *
                                                                    0.03,
                                                                height: screenHeight *
                                                                    0.04,
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
                              SizedBox(
                                  height: professionalToggle
                                      ? screenHeight * 0.012
                                      : screenHeight * 0.05),
                              Row(
                                children: [
                                  SizedBox(width: screenWidth * 0.022),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16.0, vertical: 0.0),
                                    decoration: BoxDecoration(
                                      color: Colors.blueAccent.withOpacity(0.1),
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    child: Row(
                                      children: [
                                        Text(
                                          translationManager
                                              .translate('txtTurnTime'),
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: screenWidth * 0.013),
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
                                                  Size(screenWidth * 0.05,
                                                      screenHeight * 0.04)),
                                            ),
                                            onPressed: () {},
                                            child: SizedBox(
                                              width: screenWidth * 0.06,
                                              height: screenHeight * 0.07,
                                              child: Ink.image(
                                                image: turnTimeOne
                                                    ? const AssetImage(
                                                    'assets/buttons/button_23_curved.png')
                                                    : const AssetImage(
                                                    'assets/buttons/button_22_curved.png'),
                                                fit: BoxFit.fill,
                                                child: InkWell(
                                                  onTap: () {
                                                    toggleSelection("turnTimeOne");
                                                  },
                                                  child: Center(
                                                    child: Text(
                                                      translationManager
                                                          .translate("txtTurnTime15"),
                                                      style: TextStyle(
                                                        color: turnTimeOne
                                                            ? Colors.white
                                                            : Colors.black87,
                                                        fontWeight: FontWeight.bold,
                                                        fontSize: screenWidth * 0.013,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: screenWidth * 0.0035),
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
                                                  Size(screenWidth * 0.05,
                                                      screenHeight * 0.04)),
                                            ),
                                            onPressed: () {},
                                            child: SizedBox(
                                              width: screenWidth * 0.06,
                                              height: screenHeight * 0.07,
                                              child: Ink.image(
                                                image: turnTimeTwo
                                                    ? const AssetImage(
                                                    'assets/buttons/button_23_curved.png')
                                                    : const AssetImage(
                                                    'assets/buttons/button_22_curved.png'),
                                                fit: BoxFit.fill,
                                                child: InkWell(
                                                  onTap: () {
                                                    toggleSelection("turnTimeTwo");
                                                  },
                                                  child: Center(
                                                    child: Text(
                                                      translationManager
                                                          .translate('txtTurnTime30'),
                                                      style: TextStyle(
                                                        color: turnTimeTwo
                                                            ? Colors.white
                                                            : Colors.black87,
                                                        fontWeight: FontWeight.bold,
                                                        fontSize: screenWidth * 0.013,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: screenWidth * 0.0035),
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
                                                  Size(screenWidth * 0.05,
                                                      screenHeight * 0.04)),
                                            ),
                                            onPressed: () {},
                                            child: SizedBox(
                                              width: screenWidth * 0.06,
                                              height: screenHeight * 0.07,
                                              child: Ink.image(
                                                image: turnTimeThree
                                                    ? const AssetImage(
                                                    'assets/buttons/button_23_curved.png')
                                                    : const AssetImage(
                                                    'assets/buttons/button_22_curved.png'),
                                                fit: BoxFit.fill,
                                                child: InkWell(
                                                  onTap: () {
                                                    toggleSelection("turnTimeThree");
                                                  },
                                                  child: Center(
                                                    child: Text(
                                                      translationManager
                                                          .translate('txtTurnTime45'),
                                                      style: TextStyle(
                                                        color: turnTimeThree
                                                            ? Colors.white
                                                            : Colors.black87,
                                                        fontWeight: FontWeight.bold,
                                                        fontSize: screenWidth * 0.013,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: screenWidth * 0.0035),
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
                                                  Size(screenWidth * 0.05,
                                                      screenHeight * 0.04)),
                                            ),
                                            onPressed: () {},
                                            child: SizedBox(
                                              width: screenWidth * 0.06,
                                              height: screenHeight * 0.07,
                                              child: Ink.image(
                                                image: turnTimeFour
                                                    ? const AssetImage(
                                                    'assets/buttons/button_23_curved.png')
                                                    : const AssetImage(
                                                    'assets/buttons/button_22_curved.png'),
                                                fit: BoxFit.fill,
                                                child: InkWell(
                                                  onTap: () {
                                                    toggleSelection("turnTimeFour");
                                                  },
                                                  child: Center(
                                                    child: Text(
                                                      translationManager
                                                          .translate('txtTurnTime60'),
                                                      style: TextStyle(
                                                        color: turnTimeFour
                                                            ? Colors.white
                                                            : Colors.black87,
                                                        fontWeight: FontWeight.bold,
                                                        fontSize: screenWidth * 0.013,
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
                              SizedBox(
                                  height: professionalToggle
                                      ? screenHeight * 0.012
                                      : screenHeight * 0.05),
                              Row(
                                children: [
                                  SizedBox(width: screenWidth * 0.022),
                                  Container(
                                    width: isIOS()
                                        ? screenWidth * 0.4532
                                        : screenWidth * 0.495,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16.0, vertical: 0.0),
                                    decoration: BoxDecoration(
                                      color: Colors.blueAccent.withOpacity(0.1),
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    child: Row(
                                      children: [
                                        Text(
                                          translationManager.translate('txtPoints'),
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: screenWidth * 0.013),
                                        ),
                                        SizedBox(width: screenWidth * 0.058),
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
                                                  Size(screenWidth * 0.07,
                                                      screenHeight * 0.05)),
                                            ),
                                            onPressed: () {},
                                            child: SizedBox(
                                              width: screenWidth * 0.06,
                                              height: screenHeight * 0.07,
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
                                                      translationManager
                                                          .translate('txtOneHand'),
                                                      style: TextStyle(
                                                        color: pointsOne
                                                            ? Colors.white
                                                            : Colors.black87,
                                                        fontWeight: FontWeight.bold,
                                                        fontSize: screenWidth * 0.011,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: screenWidth * 0.0022),
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
                                                  Size(screenWidth * 0.07,
                                                      screenHeight * 0.05)),
                                            ),
                                            onPressed: () {},
                                            child: SizedBox(
                                              width: screenWidth * 0.06,
                                              height: screenHeight * 0.07,
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
                                                        fontWeight: FontWeight.bold,
                                                        fontSize: screenWidth * 0.013,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: screenWidth * 0.0022),
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
                                                  Size(screenWidth * 0.07,
                                                      screenHeight * 0.05)),
                                            ),
                                            onPressed: () {},
                                            child: SizedBox(
                                              width: screenWidth * 0.06,
                                              height: screenHeight * 0.07,
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
                                                      classicToggle
                                                          ? translationManager
                                                          .translate(
                                                          'txtPoints1505')
                                                          : translationManager
                                                          .translate(
                                                          'txtPoints2000'),
                                                      style: TextStyle(
                                                        color: pointsThree
                                                            ? Colors.white
                                                            : Colors.black87,
                                                        fontWeight: FontWeight.bold,
                                                        fontSize: screenWidth * 0.013,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: screenWidth * 0.0022),
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
                                                    Size(screenWidth * 0.07,
                                                        screenHeight * 0.05)),
                                              ),
                                              onPressed: () {
                                                // Your onPressed logic here
                                              },
                                              child: SizedBox(
                                                width: screenWidth * 0.06,
                                                height: screenHeight * 0.07,
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
                                                        translationManager
                                                            .translate('txtPoints2005'),
                                                        style: TextStyle(
                                                          color: pointsFour
                                                              ? Colors.white
                                                              : Colors.black87,
                                                          fontWeight: FontWeight.bold,
                                                          fontSize: screenWidth * 0.013,
                                                        ),
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
                              SizedBox(
                                  height: professionalToggle
                                      ? screenHeight * 0.012
                                      : screenHeight * 0.05),
                              Row(
                                children: [
                                  SizedBox(width: screenWidth * 0.022),
                                  Container(
                                    width: isIOS()
                                        ? screenWidth * 0.4532
                                        : screenWidth * 0.495,
                                    height: screenHeight * 0.09,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16.0, vertical: 0.0),
                                    decoration: BoxDecoration(
                                      color: Colors.blueAccent.withOpacity(0.1),
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    child: Row(
                                      children: [
                                        Text(
                                          translationManager.translate('txtPoints'),
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: screenWidth * 0.013),
                                        ),
                                        SizedBox(width: screenWidth * 0.058),
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
                                                  Size(screenWidth * 0.07,
                                                      screenHeight * 0.05)),
                                            ),
                                            onPressed: () {},
                                            child: SizedBox(
                                              width: screenWidth * 0.06,
                                              height: screenHeight * 0.07,
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
                                                      translationManager
                                                          .translate('txtOneHand'),
                                                      style: TextStyle(
                                                        color: pointsOne
                                                            ? Colors.white
                                                            : Colors.black87,
                                                        fontWeight: FontWeight.bold,
                                                        fontSize: screenWidth * 0.011,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: screenWidth * 0.0022),
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
                                                  Size(screenWidth * 0.07,
                                                      screenHeight * 0.05)),
                                            ),
                                            onPressed: () {},
                                            child: SizedBox(
                                              width: screenWidth * 0.06,
                                              height: screenHeight * 0.07,
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
                                                        fontWeight: FontWeight.bold,
                                                        fontSize: screenWidth * 0.013,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: screenWidth * 0.0022),
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
                                                  Size(screenWidth * 0.07,
                                                      screenHeight * 0.05)),
                                            ),
                                            onPressed: () {},
                                            child: SizedBox(
                                              width: screenWidth * 0.06,
                                              height: screenHeight * 0.07,
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
                                                      classicToggle
                                                          ? translationManager
                                                          .translate(
                                                          'txtPoints1505')
                                                          : translationManager
                                                          .translate(
                                                          'txtPoints2000'),
                                                      style: TextStyle(
                                                        color: pointsThree
                                                            ? Colors.white
                                                            : Colors.black87,
                                                        fontWeight: FontWeight.bold,
                                                        fontSize: screenWidth * 0.013,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: screenWidth * 0.0022),
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
                                                    Size(screenWidth * 0.07,
                                                        screenHeight * 0.05)),
                                              ),
                                              onPressed: () {
                                                // Your onPressed logic here
                                              },
                                              child: SizedBox(
                                                width: screenWidth * 0.06,
                                                height: screenHeight * 0.07,
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
                                                        translationManager
                                                            .translate('txtPoints2005'),
                                                        style: TextStyle(
                                                          color: pointsFour
                                                              ? Colors.white
                                                              : Colors.black87,
                                                          fontWeight: FontWeight.bold,
                                                          fontSize: screenWidth * 0.013,
                                                        ),
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
                              SizedBox(height: screenHeight * 0.01),
                              Row(
                                children: [
                                  SizedBox(width: screenWidth * 0.01),
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
                                        fixedSize: WidgetStateProperty.all(Size(
                                            screenWidth * 0.16, screenHeight * 0.04)),
                                      ),
                                      onPressed: () {},
                                      child: Ink.image(
                                        image: const AssetImage(
                                            'assets/buttons/button_22_curved.png'),
                                        fit: BoxFit.fill,
                                        child: InkWell(
                                          onTap: () {
                                            // Navigator.push(
                                            //     context,
                                            //     MaterialPageRoute(
                                            //         builder: (context) =>
                                            //         const GameplaySP()));
                                          },
                                          child: Center(
                                            child: Text(
                                              translationManager.translate('txtCancel').toUpperCase(),
                                              style: TextStyle(
                                                color: Colors.black87,
                                                fontSize: screenWidth * 0.011,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  ElevatedButtonTheme(
                                    data: ElevatedButtonThemeData(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.transparent,
                                        padding: EdgeInsets.zero,
                                        elevation: 1,
                                      ),
                                    ),
                                    child: ElevatedButton(
                                      style: ButtonStyle(
                                        fixedSize: WidgetStateProperty.all(Size(
                                            screenWidth * 0.16, screenHeight * 0.04)),
                                      ),
                                      onPressed: () {},
                                      child: Ink.image(
                                        image: const AssetImage(
                                            'assets/buttons/square_curved_2.png'),
                                        fit: BoxFit.fill,
                                        child: InkWell(
                                          onTap: () {
                                            // Navigator.push(
                                            //     context,
                                            //     MaterialPageRoute(
                                            //         builder: (context) =>
                                            //         const GameplaySP()));
                                          },
                                          child: Center(
                                            child: Text(
                                              translationManager.translate('txtCreateTable').toUpperCase(),
                                              style: TextStyle(
                                                color: Colors.black87,
                                                fontWeight: FontWeight.bold,
                                                fontSize: screenWidth * 0.011,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
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
                                        fixedSize: WidgetStateProperty.all(Size(
                                            screenWidth * 0.16, screenHeight * 0.04)),
                                      ),
                                      onPressed: () {},
                                      child: Ink.image(
                                        image: const AssetImage(
                                            'assets/buttons/button_22_curved.png'),
                                        fit: BoxFit.fill,
                                        child: InkWell(
                                          onTap: () {
                                            // Navigator.push(
                                            //     context,
                                            //     MaterialPageRoute(
                                            //         builder: (context) =>
                                            //         const GameplaySP()));
                                          },
                                          child: Center(
                                            child: Text(
                                              translationManager.translate('txtInviteFriend').toUpperCase(),
                                              style: TextStyle(
                                                color: Colors.black87,
                                                fontSize: screenWidth * 0.011,
                                              ),
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
                      ],
                    ),
                  ),
                ],
              ),
          ),
        ),
      ],
    );
  }
}