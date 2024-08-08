import 'dart:io';

import 'package:buracoplus/providers/ranking_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:buracoplus/common/translation_manager.dart';
import 'package:device_info_plus/device_info_plus.dart';

import 'nick_Names_Generator.dart';

class ExclusiveCardsView extends StatefulWidget {
  const ExclusiveCardsView({super.key});

  @override
  State<ExclusiveCardsView> createState() => _ExclusiveCardsViewState();
}

class _ExclusiveCardsViewState extends State<ExclusiveCardsView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkDeviceType();
  }

  //############################### STATE VARIABLES ############################
  bool isIphone = false;
  bool isIpad = false;
  bool createTablePopup = true;

  File? imageLeft;
  File? imageRight;
  Future pickImageLeft() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if(image == null) return;
      final imageTemp = File(image.path);
      setState(() => this.imageLeft = imageTemp);
    } on PlatformException catch(e) {
      print('Failed to pick image: $e');
    }
  }
  Future pickImageRight() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if(image == null) return;
      final imageTemp = File(image.path);
      setState(() => this.imageRight = imageTemp);
    } on PlatformException catch(e) {
      print('Failed to pick image: $e');
    }
  }
  // ################################ HELPERS FUNCTIONS ########################
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
                                bottom: (isIphone) ? 20 : 62),
                            child: Align(
                              alignment: Alignment.bottomCenter,

                              child: Container(

                                width: isIphone
                                    ? screenWidth * 0.34
                                    : screenWidth * 0.40,
                                height: isIphone
                                    ? screenHeight * 0.62
                                    : screenHeight * 0.65,
                                decoration: BoxDecoration(
                                  color: const Color.fromRGBO(
                                      240, 240, 240, 1), // Box color
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                child:     Padding(
                                  padding: const EdgeInsets.only(top: 4.0,bottom: 4.0,left: 0,right: 0),
                                  child:
                                  Column(
                                    children: [
                                      SizedBox(height: (isIphone)?4:10,),
                                      //##########################################################
                                      //##################### Scroll View List ###################
                                      //##########################################################
                                      SingleChildScrollView(
                                          child:  SizedBox(
                                            height: isIphone
                                                ? screenHeight * 0.52
                                                : screenHeight * 0.58,
                                          child:  description(context: context, screenWidth: screenWidth, screenHeight: screenHeight, isIpad: isIpad, isIphone: isIphone,pickImageLeft:pickImageLeft,pickImageRight:pickImageRight,imageLeft: imageLeft,imageRight: imageRight),
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
                              top: (isIphone) ? 34 : 60,
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
      padding: EdgeInsets.only(left: (screenWidth * (0.1)) / 2,),
      child: Row(
        children:
        [
          Container(
           // color: Colors.lightGreenAccent,
            width:  (isIphone)?  screenWidth * 0.31:screenWidth * 0.34 ,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              //crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage('assets/shop/exclusive_cards_top.png'),
                  radius: (isIphone)?30:62,
                ),
                (isIpad)?SizedBox(width: 16,):SizedBox(width: 0,),
                Text(translationManager.translate("txtExclusiveCards").toUpperCase(),
                  style: TextStyle(
                      fontSize: (isIphone)?14:22 ,
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                  ),
                ),
              ],
            ),
          ) ,
        ],
      ),
    );
  }

  Widget description({
    required BuildContext context,
    required double screenWidth,
    required double screenHeight,
    required bool isIpad,
    required bool isIphone,
    required Future Function() pickImageLeft,
    required Future Function() pickImageRight,
    required File? imageLeft,
    required File? imageRight,


  }) {
    final translationManager = Provider.of<TranslationManager>(context);
    //final settingsManager = Provider.of<SettingsManager>(context);

    final rankingProvider = Provider.of<RankingProvider>(context);

    NicknamesGenerator generator = NicknamesGenerator();
    List<String> combinations = generator.generateCombinations();
    return ListView(
        children:
        [
          Padding(
            padding:  EdgeInsets.only(left:(isIphone)?18:18,right:(isIphone) ?18:18,top: 8,bottom: 2),
            child:  Text(
                textAlign: TextAlign.center,
                translationManager.translate("txtExclusiveCardsHeading1"
                ),
                style: TextStyle(fontSize:(isIphone)?12: 22),
              ),
            ),
          Padding(
            padding:  EdgeInsets.only(left:(isIphone)?18:18,right:(isIphone) ?18:18,top: 8,bottom: 2),
            child:  Text(
              textAlign: TextAlign.center,
              translationManager.translate("txtExclusiveCardsHeading2"
              ),
              style: TextStyle(fontSize:(isIphone)?12: 22,color: Colors.blue),
            ),
          ),
          Padding(
            padding:  EdgeInsets.only(left:(isIphone)?18:18,right:(isIphone) ?18:18,top: 8,bottom: 2),
            child:  Text(
              textAlign: TextAlign.center,
              translationManager.translate("txtExclusiveCardsHeading3"
              ),
              style: TextStyle(fontSize:(isIphone)?12: 22,color: Colors.red),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                child: Padding(
                  padding: const EdgeInsets.only(right: 10.0,top: 20),
                  child: InkWell(
                    onTap: pickImageLeft,
                    child: (imageLeft!=null)?Image.file(imageLeft,height: 150.0,width: 90,fit: BoxFit.cover,):  Image.asset(
                      'assets/shop/exclusive_card.png', // Load the image asset
                      height: 150.0,width: 90,fit: BoxFit.cover,
                      // Set the height
                    ),
                  ),
                ),
              ),
              SizedBox(
                child: Padding(
                  padding: const EdgeInsets.only(right: 10.0,top: 20),
                  child: InkWell(
                    onTap: pickImageRight,
                    child: (imageRight!=null)?Image.file(imageRight,height: 150.0,width: 90,fit: BoxFit.cover,):  Image.asset(
                      'assets/shop/exclusive_card.png', // Load the image asset
                      height: 150.0,width: 90,fit: BoxFit.cover,
                      // Set the height
                    ),
                  ),
                ),
              ),



            ],
          ),
          Column(
            children: [
              SizedBox(height: 8,),
              Text(translationManager.translate("txtSpecial").toUpperCase(),
                style :TextStyle(fontSize:(isIphone)?12: 20,color: Color.fromRGBO(
                    121, 121, 121, 1.0) ),),
              Text(translationManager.translate("txt3LettersNickName"),
                style :TextStyle(fontSize:(isIphone)?11: 18,color: Color.fromRGBO(
                    30, 30, 30, 1.0) ),),
               Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     Image.asset("assets/lobby/BuracoPlusCoin.png",
                     width: (isIphone)?16:24,
                       height: (isIphone)?16:24,
                     ),
                     SizedBox(width: 8,),
                     Text("50,000",
                       style :TextStyle(fontSize:(isIphone)?11: 18,color: Color.fromRGBO(
                           30, 30, 30, 1.0) ),),
                   ],
                 ),
               )
            ],
          )
        ],
    );
  }




}