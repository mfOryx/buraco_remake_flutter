import 'dart:io';
import 'package:buracoplus/common/pop_up.dart';
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

  // Email and message textField controllers
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _messageInputController = TextEditingController();

  String? _errorText;
  //####################################  the list of messages /##################################
  //<summary>
  // this list contains the messages sent by the user.  To load the conversation between
  //user and the support from the database just get the conversation and put it in the list also
  //</summary>
  // bool refers to "isSent" >>>  if the "isSent" is true it mean this message is sent by the user otherwise from the support
  List<Map<bool, String>> messagesList = [
    {true: "Hi, I am Ali, I need help"},
    {false: "Hi, we have received your request. Please be patient."},
    {true: "My game is stuck"},
    {false: "Hi, it's fixed now."},
    {true: "I did not get the diamonds after my purchase"},
    {
      false:
          "I'm sorry to hear that. Could you please provide your purchase receipt or transaction ID?"
    },
    {true: "Sure, here is my transaction ID: 123456"},
    {false: "Thank you! We're checking the issue now."},
    {true: "Okay, please let me know as soon as possible."},
    {
      false:
          "We've verified the purchase. The diamonds should now be credited to your account."
    },
    {true: "I just checked, and I received the diamonds. Thank you!"},
    {false: "You're welcome! Is there anything else we can assist you with?"},
    {true: "No, that's all for now. Thanks again!"},
    {false: "Have a great day!"},
  ];

  ///####################################/####################################/###################
  bool _validateEmail(String value) {
    // Regular expression for email validation
    if (value.isEmpty) {
      setState(() {
        _errorText = 'Please enter your email';
      });
      return false;
    } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
      setState(() {
        _errorText = 'Please enter a valid email address';
      });
      return false;
    } else {
      setState(() {
        _errorText = null;
      });
    }
    return true;
  }

  // send the message tpo email or databse here...
  //onclick of send button
  void _submitEmail(String value) {
    _validateEmail(value);
    if (_errorText == null) {
      PopUps.popUpSimpleSucess("Message Sent", "Your message has been sent.");
      //_emailController.clear();
    } else {
      PopUps.popUpSimpleError("Invalid Email", _errorText.toString());
    }
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

  bool isOnlyWhiteSpaces(String input) {
    return RegExp(r'^\s*$').hasMatch(input);
  }

  // ################################ FUNCTIONS ON CLICK/PRESSED/TAP
  @override
  Widget build(BuildContext context) {
    final translationManager = Provider.of<TranslationManager>(context);
    // final rankingProvider = Provider.of<RankingProvider>(context);
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: () {
        Navigator.of(context).pop();
      },
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Visibility(
              visible: createTablePopup,
              child: Padding(
                padding: EdgeInsets.only(
                    right: (isIpad) ? screenWidth * 0.03 : screenWidth * 0.035),
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
                      onTap: () {},
                      child: Stack(
                        children: [
                          Container(
                            width: isIOS()
                                ? screenWidth * 0.55
                                : screenWidth * 0.53,
                            height: isIphone
                                ? screenHeight * 0.52
                                : screenHeight * 0.4,
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding:
                                        EdgeInsets.only(top: isIphone ? 0 : 0),
                                    child:
                                        // #############################  back to options button #############################
                                        SizedBox(
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          IconButton(
                                            onPressed: () {},
                                            icon: Icon(
                                                size: (isIphone) ? 14 : 24,
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
                                          Navigator.of(context)
                                              .pop(); // This will hide the dialog
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
                            padding: EdgeInsets.only(
                                top: (isIphone) ? 16 : 15,
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
                                  child: Stack(children: [
                                    Container(
                                      alignment: Alignment.topCenter,
                                      height: (isIphone) ? 180 : 540,
                                      //  color: Colors.lightBlueAccent,
                                      child: SingleChildScrollView(
                                        padding: const EdgeInsets.only(
                                            top: 6,
                                            bottom: 6,
                                            left: 16,
                                            right: 16),
                                        child: Column(
                                          children: messagesList.map((message) {
                                            bool isSentFlag =
                                                message.keys.first;
                                            String messageText =
                                                message.values.first;
                                            return customChip(
                                                message: messageText,
                                                avatarText: 'Y',
                                                isSent: isSentFlag);
                                            //
                                          }).toList(),
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.bottomCenter,
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            top: (isIphone) ? 0 : 0,
                                            bottom: (isIphone) ? 4 : 16,
                                            left: 20,
                                            right: 20),
                                        child: SizedBox(
                                          child: TextField(
                                            controller: _messageInputController,
                                            decoration: InputDecoration(
                                              enabledBorder:
                                                  const OutlineInputBorder(
                                                borderRadius: BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(70),
                                                    bottomLeft:
                                                        Radius.circular(70),
                                                    topRight: Radius.zero,
                                                    bottomRight:
                                                        Radius.circular(70)),
                                                borderSide: BorderSide(
                                                    color: Colors.blue,
                                                    width:
                                                        2.0), // Border color when not focused
                                              ),
                                              focusedBorder:
                                                  const OutlineInputBorder(
                                                borderRadius: BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(70),
                                                    bottomLeft:
                                                        Radius.circular(70),
                                                    topRight: Radius.zero,
                                                    bottomRight:
                                                        Radius.circular(70)),
                                                borderSide: BorderSide(
                                                    color: Colors.transparent,
                                                    width:
                                                        0.0), // Border color when focused
                                              ),

                                              // border: InputBorder.none,
                                              suffixIcon: Padding(
                                                padding: EdgeInsets.only(
                                                    right:
                                                        (isIphone) ? 8.0 : 12,
                                                    top: (isIphone) ? 6.0 : 0,
                                                    bottom:
                                                        (isIphone) ? 6.0 : 2),
                                                child: Container(
                                                    height: 6,
                                                    decoration:
                                                        const BoxDecoration(
                                                      color: Color.fromRGBO(
                                                          218, 218, 218, 1.0),
                                                      borderRadius:
                                                          BorderRadius.only(
                                                              topLeft: Radius
                                                                  .circular(15),
                                                              topRight: Radius
                                                                  .circular(0),
                                                              bottomLeft: Radius
                                                                  .circular(15),
                                                              bottomRight:
                                                                  Radius
                                                                      .circular(
                                                                          18)),
                                                    ),

                                                    //send message button
                                                    child: IconButton(
                                                      onPressed: () {
                                                        // _messageInputController.
                                                        if (_validateEmail(
                                                            _emailController
                                                                .text)) {
                                                          if (_messageInputController
                                                                  .text
                                                                  .isNotEmpty &&
                                                              !isOnlyWhiteSpaces(
                                                                  _messageInputController
                                                                      .text)) {
                                                            setState(() {
                                                              messagesList.add({
                                                                true: _messageInputController
                                                                    .text
                                                                    .toString()
                                                              });
                                                            });
                                                          }
                                                        } else {
                                                          PopUps.popUpSimpleError(
                                                              translationManager
                                                                  .translate(
                                                                      "txtMessageNotSent"),
                                                              translationManager
                                                                  .translate(
                                                                      "txtCheckEmailField"));
                                                        }
                                                      },
                                                      icon: const Icon(
                                                          Icons.send),
                                                      iconSize:
                                                          (isIphone) ? 16 : 24,
                                                      color: Colors.black,
                                                    )),
                                              ),
                                              //  Default border around the text field

                                              border: const OutlineInputBorder(
                                                borderRadius: BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(70),
                                                    bottomLeft:
                                                        Radius.circular(70),
                                                    topRight: Radius.zero,
                                                    bottomRight:
                                                        Radius.circular(70)),
                                              ),
                                              fillColor: const Color.fromRGBO(
                                                  232,
                                                  232,
                                                  232,
                                                  1.0), // Background color inside the text field
                                              filled:
                                                  true, // Whether the background color is filled
                                              labelStyle: const TextStyle(
                                                  color: Colors
                                                      .grey), // Style for the label text
                                              hintText:
                                                  translationManager.translate(
                                                      "txtTypeMessageHere"), // Hint text inside the text field
                                              hintStyle: const TextStyle(
                                                  color: Colors.grey),
                                              contentPadding: EdgeInsets.symmetric(
                                                  vertical:
                                                      (isIphone ? 0.0 : 18.0),
                                                  horizontal: isIphone
                                                      ? 12
                                                      : 18), // Style for the hint text
                                            ),
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: (isIphone)
                                                  ? 11.0
                                                  : 18, // Text size
                                              fontWeight: FontWeight
                                                  .normal, // Text weight
                                              fontStyle: FontStyle
                                                  .normal, // Text style (normal/italic)
                                            ),
                                            cursorColor: Colors
                                                .black, // Color of the cursor
                                          ),
                                        ),
                                      ),
                                    ),
                                  ])),
                            ),
                          ),

                          //###################################################### Text about support AND Input Field
                          Padding(
                            padding: EdgeInsets.only(
                                top: (isIphone) ? 45 : 75,
                                bottom: (isIphone) ? 12 : 30),
                            child: Align(
                              alignment: Alignment.topCenter,
                              child: SizedBox(
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
                                          fontSize: (isIphone)
                                              ? screenWidth * 0.0125
                                              : screenWidth * 0.0145,
                                        ),
                                        translationManager.translate(
                                            "txtSupportViewHeading")),
                                    Text(
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w100,
                                          fontSize: (isIphone)
                                              ? screenWidth * 0.012
                                              : screenWidth * 0.014,
                                        ),
                                        translationManager.translate(
                                            "txtSupportViewDescription")),

                                    const SizedBox(
                                      height: 10,
                                    ),
                                    //###################################### Input field
                                    SizedBox(
                                      height: isIphone ? 30 : 50,
                                      child: TextField(
                                        controller: _emailController,
                                        keyboardType:
                                            TextInputType.emailAddress,
                                        decoration: InputDecoration(
                                          // Default border around the text field
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(70.0),
                                          ),
                                          fillColor: const Color.fromRGBO(
                                              177,
                                              156,
                                              199,
                                              0.5), // Background color inside the text field
                                          filled:
                                              true, // Whether the background color is filled
                                          labelStyle: const TextStyle(
                                              color: Colors
                                                  .grey), // Style for the label text
                                          hintText: translationManager.translate(
                                              "txtTypeEmailHere"), // Hint text inside the text field
                                          hintStyle: const TextStyle(
                                              color: Colors.white),
                                          contentPadding: EdgeInsets.symmetric(
                                              vertical: (isIphone ? 8.0 : 14.0),
                                              horizontal: isIphone
                                                  ? 14
                                                  : 18), // Style for the hint text
                                        ),

                                        onChanged: _validateEmail,
                                        onSubmitted: _submitEmail,
                                        // onTap: _emailController.selection = ,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: (isIphone)
                                              ? 11.0
                                              : 18, // Text size
                                          fontWeight:
                                              FontWeight.normal, // Text weight
                                          fontStyle: FontStyle
                                              .normal, // Text style (normal/italic)
                                        ),
                                        cursorColor: Colors.white70,
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

  Widget customChip({
    required String message,
    required String avatarText,
    String date = "00/00/0000",
    bool isSent = true,
    double maxWidth = 220,
    double avatarRadius = 18,
    TextStyle? messageTextStyle,
    Color? sentBackgroundColor,
    Color? receivedBackgroundColor,
  }) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
      child: Align(
        alignment: isSent ? Alignment.topRight : Alignment.topLeft,
        child: Container(
          constraints:
              BoxConstraints(maxWidth: (isIphone) ? maxWidth : maxWidth + 200),
          decoration: BoxDecoration(
            color: isSent
                ? (sentBackgroundColor ?? Colors.blueAccent)
                : (receivedBackgroundColor ?? Colors.grey),
            borderRadius: BorderRadius.circular(20.0),
          ),
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
          child: Column(
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  (!isSent)
                      ? CircleAvatar(
                          radius: avatarRadius,
                          backgroundColor: Colors.white,
                          child: Text(
                            avatarText,
                            style: const TextStyle(color: Colors.black),
                          ),
                        )
                      : const SizedBox.shrink(),
                  const SizedBox(width: 8.0),
                  Expanded(
                    child: Text(
                      message,
                      style: messageTextStyle ??
                          TextStyle(
                            color: Colors.white,
                            fontSize: (isIphone) ? 12 : 16,
                          ),
                    ),
                  ),
                  const SizedBox(width: 8.0),
                  (isSent)
                      ? CircleAvatar(
                          radius: avatarRadius,
                          backgroundColor: Colors.white,
                          child: Text(
                            avatarText,
                            style: const TextStyle(color: Colors.black),
                          ),
                        )
                      : const SizedBox.shrink(),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    DateFormat('yyyy-MM-dd – kk:mm')
                        .format(DateTime.now())
                        .toString(),
                    style: TextStyle(
                        fontSize: isIphone ? 12 : 13,
                        color: const Color.fromRGBO(220, 219, 219, 1.0)),
                  ),
                  Text(
                    (isSent) ? "sent" : "received",
                    style: TextStyle(
                        fontSize: isIphone ? 12 : 13,
                        color: const Color.fromRGBO(220, 219, 219, 1.0)),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
