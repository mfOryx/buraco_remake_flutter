import 'dart:io';
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
  bool isIphone = false;
  bool isIpad = false;
  bool createTablePopup = false;

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
        Visibility(
          visible: createTablePopup,
          child: Align(
            alignment: Alignment.center,
            child: Padding(
              padding: EdgeInsets.only(right: screenWidth * 0.02),
              child: Align(
                alignment: Alignment.centerRight,
                child: Container(
                  width: isIOS() ? screenWidth * 0.55 : screenWidth * 0.53,
                  height: isIOS() ? screenHeight * 0.95 : screenHeight * 0.87,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: const Color.fromRGBO(210, 210, 210, 1.0),
                  ),
                  child: Stack(
                    children: [
                      Container(
                        width:
                            isIOS() ? screenWidth * 0.55 : screenWidth * 0.53,
                        height:
                            isIOS() ? screenHeight * 0.4 : screenHeight * 0.4,
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
                              left: screenWidth * 0.04,
                              top: screenHeight * 0.01),
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
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          width:
                              isIOS() ? screenWidth * 0.5 : screenWidth * 0.53,
                          height: isIOS()
                              ? screenHeight * 0.85
                              : screenHeight * 0.87,
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
                                            horizontal: 20.0, vertical: 15.0)
                                        : (isIphone
                                            ? const EdgeInsets.symmetric(
                                                horizontal: 10.0, vertical: 5.0)
                                            : const EdgeInsets.symmetric(
                                                horizontal: 10.0,
                                                vertical: 5.0)),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: isIpad
                                          ? BorderRadius.circular(20.0)
                                          : (isIphone
                                              ? BorderRadius.circular(8.0)
                                              : BorderRadius.circular(8.0)),
                                    ),
                                    child: Row(
                                      children: [
                                        Text(
                                          translationManager
                                              .translate('txtBuracoRule'),
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: screenWidth * 0.013,
                                          ),
                                        ),
                                        SizedBox(
                                            width: isIpad
                                                ? screenWidth * 0.04
                                                : (isIphone
                                                    ? screenWidth * 0.02
                                                    : screenWidth * 0.02)),
                                        SizedBox(
                                          width: isIpad
                                              ? screenWidth * 0.130
                                              : (isIphone
                                                  ? screenWidth * 0.130
                                                  : screenWidth * 0.130),
                                          height: isIpad
                                              ? screenHeight * 0.04
                                              : (isIphone
                                                  ? screenHeight * 0.05
                                                  : screenHeight * 0.07),
                                          child: ElevatedButton(
                                            style: ButtonStyle(
                                              shape: WidgetStateProperty.all(
                                                RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          4.0),
                                                ),
                                              ),
                                              backgroundColor:
                                                  WidgetStateProperty.all(
                                                classicToggle
                                                    ? const Color.fromRGBO(
                                                        90, 64, 126, 1)
                                                    : const Color.fromRGBO(
                                                        230, 230, 230, 1),
                                              ),
                                              side: WidgetStateProperty.all(
                                                const BorderSide(
                                                  color: Colors.black,
                                                  width: 0.4,
                                                ),
                                              ),
                                            ),
                                            onPressed: () {
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
                                                  fontSize: screenWidth * 0.013,
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
                                                  : screenWidth * 0.130),
                                          height: isIpad
                                              ? screenHeight * 0.04
                                              : (isIphone
                                                  ? screenHeight * 0.05
                                                  : screenHeight * 0.07),
                                          child: ElevatedButton(
                                            style: ButtonStyle(
                                              shape: WidgetStateProperty.all(
                                                RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          4.0),
                                                ),
                                              ),
                                              backgroundColor:
                                                  WidgetStateProperty.all(
                                                professionalToggle
                                                    ? const Color.fromRGBO(
                                                        90, 64, 126, 1)
                                                    : const Color.fromRGBO(
                                                        230, 230, 230, 1),
                                              ),
                                              side: WidgetStateProperty.all(
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
                                                translationManager.translate(
                                                    'txtProfessional'),
                                                style: TextStyle(
                                                  color: professionalToggle
                                                      ? Colors.white
                                                      : Colors.black87,
                                                  fontSize: screenWidth * 0.013,
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
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 15,
                                ),
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Row(
                                    children: [
                                      SizedBox(width: screenWidth * 0.01),
                                      SizedBox(
                                        width: isIpad
                                            ? screenWidth * 0.14
                                            : (isIphone
                                                ? screenWidth * 0.13
                                                : screenWidth * 0.13),
                                        height: isIpad
                                            ? screenHeight * 0.04
                                            : (isIphone
                                                ? screenHeight * 0.05
                                                : screenHeight * 0.05),
                                        child: ElevatedButton(
                                          style: ButtonStyle(
                                            shape: WidgetStateProperty.all(
                                              RoundedRectangleBorder(
                                                borderRadius: BorderRadius.only(
                                                  topLeft: isIpad
                                                      ? const Radius.circular(
                                                          20.0)
                                                      : (isIphone
                                                          ? const Radius
                                                              .circular(10.0)
                                                          : const Radius
                                                              .circular(10.0)),
                                                  topRight:
                                                      const Radius.circular(
                                                          0.0),
                                                  bottomLeft: isIpad
                                                      ? const Radius.circular(
                                                          20.0)
                                                      : (isIphone
                                                          ? const Radius
                                                              .circular(10.0)
                                                          : const Radius
                                                              .circular(10.0)),
                                                  bottomRight:
                                                      const Radius.circular(
                                                          0.0),
                                                ),
                                              ),
                                            ),
                                            backgroundColor:
                                                WidgetStateProperty.all(
                                              const Color.fromRGBO(
                                                  83, 32, 95, 1),
                                            ),
                                            side: WidgetStateProperty.all(
                                              BorderSide(
                                                color: Colors.white
                                                    .withOpacity(0.5),
                                                width: isIpad
                                                    ? 3
                                                    : (isIphone ? 2 : 2),
                                              ),
                                            ),
                                          ),
                                          onPressed: () {},
                                          child: Center(
                                            child: Text(
                                              translationManager
                                                  .translate('txtCancel')
                                                  .toUpperCase(),
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: screenWidth * 0.011,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: isIpad
                                            ? screenWidth * 0.14
                                            : (isIphone
                                                ? screenWidth * 0.13
                                                : screenWidth * 0.13),
                                        height: isIpad
                                            ? screenHeight * 0.04
                                            : (isIphone
                                                ? screenHeight * 0.05
                                                : screenHeight * 0.05),
                                        child: ElevatedButton(
                                          style: ButtonStyle(
                                            shape: WidgetStateProperty.all(
                                              RoundedRectangleBorder(
                                                borderRadius: BorderRadius.only(
                                                  topLeft:
                                                      const Radius.circular(
                                                          0.0),
                                                  topRight: isIpad
                                                      ? const Radius.circular(
                                                          20.0)
                                                      : (isIphone
                                                          ? const Radius
                                                              .circular(10.0)
                                                          : const Radius
                                                              .circular(10.0)),
                                                  bottomLeft:
                                                      const Radius.circular(
                                                          0.0),
                                                  bottomRight: isIpad
                                                      ? const Radius.circular(
                                                          20.0)
                                                      : (isIphone
                                                          ? const Radius
                                                              .circular(10.0)
                                                          : const Radius
                                                              .circular(10.0)),
                                                ),
                                              ),
                                            ),
                                            backgroundColor:
                                                WidgetStateProperty.all(
                                              const Color.fromRGBO(
                                                  83, 32, 95, 1),
                                            ),
                                            side: WidgetStateProperty.all(
                                              BorderSide(
                                                color: Colors.white
                                                    .withOpacity(0.5),
                                                width: isIpad
                                                    ? 3
                                                    : (isIphone ? 2 : 2),
                                              ),
                                            ),
                                          ),
                                          onPressed: () {},
                                          child: Center(
                                            child: Text(
                                              translationManager
                                                  .translate('txtInviteFriend')
                                                  .toUpperCase(),
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: screenWidth * 0.0105,
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
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
