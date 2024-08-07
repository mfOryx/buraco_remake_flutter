import 'dart:io';

import 'package:buracoplus/providers/ranking_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:buracoplus/common/translation_manager.dart';
import 'package:device_info_plus/device_info_plus.dart';

import 'nick_Names_Generator.dart';

class ThreeLettersBuy extends StatefulWidget {
  const ThreeLettersBuy({super.key});

  @override
  State<ThreeLettersBuy> createState() => _ThreeLettersBuyState();
}

class _ThreeLettersBuyState extends State<ThreeLettersBuy> {
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
    final rankingProvider = Provider.of<RankingProvider>(context);
    double screenWidth = MediaQuery
        .of(context)
        .size
        .width;
    double screenHeight = MediaQuery
        .of(context)
        .size
        .height;

    return GestureDetector(
      onTap: (){
        Navigator.of(context).pop();
      },
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Visibility(
              visible: createTablePopup,
              child: Padding(

                padding: EdgeInsets.only(right: (isIpad)?screenWidth * 0.03:screenWidth * 0.0),
                child: Align(
                  
                  alignment: Alignment.centerRight,
                  child: Container(
                    width: isIphone ? screenWidth * 0.37 : screenWidth * 0.44,
                    height: isIOS() ? screenHeight * 0.95 : screenHeight * 0.87,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.0),
                      color: const Color.fromRGBO(210, 210, 210, 1.0),
                    ),
                    child: GestureDetector(
                      onTap: (){},
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
                                  //empty text top
                                  Padding(
                                    padding: EdgeInsets.only(
                                        top: isIphone ? 5 : 0),
                                    child: Text(

                                      "",
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
                                   //EXIT CROSS BUTTON
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
                                          Navigator.of(context).pop(); // This will hide the dialog
                                        });
                                      },
                                      color: Colors.white,
                                      icon: const Icon(Icons.close)),
                                ],
                              ),
                            ),
                          ),
                          //####################################################### INNER WHITE DIALOG ####################
                          Padding(
                            padding: EdgeInsets.only(top: (isIphone) ? 16 : 15,
                                bottom: (isIphone) ? 46 : 62),
                            child: Align(
                              alignment: Alignment.bottomCenter,

                              child: Container(

                                width: isIphone
                                    ? screenWidth * 0.34
                                    : screenWidth * 0.40,
                                height: isIphone
                                    ? screenHeight * 0.61
                                    : screenHeight * 0.65,
                                decoration: BoxDecoration(
                                  color: const Color.fromRGBO(
                                      240, 240, 240, 1), // Box color
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                child:
                                Padding(
                                  padding: const EdgeInsets.only(top: 4.0,bottom: 4.0,left: 0,right: 0),
                                  child:

                                  Column(
                                    children: [
                                      //##########################################################
                                      //##################### SEARCH TEXT FIELD ##################
                                      //##########################################################
                                      Container( // Wrap TextField in a Container
                                        width:(isIphone)?240: 300.0, // Set width
                                        height:(isIphone)?36: 50.0, // Set height
                                        decoration: BoxDecoration( // Add decoration to the Container
                                          color: Colors.white70, // Background color
                                          boxShadow: [ // Add shadow
                                            BoxShadow(
                                              color: Colors.black.withOpacity(0.2), // Shadow color with opacity
                                              blurRadius: 5.0, // Shadow blur radius
                                              offset: Offset(0, 2), // Shadow offset
                                            ),
                                          ],
                                          borderRadius: BorderRadius.circular(12.0), // Rounded corners
                                        ),
                                        child: TextField( // Create a TextField inside the Container
                                          decoration: InputDecoration( // Add decoration to the TextField
                                            border: InputBorder.none, // Removes the border
                                            filled: true, // Enables background color
                                            fillColor: Colors.transparent, // Transparent background color for the TextField
                                            suffixIcon: Icon(Icons.search), // Adds a search icon to the right
                                            hintText: 'Search', // Placeholder text
                                            contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0), // Padding inside the TextField for vertical centering
                                          ), // End of InputDecoration
                                          textAlignVertical: TextAlignVertical.center, // Vertically center the text
                                        ), // End of TextField
                                      ), // End of Container

                                      //##########################################################
                                      //##################### Scroll View List ###################
                                      //##########################################################
                                      SingleChildScrollView(

                                          child:  SizedBox(

                                            height: isIphone
                                                ? screenHeight * 0.41
                                                : screenHeight * 0.55,

                                            child: userListItem(context: context, screenWidth: screenWidth, screenHeight: screenHeight, isIpad: isIpad, isIphone: isIphone),
                                          )
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          //###################################### topAvatarWithText  #########################
                          Positioned(
                              left:(isIphone)? -15:0,
                              right: 0,
                              top: (isIphone) ? 40 : 60,
                              child: topAvatarWithText(
                                context: context,
                                screenWidth: screenWidth,
                                screenHeight: screenHeight,
                                isIpad: isIpad,
                                isIphone: isIphone,)),
                         
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }



  Widget topAvatarWithText({
    required BuildContext context,
    required double screenWidth,
    required double screenHeight,
    required bool isIpad,
    required bool isIphone,
  }) {
    final translationManager = Provider.of<TranslationManager>(context);
    //final settingsManager = Provider.of<SettingsManager>(context);
    final rankingProvider = Provider.of<RankingProvider>(context);

    return Padding(
      padding: EdgeInsets.only(left: (screenWidth * (0.15)) / 2,),
      child: Row(
        children: [
      Container(
       // color: Colors.lightGreenAccent,
       width:  (isIphone)?  screenWidth * 0.22:screenWidth * 0.28 ,
          height : (isIphone)? screenHeight * 0.13 : screenHeight * 0.13,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
            CircleAvatar(
            radius: (isIphone)?40:60,
          ),
             Column(
               mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(translationManager.translate("txtSpecial").toUpperCase(),
                  style: TextStyle(
                    fontSize: (isIphone)?14:22 ,
                    fontWeight: FontWeight.bold,
                    color: Colors.white
                  ),
                  ),
                  Text(translationManager.translate("txt3LettersNickName"),style: TextStyle(
                      fontSize: (isIphone)?14:22 ,
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                  ),),
                ],
             )
            ],
          ),
      )
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

  }) {
    //final translationManager = Provider.of<TranslationManager>(context);
    //final settingsManager = Provider.of<SettingsManager>(context);

    final rankingProvider = Provider.of<RankingProvider>(context);
    
    NicknamesGenerator generator = NicknamesGenerator();
    List<String> combinations = generator.generateCombinations();
    
    return ListView.builder(

      itemCount: combinations.length,
      itemBuilder: (context, index) {
        return Padding(
          padding:  EdgeInsets.only(left:(isIphone)?0:18,right:(isIphone) ?0:18,top: 8,bottom: 2),
          // padding: EdgeInsets.zero,
          child: ListTile(

            dense:(isIphone)?true: false,

            trailing: OutlinedButton( // Create an OutlinedButton
              onPressed: () { // Define the onPressed event
                // Add your onPressed code here! This is what happens when the button is pressed.
              }, // End of onPressed
              style: OutlinedButton.styleFrom(
                // Define the button style
                
                foregroundColor: Colors.black, backgroundColor: Colors.white, // Button background color (white)
                side: BorderSide(color: Colors.black),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0), // Set rounded corners with a radius of 8.0
                ),// Border color (black)
              ), // End of style
              child: Text('Buy',
              style: TextStyle(
                fontSize: (isIphone) ? 12 : 18,
              ),), // Set the button text
            ), // End of OutlinedButton

            leading: SizedBox
              (width:(isIpad)?230:195,

              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  Text(combinations[index].toUpperCase(),
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: (isIphone) ? 12 : 18,
                    ),
                  ),
                   // contains coin image and price of nickname
                  Container(
                   // color: Colors.lightGreen,
                   // width: 210,
                    child: Row(
                      children: [
                        // (isIphone)?const SizedBox(width: 90,):const SizedBox(width: 100,)  ,
                        //coin image
                        Image.asset("assets/shop/coins.png"),
                        Text("360000",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: (isIphone) ? 12 : 18,
                          ),),
                      ],
                    ),
                  ) ,
                 //nickname 3 letters
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
    final rankingProvider = Provider.of<RankingProvider>(context);

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
                  Text(rankingProvider.myRanking.playerRank.toString(),
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
                      backgroundImage: NetworkImage(rankingProvider.myRanking.avatarUrl.toString()),
                      radius:(isIphone)? 15.5:25,
                    ),
                  ) ,
                  //############### SPACE
                  SizedBox(width: (isIphone)?4:4,),
                  //############### USERNAME
                  Text(rankingProvider.myRanking.playerName.toString(),
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: (isIphone) ? 13 : 18,
                    ),
                  )  ,
                  //############### SPACE
                  SizedBox(width: (isIphone)?110:230,),
                  //############### POINTS
                  Text(rankingProvider.myRanking.playerPoints.toString(),
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
