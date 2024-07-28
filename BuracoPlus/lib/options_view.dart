import 'dart:io';

import 'package:buracoplus/providers/theme_provider.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:buracoplus/common/translation_manager.dart';
import 'package:device_info_plus/device_info_plus.dart';

import 'common/settings_manager.dart';
import 'options_support_view.dart';

class OptionsView extends StatefulWidget {
  const OptionsView({super.key});

  @override
  State<OptionsView> createState() => _OptionsViewState();
}

class _OptionsViewState extends State<OptionsView> {
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
  bool isClassicRule = false;
  int language = 0;
  bool isDarkMode = false;

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
  void toggleClassicRuleFunction() {
    setState(() {
      isClassicRule = !isClassicRule;
    });
  }

  void changeLanguageFunction(BuildContext context) {
    final translationManager =
        Provider.of<TranslationManager>(context, listen: false);
    setState(() {
      if (language < 4) {
        language++;
      } else {
        language = 0;
      }
      

    });

    switch (language) {
      case 0:
        translationManager.changeLanguage('en');
        break;
      case 1:
        translationManager.changeLanguage('it');
        break;
      case 2:
        translationManager.changeLanguage('es');
        break;
      case 3:
        translationManager.changeLanguage('pt');
        break;
      case 4:
        translationManager.changeLanguage('ar');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final translationManager = Provider.of<TranslationManager>(context);
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: (){
        Navigator.of(context).pop(); // This will hide the dialog
      },
      child: Scaffold(
        extendBodyBehindAppBar: true,
        extendBody: true,
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [

            Visibility(
              visible: createTablePopup,
              child: Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: EdgeInsets.only(
                      left: screenWidth * 0.02,

                      right: screenWidth * 0.02),
                  child: Align(
                    alignment:(translationManager.languageCode == "ar")? Alignment.centerLeft:Alignment.centerRight,
                    child: Container(
                      width: isIphone ? screenWidth * 0.40 : screenWidth * 0.44,
                      height: isIOS() ? screenHeight * 0.95 : screenHeight * 0.87,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: const Color.fromRGBO(210, 210, 210, 1.0),
                      ),
                      child: GestureDetector(
                        onTap: (){
                           // print("asd");
                        },
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
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                                  children: [
                                    Padding(
                                      padding:  EdgeInsets.only(top : isIphone?5:0),
                                      child: Text(

                                        translationManager
                                            .translate('txtOptions')
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
                                          Navigator.of(context).pop(); // This will hide the dialog
                                        },
                                        color: Colors.white,
                                        icon: const Icon(Icons.close)),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding:  EdgeInsets.only(top: (isIphone)? 20:15 , bottom:(isIphone)? 5:0),
                              child: Align(
                                alignment: Alignment.center,
                                child: Container(
                                  width: isIphone
                                      ? screenWidth * 0.38
                                      : screenWidth * 0.40,
                                  height: isIphone
                                      ? screenHeight * 0.82
                                      : screenHeight * 0.87,
                                  decoration: BoxDecoration(
                                    color: const Color.fromRGBO(
                                        240, 240, 240, 1), // Box color
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  child:
                                  Padding(
                                    padding: const EdgeInsets.only(top:8.0),
                                    child: SingleChildScrollView(

                                      child:

                                      Column(
                                        children:
                                        [
                                          SizedBox(height: screenHeight * 0.02),
                                          //************************************** ROWS **************************************************************

                                          //#############################  LOBBY #############################
                                          lobbyRow(
                                            screenWidth: screenWidth,
                                            isIpad: isIpad,
                                            isIphone: isIphone,
                                            isClassicRule: isClassicRule,
                                            toggleClassicRule:
                                            toggleClassicRuleFunction,
                                          ),
                                          //#############################  LANGUAGE  #############################
                                          languageRow(
                                              screenWidth: screenWidth,
                                              isIpad: isIpad,
                                              isIphone: isIphone,
                                              language: language,
                                              changeLanguage: () =>
                                                  changeLanguageFunction(context)
                                          ),
                                          //#############################  DARK MODE #############################
                                          darkModeRow(
                                            screenWidth: screenWidth,
                                            isIpad: isIpad,
                                            isIphone: isIphone,
                                          ),
                                          //############################## MANUAL SORTING #############################
                                          (isIphone)?const SizedBox(height: 4):  const SizedBox(height: 0)   ,
                                          manualSortingRow(
                                            screenWidth: screenWidth,
                                            isIpad: isIpad,
                                            isIphone: isIphone,
                                          ),
                                          //########################## CURVED CARD AKA CARD ROTATION  #################
                                          (isIphone)?const SizedBox(height: 4):  const SizedBox(height: 0)   ,
                                          curvedCardsRow(
                                            screenWidth: screenWidth,
                                            isIpad: isIpad,
                                            isIphone: isIphone,
                                          ),
                                          //########################## TOP CARD ROTATION  #############################
                                          topCardRotationRow(
                                            screenWidth: screenWidth,
                                            isIpad: isIpad,
                                            isIphone: isIphone,
                                          ),
                                          // ############################## DIVIDER ###################################
                                          divider(
                                            screenWidth: screenWidth,
                                            isIpad: isIpad,
                                            isIphone: isIphone,
                                          ),
                                          // ############################## RESTRICTIONS ###################################
                                          restrictionsRow(
                                            screenWidth: screenWidth,
                                            isIpad: isIpad,
                                            isIphone: isIphone,
                                          ),
                                          // ############################## FRIEND REQUESTS ################################

                                          friendRequestsRow(
                                            screenWidth: screenWidth,
                                            isIpad: isIpad,
                                            isIphone: isIphone,
                                          ),
                                          // ############################## CLUB INVITES ###################################
                                          (isIphone)?const SizedBox(height: 4):  const SizedBox(height: 0)   ,
                                          clubInvitesRow(
                                            screenWidth: screenWidth,
                                            isIpad: isIpad,
                                            isIphone: isIphone,
                                          ),
                                          // ############################## INVITES TO TABLE ###################################
                                          (isIphone)?const SizedBox(height: 4):  const SizedBox(height: 0)   ,
                                          inVitesToTableRow(
                                            screenWidth: screenWidth,
                                            isIpad: isIpad,
                                            isIphone: isIphone,
                                          ),

                                          divider(
                                            screenWidth: screenWidth,
                                            isIpad: isIpad,
                                            isIphone: isIphone,
                                          ),
                                          //################################ SOUNDS ############################################
                                          soundsRow(
                                            screenWidth: screenWidth,
                                            isIpad: isIpad,
                                            isIphone: isIphone,
                                          ),
                                          //################################ SYSTEM ############################################
                                          systemRow(
                                            screenWidth: screenWidth,
                                            isIpad: isIpad,
                                            isIphone: isIphone,
                                          ),
                                          (isIphone)?const SizedBox(height: 4):  const SizedBox(height: 0)   ,
                                          //################################ TRILL ############################################
                                          trillRow(
                                            screenWidth: screenWidth,
                                            isIpad: isIpad,
                                            isIphone: isIphone,
                                          ),
                                        ],
                                      ),
                                    ) ,
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                                 left:0,
                                right:0,
                                bottom: 0,
                                child: bottomButtons(context: context, screenWidth: screenWidth, screenHeight: screenHeight, isIpad: isIpad, isIphone: isIphone,)),

                          ],
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
    );
  }

  Widget lobbyRow(
      {required double screenWidth,
      required bool isIpad,
      required bool isIphone,
      required bool isClassicRule,
      required void Function() toggleClassicRule}) {
    final translationManager = Provider.of<TranslationManager>(context);
    return Row(
      children: [
        SizedBox(width: screenWidth * 0.022),
        Container(
          //inner white container
          width: screenWidth * 0.35,
          height: isIphone ? 30 : 60,
          padding: isIpad
              ? const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0)
              : (isIphone
                  ? const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0)
                  : const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 5.0)),
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: isIpad
                ? BorderRadius.circular(20.0)
                : (isIphone
                    ? BorderRadius.circular(8.0)
                    : BorderRadius.circular(8.0)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                translationManager.translate('txtLobby').toUpperCase(),
                style: TextStyle(
                  color: Colors.black,
                  fontSize: screenWidth * 0.013,
                ),
              ),
              SizedBox(
                width: isIpad
                    ? screenWidth * 0.04
                    : (isIphone ? screenWidth * 0.02 : screenWidth * 0.02),
              ),
              SizedBox(width: screenWidth * 0.01),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    isClassicRule
                        ? translationManager.translate('txtClassic')
                        : translationManager.translate('txtProfessional'),
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: screenWidth * 0.013,
                    ),
                  ),
                  IconButton(
                    onPressed: toggleClassicRule,
                    icon: const Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.black,
                      size: 10,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget languageRow(
      {required double screenWidth,
      required bool isIpad,
      required bool isIphone,
      required int language,
      required void Function() changeLanguage}) {
    final translationManager = Provider.of<TranslationManager>(context);
    //final settingsManager = Provider.of<SettingsManager>(context);
    return Row(
      children: [
        SizedBox(width: screenWidth * 0.022),
        Container(
          //inner white container
          width: screenWidth * 0.35,
          height: isIphone ? 30 : 60,
          padding: isIpad
              ? const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0)
              : (isIphone
                  ? const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0)
                  : const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 5.0)),
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: isIpad
                ? BorderRadius.circular(20.0)
                : (isIphone
                    ? BorderRadius.circular(8.0)
                    : BorderRadius.circular(8.0)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
          
                translationManager.translate('txtLanguage').toUpperCase(),
                style: TextStyle(
                  color: Colors.black,
                  fontSize: screenWidth * 0.013,
                ),
              ),
              SizedBox(
                width: isIpad
                    ? screenWidth * 0.04
                    : (isIphone ? screenWidth * 0.02 : screenWidth * 0.02),
              ),
              SizedBox(width: screenWidth * 0.01),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
    language == 0 ? "English" :
    language == 1 ? "Italian" :
    language == 2 ? "Spanish" :
    language == 3 ? "Portuguese" :
    language == 4 ? "Arabic" : "English",// default case if none of the conditions are met,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: screenWidth * 0.013,
                    ),
                  ),
                  IconButton(
                    onPressed: () => changeLanguageFunction(context),
                    icon: const Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.black,
                      size: 10,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget darkModeRow({
    required double screenWidth,
    required bool isIpad,
    required bool isIphone,
  }) {
    final translationManager = Provider.of<TranslationManager>(context);
    final settingsManager = Provider.of<SettingsManager>(context);
    final themeProvider = Provider.of<ThemeProvider>(context, listen: false);
    return Row(
      children: [
        SizedBox(width: screenWidth * 0.022),
        Container(
          //inner white container
          width: screenWidth * 0.35,
          height: isIphone ? 30 : 60,
          padding: isIpad
              ? const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0)
              : (isIphone
                  ? const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0)
                  : const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 5.0)),
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: isIpad
                ? BorderRadius.circular(20.0)
                : (isIphone
                    ? BorderRadius.circular(8.0)
                    : BorderRadius.circular(8.0)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                translationManager.translate('txtDarkMode').toUpperCase(),
                style: TextStyle(
                  color: Colors.black,
                  fontSize: screenWidth * 0.013,
                ),
              ),
              SizedBox(
                width: isIpad
                    ? screenWidth * 0.04
                    : (isIphone ? screenWidth * 0.02 : screenWidth * 0.02),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Transform.scale(
                    scale: isIphone? 0.9:1.3, // Adjust the scale factor as needed
                    child: Switch(
                      thumbIcon: WidgetStateProperty.resolveWith<Icon>(
                            (Set<WidgetState> states) {
                          if (states.contains(WidgetState.selected)) {
                            return  const Icon(Icons.check);
                          }
                          return const Icon(Icons.close);
                        },
                      ),
                      value: Provider.of<SettingsManager>(context, listen: false).darkMode,
                      onChanged: (bool newValue) {
                        settingsManager.setDarkMode(!settingsManager.darkMode);
                        themeProvider.toggleTheme(newValue);
                      },
                    ),
                  )

                  // add switch here
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget manualSortingRow({
    required double screenWidth,
    required bool isIpad,
    required bool isIphone,
  }) {
    final translationManager = Provider.of<TranslationManager>(context);
    final settingsManager = Provider.of<SettingsManager>(context);

    return Row(

      children: [
        SizedBox(width: screenWidth * 0.022),
       
        Container(
          //inner white container
          width: screenWidth * 0.35,
          height: isIphone ? 30 : 60,
          padding: isIpad
              ? const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0)
              : (isIphone
              ? const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0)
              : const EdgeInsets.symmetric(
              horizontal: 10.0, vertical: 5.0)),
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: isIpad
                ? BorderRadius.circular(20.0)
                : (isIphone
                ? BorderRadius.circular(8.0)
                : BorderRadius.circular(8.0)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                translationManager.translate('txtManualSorting').toUpperCase(),
                style: TextStyle(
                  color: Colors.black,
                  fontSize: screenWidth * 0.013,
                ),
              ),
              SizedBox(
                width: isIpad
                    ? screenWidth * 0.04
                    : (isIphone ? screenWidth * 0.02 : screenWidth * 0.02),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Transform.scale(
                    scale: isIphone? 0.9:1.3, // Adjust the scale factor as needed
                    child: Switch(
                      thumbIcon: WidgetStateProperty.resolveWith<Icon>(
                            (Set<WidgetState> states) {
                          if (states.contains(WidgetState.selected)) {
                            return  const Icon(Icons.check);
                          }
                          return const Icon(Icons.close);
                        },
                      ),
                      value: Provider.of<SettingsManager>(context, listen: false).manualSorting,
                      onChanged: (bool newValue) {
                        settingsManager.setManualSorting(newValue);
                      },
                    ),
                  )
                  // add switch here
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget curvedCardsRow({
    required double screenWidth,
    required bool isIpad,
    required bool isIphone,
  }) {
    final translationManager = Provider.of<TranslationManager>(context);
    final settingsManager = Provider.of<SettingsManager>(context);

    return Row(
      children: [
        SizedBox(width: screenWidth * 0.022),
        Container(
          //inner white container
          width: screenWidth * 0.35,
          height: isIphone ? 30 : 60,
          padding: isIpad
              ? const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0)
              : (isIphone
              ? const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0)
              : const EdgeInsets.symmetric(
              horizontal: 10.0, vertical: 5.0)),
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: isIpad
                ? BorderRadius.circular(20.0)
                : (isIphone
                ? BorderRadius.circular(8.0)
                : BorderRadius.circular(8.0)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                translationManager.translate('txtCurvedCards').toUpperCase(),
                style: TextStyle(
                  color: Colors.black,
                  fontSize: screenWidth * 0.013,
                ),
              ),
              SizedBox(
                width: isIpad
                    ? screenWidth * 0.04
                    : (isIphone ? screenWidth * 0.02 : screenWidth * 0.02),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Transform.scale(
                    scale: isIphone? 0.9:1.3, // Adjust the scale factor as needed
                    child: Switch(
                       thumbIcon: WidgetStateProperty.resolveWith<Icon>(
    (Set<WidgetState> states) {
    if (states.contains(WidgetState.selected)) {
    return  const Icon(Icons.check);
    }
    return const Icon(Icons.close);
    },
    ),
                      value: Provider.of<SettingsManager>(context, listen: false).cardRotation,
                      onChanged: (bool newValue) {
                        settingsManager.setCardRotation(newValue);
                      },
                    ),
                  )
                  // add switch here
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget topCardRotationRow(
      {required double screenWidth,
        required bool isIpad,
        required bool isIphone})
  {
    final translationManager = Provider.of<TranslationManager>(context);
    final settingsManager = Provider.of<SettingsManager>(context);
    return Row(
      children: [
        SizedBox(width: screenWidth * 0.022),
        Container(
          //inner white container
          width: screenWidth * 0.35,
          height: isIphone ? 30 : 60,
          padding: isIpad
              ? const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0)
              : (isIphone
              ? const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0)
              : const EdgeInsets.symmetric(
              horizontal: 10.0, vertical: 5.0)),
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: isIpad
                ? BorderRadius.circular(20.0)
                : (isIphone
                ? BorderRadius.circular(8.0)
                : BorderRadius.circular(8.0)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                translationManager.translate('txtTopCardRotation').toUpperCase(),
                style: TextStyle(
                  color: Colors.black,
                  fontSize: screenWidth * 0.013,
                ),
              ),
              SizedBox(
                width: isIpad
                    ? screenWidth * 0.04
                    : (isIphone ? screenWidth * 0.02 : screenWidth * 0.02),
              ),
              SizedBox(width: screenWidth * 0.01),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    settingsManager.topCardRotation?
                         translationManager.translate('txtTop')
                        : translationManager.translate('txtDown'),
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: screenWidth * 0.013,
                    ),
                  ),
                  IconButton(
                    onPressed: (){
                      settingsManager.setTopCardRotation(!settingsManager.topCardRotation);
                    },
                    icon: const Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.black,
                      size: 10,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
  
  Widget divider(
      {required double screenWidth,
        required bool isIpad,
        required bool isIphone})
  {

    return Row(
      children: [
        SizedBox(width: screenWidth * 0.022),

        Padding(
          padding: const EdgeInsets.only(top: 5,bottom: 5),
          child: Container(
            height: 2,
            width:  screenWidth * 0.35,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.transparent,
                  Colors.purple,
                  Colors.transparent,
                ],
                stops: [0.0, 0.5, 1.0],
              ),
            ),
          ),
        ),
      
        
      ],
    );
  }

  Widget restrictionsRow(
      {required double screenWidth,
        required bool isIpad,
        required bool isIphone})
  {
    final translationManager = Provider.of<TranslationManager>(context);
    //final settingsManager = Provider.of<SettingsManager>(context);
    return Row(
      children: [
        SizedBox(width: screenWidth * 0.022),
        Container(
          //inner white container
          width: screenWidth * 0.35,
          height: isIphone ? 30 : 60,
          padding: isIpad
              ? const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0)
              : (isIphone
              ? const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0)
              : const EdgeInsets.symmetric(
              horizontal: 10.0, vertical: 5.0)),
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: isIpad
                ? BorderRadius.circular(20.0)
                : (isIphone
                ? BorderRadius.circular(8.0)
                : BorderRadius.circular(8.0)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                translationManager.translate('txtRestrictions'),
                style: TextStyle(
                  color: Colors.black,
                  fontSize: screenWidth * 0.013,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                width: isIpad
                    ? screenWidth * 0.04
                    : (isIphone ? screenWidth * 0.02 : screenWidth * 0.02),
              ),
              SizedBox(width: screenWidth * 0.01),
             
            ],
          ),
        ),
      ],
    );
  }

  Widget friendRequestsRow({
    required double screenWidth,
    required bool isIpad,
    required bool isIphone,
  }) {
    final translationManager = Provider.of<TranslationManager>(context);
    final settingsManager = Provider.of<SettingsManager>(context);

    return Row(
      children: [
        SizedBox(width: screenWidth * 0.022),
        Container(
          //inner white container
          width: screenWidth * 0.35,
          height: isIphone ? 30 : 60,
          padding: isIpad
              ? const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0)
              : (isIphone
              ? const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0)
              : const EdgeInsets.symmetric(
              horizontal: 10.0, vertical: 5.0)),
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: isIpad
                ? BorderRadius.circular(20.0)
                : (isIphone
                ? BorderRadius.circular(8.0)
                : BorderRadius.circular(8.0)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                translationManager.translate('txtFriendRequests').toUpperCase(),
                style: TextStyle(
                  color: Colors.black,
                  fontSize: screenWidth * 0.013,
                ),
              ),
              SizedBox(
                width: isIpad
                    ? screenWidth * 0.04
                    : (isIphone ? screenWidth * 0.02 : screenWidth * 0.02),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Transform.scale(
                    scale: isIphone? 0.9:1.3, // Adjust the scale factor as needed
                    child: Switch(
                      thumbIcon: WidgetStateProperty.resolveWith<Icon>(
                            (Set<WidgetState> states) {
                          if (states.contains(WidgetState.selected)) {
                            return  const Icon(Icons.check);
                          }
                          return const Icon(Icons.close);
                        },
                      ),
                      value: Provider.of<SettingsManager>(context, listen: false).friendRequestsRestrictions,
                      onChanged: (bool newValue) {
                        settingsManager.setFriendRequestsRestrictions(newValue);
                      },
                    ),
                  )
                  // add switch here
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget clubInvitesRow({
    required double screenWidth,
    required bool isIpad,
    required bool isIphone,
  }) {
    final translationManager = Provider.of<TranslationManager>(context);
    final settingsManager = Provider.of<SettingsManager>(context);

    return Row(
      children: [
        SizedBox(width: screenWidth * 0.022),
        Container(
          //inner white container
          width: screenWidth * 0.35,
          height: isIphone ? 30 : 60,
          padding: isIpad
              ? const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0)
              : (isIphone
              ? const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0)
              : const EdgeInsets.symmetric(
              horizontal: 10.0, vertical: 5.0)),
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: isIpad
                ? BorderRadius.circular(20.0)
                : (isIphone
                ? BorderRadius.circular(8.0)
                : BorderRadius.circular(8.0)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                translationManager.translate('txtClubInvites').toUpperCase(),
                style: TextStyle(
                  color: Colors.black,
                  fontSize: screenWidth * 0.013,
                ),
              ),
              SizedBox(
                width: isIpad
                    ? screenWidth * 0.04
                    : (isIphone ? screenWidth * 0.02 : screenWidth * 0.02),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Transform.scale(
                    scale: isIphone? 0.9:1.3, // Adjust the scale factor as needed
                    child: Switch(
                      thumbIcon: WidgetStateProperty.resolveWith<Icon>(
                            (Set<WidgetState> states) {
                          if (states.contains(WidgetState.selected)) {
                            return  const Icon(Icons.check);
                          }
                          return const Icon(Icons.close);
                        },
                      ),
                      value: Provider.of<SettingsManager>(context, listen: false).clubInvites,
                      onChanged: (bool newValue) {
                        settingsManager.setClubInvites(newValue);
                      },
                    ),
                  )
                  // add switch here
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget inVitesToTableRow({
    required double screenWidth,
    required bool isIpad,
    required bool isIphone,
  }) {
    final translationManager = Provider.of<TranslationManager>(context);
    final settingsManager = Provider.of<SettingsManager>(context);

    return Row(
      children: [
        SizedBox(width: screenWidth * 0.022),
        Container(
          //inner white container
          width: screenWidth * 0.35,
          height: isIphone ? 30 : 60,
          padding: isIpad
              ? const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0)
              : (isIphone
              ? const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0)
              : const EdgeInsets.symmetric(
              horizontal: 10.0, vertical: 5.0)),
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: isIpad
                ? BorderRadius.circular(20.0)
                : (isIphone
                ? BorderRadius.circular(8.0)
                : BorderRadius.circular(8.0)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                translationManager.translate('txtInvitesToTable').toUpperCase(),
                style: TextStyle(
                  color: Colors.black,
                  fontSize: screenWidth * 0.013,
                ),
              ),
              SizedBox(
                width: isIpad
                    ? screenWidth * 0.04
                    : (isIphone ? screenWidth * 0.02 : screenWidth * 0.02),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Transform.scale(
                    scale: isIphone? 0.9:1.3, // Adjust the scale factor as needed
                    child: Switch(
                      thumbIcon: WidgetStateProperty.resolveWith<Icon>(
                            (Set<WidgetState> states) {
                          if (states.contains(WidgetState.selected)) {
                            return  const Icon(Icons.check);
                          }
                          return const Icon(Icons.close);
                        },
                      ),
                      value: Provider.of<SettingsManager>(context, listen: false).invitesToTable,
                      onChanged: (bool newValue) {
                        settingsManager.setInvitesToTable(newValue);
                      },
                    ),
                  )
                  // add switch here
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget soundsRow(
      {required double screenWidth,
        required bool isIpad,
        required bool isIphone})
  {
    final translationManager = Provider.of<TranslationManager>(context);
    //final settingsManager = Provider.of<SettingsManager>(context);
    return Row(
      children: [
        SizedBox(width: screenWidth * 0.022),
        Container(
          //inner white container
          width: screenWidth * 0.35,
          height: isIphone ? 30 : 60,
          padding: isIpad
              ? const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0)
              : (isIphone
              ? const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0)
              : const EdgeInsets.symmetric(
              horizontal: 10.0, vertical: 5.0)),
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: isIpad
                ? BorderRadius.circular(20.0)
                : (isIphone
                ? BorderRadius.circular(8.0)
                : BorderRadius.circular(8.0)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                translationManager.translate('txtSounds'),
                style: TextStyle(
                  color: Colors.black,
                  fontSize: screenWidth * 0.013,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                width: isIpad
                    ? screenWidth * 0.04
                    : (isIphone ? screenWidth * 0.02 : screenWidth * 0.02),
              ),
              SizedBox(width: screenWidth * 0.01),

            ],
          ),
        ),
      ],
    );
  }

  Widget systemRow({
    required double screenWidth,
    required bool isIpad,
    required bool isIphone,
  }) {
    final translationManager = Provider.of<TranslationManager>(context);
    final settingsManager = Provider.of<SettingsManager>(context);

    return Row(
      children: [
        SizedBox(width: screenWidth * 0.022),
        Container(
          //inner white container
          width: screenWidth * 0.35,
          height: isIphone ? 30 : 60,
          padding: isIpad
              ? const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0)
              : (isIphone
              ? const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0)
              : const EdgeInsets.symmetric(
              horizontal: 10.0, vertical: 5.0)),
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: isIpad
                ? BorderRadius.circular(20.0)
                : (isIphone
                ? BorderRadius.circular(8.0)
                : BorderRadius.circular(8.0)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                translationManager.translate('txtSystem').toUpperCase(),
                style: TextStyle(
                  color: Colors.black,
                  fontSize: screenWidth * 0.013,
                ),
              ),
              SizedBox(
                width: isIpad
                    ? screenWidth * 0.04
                    : (isIphone ? screenWidth * 0.02 : screenWidth * 0.02),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Transform.scale(
                    scale: isIphone? 0.9:1.3, // Adjust the scale factor as needed
                    child: Switch(
                      thumbIcon: WidgetStateProperty.resolveWith<Icon>(
                            (Set<WidgetState> states) {
                          if (states.contains(WidgetState.selected)) {
                            return  const Icon(Icons.check);
                          }
                          return const Icon(Icons.close);
                        },
                      ),
                      value: Provider.of<SettingsManager>(context, listen: false).invitesToTable,
                      onChanged: (bool newValue) {
                        settingsManager.setInvitesToTable(newValue);
                      },
                    ),
                  )
                  // add switch here
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget trillRow({
    required double screenWidth,
    required bool isIpad,
    required bool isIphone,
  }) {
    final translationManager = Provider.of<TranslationManager>(context);
    final settingsManager = Provider.of<SettingsManager>(context);

    return Row(
      children: [
        SizedBox(width: screenWidth * 0.022),
        Container(
          //inner white container
          width: screenWidth * 0.35,
          height: isIphone ? 30 : 60,
          padding: isIpad
              ? const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0)
              : (isIphone
              ? const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0)
              : const EdgeInsets.symmetric(
              horizontal: 10.0, vertical: 5.0)),
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: isIpad
                ? BorderRadius.circular(20.0)
                : (isIphone
                ? BorderRadius.circular(8.0)
                : BorderRadius.circular(8.0)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                translationManager.translate('txtTrill').toUpperCase(),
                style: TextStyle(
                  color: Colors.black,
                  fontSize: screenWidth * 0.013,
                ),
              ),
              SizedBox(
                width: isIpad
                    ? screenWidth * 0.04
                    : (isIphone ? screenWidth * 0.02 : screenWidth * 0.02),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Transform.scale(
                    scale: isIphone? 0.9:1.3, // Adjust the scale factor as needed
                    child: Switch(
                      thumbIcon: WidgetStateProperty.resolveWith<Icon>(
                            (Set<WidgetState> states) {
                          if (states.contains(WidgetState.selected)) {
                            return  const Icon(Icons.check);
                          }
                          return const Icon(Icons.close);
                        },
                      ),
                      value: Provider.of<SettingsManager>(context, listen: false).trill,
                      onChanged: (bool newValue) {
                        settingsManager.setInvitesToTable(newValue);
                      },
                    ),
                  )
                  // add switch here
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget bottomButtons({
    required BuildContext context,
    required double screenWidth,
    required double screenHeight,
    required bool isIpad,
    required bool isIphone,
  }) {
    final translationManager = Provider.of<TranslationManager>(context);
    //final settingsManager = Provider.of<SettingsManager>(context);

    return Padding(
      padding:  EdgeInsets.only(left:(screenWidth *(0.13))/2),
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
                          : (isIphone ? const Radius.circular(10.0) : const Radius.circular(10.0)),
                      topRight: const Radius.circular(0.0),
                      bottomLeft: isIpad
                          ? const Radius.circular(20.0)
                          : (isIphone ? const Radius.circular(10.0) : const Radius.circular(10.0)),
                      bottomRight: const Radius.circular(0.0),
                    ),
                  ),
                ),
                backgroundColor: WidgetStateProperty.all(
                  const Color.fromRGBO(83, 32, 95, 1),
                ),
                side: WidgetStateProperty.all(
                  BorderSide(
                    color: Colors.white.withOpacity(0.5),
                    width: isIpad ? 3 : (isIphone ? 2 : 2),
                  ),
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
                          : (isIphone ? const Radius.circular(10.0) : const Radius.circular(10.0)),
                      bottomLeft: const Radius.circular(0.0),
                      bottomRight: isIpad
                          ? const Radius.circular(20.0)
                          : (isIphone ? const Radius.circular(10.0) : const Radius.circular(10.0)),
                    ),
                  ),
                ),
                backgroundColor: WidgetStateProperty.all(
                  const Color.fromRGBO(83, 32, 95, 1),
                ),
                side: WidgetStateProperty.all(
                  BorderSide(
                    color: Colors.white.withOpacity(0.5),
                    width: isIpad ? 3 : (isIphone ? 2 : 2),
                  ),
                ),
              ),
              onPressed: () {

                showDialog(
                  useSafeArea:false,
                  context: context,
                  builder: (BuildContext context) {
                    return const OptionsSupportview();
                  },
                );
              },
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

  
}
