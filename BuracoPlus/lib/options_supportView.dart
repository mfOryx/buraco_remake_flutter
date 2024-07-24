import 'dart:io';

import 'package:buracoplus/providers/ranking_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:buracoplus/common/translation_manager.dart';
import 'package:device_info_plus/device_info_plus.dart';



class OptionsSupportview extends StatefulWidget {
  const OptionsSupportview({super.key});

  @override
  State<OptionsSupportview> createState() => _OptionsSupportview();
}

class _OptionsSupportview extends State<OptionsSupportview> {
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
    // final rankingProvider = Provider.of<RankingProvider>(context);
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
                padding: EdgeInsets.only(right: (isIpad)?screenWidth * 0.03:screenWidth * 0.035),
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
                                  left: screenWidth * 0.01,
                                  top: screenHeight * 0.01),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                        top: isIphone ? 0 : 0),
                                    child:
                                    // #############################  back to options button #############################
                                    SizedBox(
                                      child:
                                      Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [

                                          IconButton(
                                            onPressed: () {
                                          }, icon: Icon(
                                           
                                            size: (isIphone)?14:24,
                                              color: Colors.white,
                                              Icons.arrow_back_ios),
                                          ),
                                          Text(
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
                                        ],
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
                                bottom: (isIphone) ? 12 : 30),
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: Container(
                                width: isIphone
                                    ? screenWidth * 0.34
                                    : screenWidth * 0.40,
                                height: isIphone
                                    ? screenHeight * 0.56
                                    : screenHeight * 0.65,
                                decoration: BoxDecoration(
                                  color: const Color.fromRGBO(
                                      240, 240, 240, 1), // Box color
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                child:
                                Stack(

                                  children: [
                                    Container(
                                             alignment: Alignment.topCenter,
                                      height:(isIphone)? 180:540,
                                    //  color: Colors.lightBlueAccent,
                                      child: SingleChildScrollView(
                                        padding: EdgeInsets.only(top:6,bottom: 6,left: 16,right: 16),
                                           child: Column(
                                             children: [

                                               messageItem(message: "message sent",isSent: true),
                                               messageItem(message: "message Received",isSent: false),
                                               messageItem(message: "message sent",isSent: true),
                                               messageItem(message: "message sent",isSent: true),
                                               messageItem(message: "message sent",isSent: true),
                                               messageItem(message: "message Received",isSent: false),
                                               messageItem(message: "message Received",isSent: false),
                                               messageItem(message: "message Received",isSent: false),
                                               messageItem(message: "message sent",isSent: true),
                                               messageItem(message: "message sent",isSent: true),
                                               messageItem(message: "message Received",isSent: false),
                                             ],
                                           ),
                                      ),
                                    ),
                                  Align(
                                  alignment:Alignment.bottomCenter,
                                    child: Padding(
                                      padding:  EdgeInsets.only(top:(isIphone)?0:0,bottom: (isIphone)?4:16,left: 20,right: 20),
                                      child: SizedBox(
                                        child:
                                        TextField(
                                          decoration: InputDecoration(
                                            enabledBorder: const OutlineInputBorder(
                                              borderRadius: BorderRadius.only(topLeft: Radius.circular(70),bottomLeft: Radius.circular(70),topRight: Radius.zero,bottomRight: Radius.circular(70)),
                                              borderSide: BorderSide(color: Colors.blue, width: 2.0), // Border color when not focused
                                            ),
                                            focusedBorder: const OutlineInputBorder(
                                              borderRadius: BorderRadius.only(topLeft: Radius.circular(70),bottomLeft: Radius.circular(70),topRight: Radius.zero,bottomRight: Radius.circular(70)),
                                              borderSide: BorderSide(color: Colors.transparent, width: 0.0), // Border color when focused
                                            ),

                                           // border: InputBorder.none,
                                            suffixIcon: Padding(
                                              padding:  EdgeInsets.only(right: (isIphone)?8.0:12,top: (isIphone)?6.0:0, bottom: (isIphone)?6.0:2),
                                              child: Container(
                                                     height: 6,
                                                decoration: const BoxDecoration(
                                                    color: Color.fromRGBO(
                                                        218, 218, 218, 1.0),
                                                    borderRadius: BorderRadius.only(
                                                      topLeft: Radius.circular(15),
                                                      topRight: Radius.circular(0),
                                                      bottomLeft: Radius.circular(15),
                                                      bottomRight: Radius.circular(18)
                                                    ),
                                                ),

                                                  //color: Colors.amber,
                                                  child: IconButton(onPressed: () {  }, icon:Icon(Icons.send),
                                                    iconSize: (isIphone)?16:24,
                                                    color: Colors.black,

                                                  )),
                                            ),
                                          //  Default border around the text field

                                            border: const OutlineInputBorder(

                                              borderRadius: BorderRadius.only(topLeft: Radius.circular(70),bottomLeft: Radius.circular(70),topRight: Radius.zero,bottomRight: Radius.circular(70)),
                                            ),
                                            fillColor: Color.fromRGBO(
                                                232, 232, 232, 1.0), // Background color inside the text field
                                            filled: true, // Whether the background color is filled
                                            labelStyle: TextStyle(color: Colors.grey), // Style for the label text
                                            hintText: 'Type Message here...', // Hint text inside the text field
                                            hintStyle: TextStyle(color: Colors.grey),
                                            contentPadding: EdgeInsets.symmetric(vertical: (isIphone ? 0.0 : 18.0),horizontal: isIphone?12:18),// Style for the hint text
                                          ),
                                          style:  TextStyle(
                                                color: Colors.black,
                                            fontSize:(isIphone)? 11.0:18, // Text size
                                            fontWeight: FontWeight.normal, // Text weight
                                            fontStyle: FontStyle.normal, // Text style (normal/italic)
                                          ),
                                          cursorColor: Colors.black, // Color of the cursor
                                        ),
                                      ),
                                    ),
                                  ),
                                  ]
                                )
                              ),
                            ),
                          ),
                          //###################################################### Text about support AND Input Field
                          Padding(
                            padding: EdgeInsets.only(top: (isIphone) ? 45 : 75,
                                bottom: (isIphone) ? 12 : 30),
                            child: Align(
                              alignment: Alignment.topCenter,
                              child:
                              SizedBox(
                                width: isIphone
                                    ? screenWidth * 0.30
                                    : screenWidth * 0.36,
                                child: Column(
                                  children: [
                                    Text(
                                      textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize:  (isIphone)?screenWidth * 0.0125:screenWidth * 0.0145,
                                        ),
                                        "Write your query to customer support For Assistance"),
                                    Text(
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w100,
                                          fontSize:  (isIphone)?screenWidth * 0.012:screenWidth * 0.014,
                                        ),
                                        "To get the most from customer service messaging, you need to be clear about why you're offering the option to customers."),

                                   const SizedBox(
                                     height: 10,
                                   ) ,
                                    //###################################### Input field
                                    SizedBox(
                                      height: isIphone?30:50,
                                      child: TextField(
                                        decoration: InputDecoration(
                                          // Default border around the text field
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(70.0),
                                          ),
                                          fillColor: Color.fromRGBO(
                                              177, 156, 199, 0.5), // Background color inside the text field
                                          filled: true, // Whether the background color is filled
                                          labelStyle: const TextStyle(color: Colors.grey), // Style for the label text
                                          hintText: 'Type here...', // Hint text inside the text field
                                          hintStyle: const TextStyle(color: Colors.grey),
                                          contentPadding: EdgeInsets.symmetric(vertical: (isIphone ? 8.0 : 14.0),horizontal: isIphone?14:18),// Style for the hint text
                                        ),
                                        style:  TextStyle(
                                          fontSize:(isIphone)? 11.0:18, // Text size
                                          fontWeight: FontWeight.normal, // Text weight
                                          fontStyle: FontStyle.normal, // Text style (normal/italic)
                                        ),
                                        cursorColor: Colors.white70, // Color of the cursor
                                      ),
                                    )
                                  ],
                                ),
                              ),
                          ),
                          )
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


  Widget messageItem({
    required message ,
    date = "12/11/2024",
    isSent = true,

}){

    return
      Align(
          alignment: (isSent)?Alignment.topRight : Alignment.topLeft,
        child: Text(message),
          );

  }
}
