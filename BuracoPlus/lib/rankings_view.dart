import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:buracoplus/common/translation_manager.dart';
import 'package:device_info_plus/device_info_plus.dart';



class RankingsView extends StatefulWidget {
  const RankingsView({super.key});

  @override
  State<RankingsView> createState() => _RankingsViewState();
}

class _RankingsViewState extends State<RankingsView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkDeviceType();
  }

  //############################### STATE VARIABLES
  bool isIphone = false;
  bool isIpad = false;
  bool createTablePopup = true;
  // bool isClassicRule = false;
  // int language = 0;
  // bool isDarkMode = false;

  // ################################ HELPERS FUNCTIONS
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
    setState(() {});
  }

  void toggleSelection(String toggleSelected) {
    switch (toggleSelected) {
      case "professionalToggle":
        setState(() {});
        return;
      default:
        return;
    }
  }

  // ################################ FUNCTIONS ON CLICK/PRESSED/TAP
  


  @override
  Widget build(BuildContext context) {
    final translationManager = Provider.of<TranslationManager>(context);
    double screenWidth = MediaQuery
        .of(context)
        .size
        .width;
    double screenHeight = MediaQuery
        .of(context)
        .size
        .height;

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [

          Visibility(
            visible: createTablePopup,
            child: Padding(
              padding: EdgeInsets.only(right: (isIpad)?screenWidth * 0.03:0),
              child: Align(
                alignment: Alignment.centerRight,
                child: Container(
                  width: isIphone ? screenWidth * 0.37 : screenWidth * 0.44,
                  height: isIOS() ? screenHeight * 0.95 : screenHeight * 0.87,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.0),
                    color: const Color.fromRGBO(210, 210, 210, 1.0),
                  ),
                  child: Stack(

                    children: [
                      Container(
                        width:
                        isIOS() ? screenWidth * 0.55 : screenWidth * 0.53,
                        height:
                        isIphone ? screenHeight * 0.52 : screenHeight * 0.4,
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
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,

                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                    top: isIphone ? 5 : 0),
                                child: Text(

                                  translationManager
                                      .translate('txtRankings')
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
                                  padding: const EdgeInsets.all(0.0),
                                  alignment: Alignment.topCenter,
                                  iconSize: isIpad
                                      ? screenWidth * 0.020
                                      : (isIphone
                                      ? screenWidth * 0.020
                                      : screenWidth * 0.020),
                                  onPressed: () {
                                    setState(() {
                                      createTablePopup = false;
                                    });
                                  },
                                  color: Colors.white,
                                  icon: const Icon(Icons.close)),
                            ],
                          ),
                        ),
                      ),

                      //####################################################### 3 CIRCLE AVATARS ########################################
                      Positioned(
                        left: (isIphone) ? screenWidth * 0.074 : screenWidth *
                            0.05,
                        right: 0,
                        top: (isIphone) ? 7 : 120,
                        child: Row(
                          children: [
                            circleAvatarWithIcon(
                                imageUrl: 'https://i.pravatar.cc/300',
                                radius: 35.0,
                                borderWidth: 5.0,
                                icon: Icons.looks_two_rounded,
                                iconSize: 24.0,
                                iconColor: Colors.green,
                                playerName: "SAAD.ALI",
                                playerPoints: 88988621
                            ),
                            // middle one
                            circleAvatarWithIcon(
                              imageUrl: 'https://i.pravatar.cc/320',
                              radius: 45.0,
                              borderWidth: 5.0,
                              icon: Icons.looks_one,
                              iconSize: 24.0,
                              iconColor: Colors.green,
                              sizedBoxSize: 210,
                              numberOffsetFromBottom: 75,
                              crownImagePosition: 60,
                            ),
                            circleAvatarWithIcon(
                              imageUrl: 'https://i.pravatar.cc/310',
                              radius: 35.0,
                              borderWidth: 5.0,
                              icon: Icons.looks_3,
                              iconSize: 24.0,
                              iconColor: Colors.green,
                            ),
                          ],
                        ),
                      ),
                      //####################################################### INNER WHITE DIALOG ####################
                      Padding(
                        padding: EdgeInsets.only(top: (isIphone) ? 20 : 15,
                            bottom: (isIphone) ? 42 : 100),
                        child: Align(
                          alignment: Alignment.bottomCenter,

                          child: Container(
                            width: isIphone
                                ? screenWidth * 0.35
                                : screenWidth * 0.40,
                            height: isIphone
                                ? screenHeight * 0.42
                                : screenHeight * 0.50,
                            decoration: BoxDecoration(
                              color: const Color.fromRGBO(
                                  240, 240, 240, 1), // Box color
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child:
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0,bottom: 8.0),
                              child: SingleChildScrollView(

                                child:  SizedBox(

                                  height: isIphone
                                  ? screenHeight * 0.42
                                  : screenHeight * 0.55,

                                  child: userListItem(context: context, screenWidth: screenWidth, screenHeight: screenHeight, isIpad: isIpad, isIphone: isIphone,playerName: "Player243",playerPoints: 7625356),
                                )


                              ),
                            ),
                          ),
                        ),
                      ),
                      //####################################################### 2 TOP BUTTONS  ########################################
                      Positioned(
                          left:(isIphone)? -15:0,
                          right: 0,
                          top: (isIphone) ? 40 : 60,
                          child: topButtons(
                            context: context,
                            screenWidth: screenWidth,
                            screenHeight: screenHeight,
                            isIpad: isIpad,
                            isIphone: isIphone,)),
                      //####################################################### bottom tile  #############
                      bottomListItem(context: context, screenWidth: screenWidth, screenHeight: screenHeight, isIpad: isIpad, isIphone: isIphone,imageUrl: "https://i.pravatar.cc/313",userName: "User3244",points: "67367872"),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

 

  Widget topButtons({
    required BuildContext context,
    required double screenWidth,
    required double screenHeight,
    required bool isIpad,
    required bool isIphone,
  }) {
    final translationManager = Provider.of<TranslationManager>(context);
    //final settingsManager = Provider.of<SettingsManager>(context);

    return Padding(
      padding: EdgeInsets.only(left: (screenWidth * (0.13)) / 2),
      child: Row(
        children: [
          SizedBox(width: screenWidth * 0.01),
          SizedBox(
            width: isIpad
                ? screenWidth * 0.14
                : (isIphone ? screenWidth * 0.13 : screenWidth * 0.13),
            height: isIpad
                ? screenHeight * 0.04
                : (isIphone ? screenHeight * 0.05 : screenHeight * 0.05),
            child: ElevatedButton(
              style: ButtonStyle(
                shape: WidgetStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: isIpad
                          ? const Radius.circular(20.0)
                          : (isIphone
                          ? const Radius.circular(10.0)
                          : const Radius.circular(10.0)),
                      topRight: const Radius.circular(0.0),
                      bottomLeft: isIpad
                          ? const Radius.circular(20.0)
                          : (isIphone
                          ? const Radius.circular(10.0)
                          : const Radius.circular(10.0)),
                      bottomRight: const Radius.circular(0.0),
                    ),
                  ),
                ),
                backgroundColor: WidgetStateProperty.all(
                  const Color.fromRGBO(255, 255, 255, 0.6),
                ),

              ),
              onPressed: () {},
              child: Center(
                child: Text(
                  translationManager.translate('txtFaq').toUpperCase(),
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
                : (isIphone ? screenWidth * 0.13 : screenWidth * 0.13),
            height: isIpad
                ? screenHeight * 0.04
                : (isIphone ? screenHeight * 0.05 : screenHeight * 0.05),
            child: ElevatedButton(
              style: ButtonStyle(
                shape: WidgetStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: const Radius.circular(0.0),
                      topRight: isIpad
                          ? const Radius.circular(20.0)
                          : (isIphone
                          ? const Radius.circular(10.0)
                          : const Radius.circular(10.0)),
                      bottomLeft: const Radius.circular(0.0),
                      bottomRight: isIpad
                          ? const Radius.circular(20.0)
                          : (isIphone
                          ? const Radius.circular(10.0)
                          : const Radius.circular(10.0)),
                    ),
                  ),
                ),
                backgroundColor: WidgetStateProperty.all(
                  const Color.fromRGBO(255, 255, 255, 0.6),
                ),
                // side: WidgetStateProperty.all(
                //   BorderSide(
                //     color: Colors.white.withOpacity(0.5),
                //     width: isIpad ? 3 : (isIphone ? 2 : 2),
                //   ),
                // ),
              ),
              onPressed: () {},
              child: Center(
                child: Text(
                  translationManager.translate('txtSupport').toUpperCase(),
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
    );
  }


  Widget circleAvatarWithIcon({
    required String imageUrl,
    double radius = 60.0,
    double borderWidth = 3.0,
    required IconData icon,
    double iconSize = 20.0,
    Color iconColor = Colors.black,
    double sizedBoxSize = 180,
    String crownImageUrl = "assets/lobby/diamond-final.png",
    double numberOffsetFromBottom = 60,
    double crownImagePosition = 49,
    String playerName = "User3781",

    int playerPoints = 25346262,


  }) {
    (isIphone) ? radius = (radius / 2.2) : radius;
    (isIphone) ? iconSize = (iconSize / 2) : iconSize;
    (isIphone) ? borderWidth = 2.5 : 3;
    return SizedBox(
      height: sizedBoxSize,
      child: Stack(

        alignment: (isIphone) ? Alignment.center : Alignment.topCenter,
        children: [
          Container(

            width: (radius * 3.5 + borderWidth * 2) + ((isIphone) ? 6 : 4),
            height: (radius * 3 + borderWidth * 2),
            decoration: BoxDecoration(
              //color: Colors.amber,
              shape: BoxShape.circle,
              border: Border.all(color: const Color.fromRGBO(
                  255, 201, 201, 0.9607843137254902), width: borderWidth),
            ),
            child: CircleAvatar(
              radius: radius,
              backgroundImage: NetworkImage(imageUrl),
            ),
          ),
          Positioned(
            bottom: (isIphone) ? numberOffsetFromBottom : 65,
            // Adjust as needed
            right: (isIphone) ? 1 : 9,
            // Adjust as needed
            child: Container(
              width: iconSize + 5, // Adjust as needed
              height: iconSize + 5, // Adjust as needed
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: Icon(
                icon,
                size: iconSize,
                color: iconColor,
              ),
            ),
          ),
          Positioned(
            top: (isIphone) ? crownImagePosition : 0,
            left: (isIphone) ? 0 : 0,

            child: Container(

                width: iconSize + 10, // Adjust as needed
                height: iconSize + 10, // Adjust as needed
                decoration: const BoxDecoration(
                  color: Colors.transparent,
                  shape: BoxShape.circle,
                ),
                child: Image.asset(crownImageUrl)
            ),
          ), //CROWN IMAGES
          Positioned(
            bottom: (isIphone) ? numberOffsetFromBottom - 40 : 0,
            //top:190,
            child: Column(
              children: [
                Text(playerName,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: (isIphone) ? 11 : 18,
                  ),
                ),
                Text(playerPoints.toString(),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: (isIphone) ? 14 : 24,
                  ),
                ),
              ],
            ),
          ) //username and points
        ],
      ),
    );
  }


  Widget userListItem({
    required BuildContext context,
    required double screenWidth,
    required double screenHeight,
    required bool isIpad,
    required bool isIphone,
    required String playerName,
    required int playerPoints,
  }) {
    //final translationManager = Provider.of<TranslationManager>(context);
    //final settingsManager = Provider.of<SettingsManager>(context);

    return ListView.builder(

      itemCount: 6,
      itemBuilder: (context, index) {
        return Padding(
          padding:  EdgeInsets.only(left:(isIphone)?8:18,right:(isIphone) ?8:18,top: 8),
          child: ListTile(
            dense:(isIphone)?true: false,

            trailing: Text(playerPoints.toString() ,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: (isIphone) ? 11 : 18,
                ),
              ),
            
            leading: SizedBox(
              width:190,
              child: Row(
                children: [
                  Text("4",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: (isIphone) ? 11 : 18,
              ),
                  ),
                  (isIphone)?const SizedBox(width: 8,):const SizedBox(width: 0,)  ,
                  Container(
                     decoration: BoxDecoration(
                       shape: BoxShape.circle,
                       border: Border.all(color: const Color.fromRGBO(
                           255, 201, 201, 0.9607843137254902), width: 2),
                     ),
                     child:  CircleAvatar(
                         radius:(isIphone)?20: 40,
                       backgroundImage: const NetworkImage('https://i.pravatar.cc/310'),
                     ),
                   ),
                  (isIphone)?const SizedBox(width: 8,):const SizedBox(width: 0,),
                  Text(playerName,
          style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: (isIphone) ? 11 : 18,
              ),),
                ],
              ),
            ),

          ),
        );
      },
    );
  }


  Widget bottomListItem({
    required BuildContext context,
    required double screenWidth,
    required double screenHeight,
    required bool isIpad,
    required bool isIphone,
    required String imageUrl  ,
    required String userName,
    required String points

  }) {
    //final translationManager = Provider.of<TranslationManager>(context);
    //final settingsManager = Provider.of<SettingsManager>(context);

    return


      Padding(
        padding: EdgeInsets.only(top: (isIphone) ? 20 : 15,
            bottom: (isIphone) ? 5 : 25),
        child: Align(
          alignment: Alignment.bottomCenter,

          child: Container(
            width: isIphone
                ? screenWidth * 0.34
                : screenWidth * 0.37,
            height: isIphone
                ? screenHeight * 0.09
                : screenHeight * 0.06,
            decoration: BoxDecoration(
                color: const Color.fromRGBO(
                    76, 29, 100, 1.0), // Box color
                borderRadius: BorderRadius.circular(8.0),

                border: Border.all(
                    width: (isIphone)?3:5,
                    strokeAlign: BorderSide.strokeAlignOutside,
                    color: const Color.fromRGBO(
                        69, 32, 110, 0.4))
            ),
            child:
            Padding(
              padding: const EdgeInsets.only(top: 2.0,bottom: 2.0),
              child: Row(

                children: [
                  //############### SPACE
                  SizedBox(width: (isIphone)?15:12,),
                  //############### RANK No.
                  Text("01",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: (isIphone) ? 13 : 18,
                    ),
                  )  ,
                  //############### SPACE
                  SizedBox(width: (isIphone)?12:12,),
                  //############### AVATAR OF THE USER
                  Container(
                    width: (isIphone)?35:45,
                    height: (isIphone)?35:45,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: const Color.fromRGBO(
                          228, 180, 255, 0.85), width: 2),
                    ),
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(imageUrl),
                      radius:(isIphone)? 15.5:25,
                    ),
                  ) ,
                  //############### SPACE
                  SizedBox(width: (isIphone)?4:4,),
                  //############### USERNAME
                  Text(userName,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: (isIphone) ? 13 : 18,
                    ),
                  )  ,
                  //############### SPACE
                  SizedBox(width: (isIphone)?110:230,),
                 //############### POINTS
                  Text(points,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: (isIphone) ? 13 : 18,
                    ),
                  )  ,


                ],
              ) ,
            ),
          ),
        ),
      );
  }

}
