import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class MainShopDialog extends StatefulWidget {
  @override
  State<MainShopDialog> createState() => _MainShopDialogState();
}

class _MainShopDialogState extends State<MainShopDialog> {
  // TABS RELATED
  int _selectedIndex = 0;
  bool _isLoading = true;
  bool isIphone = false;
  bool isIpad = false;
  late double screenWidth;
  late double screenHeight;

  // contains the views for tabs content
  late final List<Widget> _tabs;

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

  void initialize() async {
    await checkDeviceType();
    _tabs = [
      homeView(isIpad: isIpad, isIphone: isIphone),
      subscriptionView(isIpad: isIpad, isIphone: isIphone),
    ];
    setState(() {
      _isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    initialize();
  }

  void _onTabTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  //END

  @override
  Widget build(BuildContext context) {
    // double screenWidth = MediaQuery.of(context).size.width;
    // double screenHeight = MediaQuery.of(context).size.height;
    if (_isLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    // Show a loading indicator while initializing
    else {
      return Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.95,
          height: MediaQuery.of(context).size.height * 0.90,
          decoration: BoxDecoration(
            color: const Color.fromRGBO(224, 224, 224, 1.0),
            // borderRadius: BorderRadius.circular(12.0),
            border: const Border(
              top: BorderSide(
                color: Colors.white, // Color of the border
                width: 2.0, // Width of the border
              ),
              left: BorderSide(
                color: Colors.white, // Color of the border
                width: 2.0, // Width of the border
              ),
              bottom: BorderSide(
                color: Colors.white, // Color of the border
                width: 2.0, // Width of the border
              ),
              right: BorderSide(
                color: Colors.white, // Color of the border
                width: 2.0,
              ), // No border on the right side
            ),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16.0),
              topRight: Radius.circular(16.0),
              bottomLeft: Radius.circular(16.0),
              bottomRight: Radius.circular(
                  16.0), // No border radius for the bottom-right corner
            ),

            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              // Sidebar Panel
              sideBar(context: context, isIpad: isIpad, isIphone: isIphone),
              //  Content Panel
              Expanded(
                child: Stack(
                  children: [
                    // Main Content Panel with Rounded Corners
                    Container(
                      padding: const EdgeInsets.all(0),
                      color: const Color.fromRGBO(225, 225, 225, 1.0),
                      // margin: const EdgeInsets.only(left: 0.0, right: 0.0, top: 0.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        //crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Top Bar with Chips and Exit Button
                          topBar(isIpad: isIpad, isIphone: isIphone),
                          // Main Content panel Goes Here
                          _tabs[_selectedIndex],
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    }
  }

  // ################################################################################
  // ###############################   LAYOUT WIDGETS    ###########################
  // #################################################################################

  Widget topBar({
    required bool isIpad,
    required bool isIphone,
  }) {
    return Container(
      height: (isIphone) ? 40 : 90,
      //padding: EdgeInsets.all(0.0),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(0.0),
          topRight: Radius.circular(16.0),
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(
              0.0), // No border radius for the bottom-right corner
        ),
        gradient: LinearGradient(
          colors: [
            Color(0xFF7e2d79),
            // Purple-ish
            Color(0xFF507aa0) // Pink-ish
          ], // Pink-ish), Color.fromRGBO(87, 111, 154, 1)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Stack(
        children: [
          const Align(
            alignment: Alignment.center,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Chip(label: Text('Chip 1')),
                SizedBox(width: 8.0),
                Chip(label: Text('Chip 2')),
                SizedBox(width: 8.0),
                Chip(label: Text('Chip 3')),
              ],
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: IconButton(
              icon: const Icon(Icons.close, color: Colors.white),
              onPressed: () {
                // Handle exit action
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget sideBar({
    required BuildContext context,
    required bool isIpad,
    required bool isIphone,
  }) {
    return Container(
      padding: const EdgeInsets.all(0),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFF7e2d79),
            // Purple-ish
            Color(0xFF507aa0) // Pink-ish
          ], // Pink-ish), Color.fromRGBO(87, 111, 154, 1)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        border: Border(
          right: BorderSide(
            color: Colors.white, // Color of the border
            width: 2.0, // Width of the border
          ), // No border on the right side
        ),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16.0),
          topRight: Radius.circular(0.0),
          bottomLeft: Radius.circular(16.0),
          bottomRight: Radius.circular(
              0.0), // No border radius for the bottom-right corner
        ),
      ),
      width: MediaQuery.of(context).size.width * 0.2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: (isIphone) ? 38 : 160,
          ),

          //############################### HOME BUTTON ###############################
          Padding(
            padding: (isIphone)
                ? const EdgeInsets.only(top: 0.0, bottom: 0.0)
                : const EdgeInsets.only(top: 0.0, bottom: 4.0),
            child: gradientButton(
              imagePath: 'assets/menuIcons/ic_clubs.png',
              // Replace with your image asset
              text: 'HOME',
              onPressed: () {
                // Define the action for the button
                _onTabTapped(0);
              },
              isIpad: isIpad,
              isIphone: isIphone,
            ),
          ),
          //############################### SUBSCRIPTION BUTTON ######################
          Padding(
            padding: (isIphone)
                ? const EdgeInsets.only(top: 0.0, bottom: 0.0)
                : const EdgeInsets.only(top: 0.0, bottom: 4.0),
            child: gradientButton(
              imagePath: 'assets/shop/subscription.png',
              // Replace with your image asset
              text: 'HOME',
              onPressed: () {
                // Define the action for the button
                _onTabTapped(0);
              },
              isIpad: isIpad,
              isIphone: isIphone,
            ),
          ),
          //############################### COINS BUTTON #############################
          Padding(
            padding: (isIphone)
                ? const EdgeInsets.only(top: 0.0, bottom: 0.0)
                : const EdgeInsets.only(top: 0.0, bottom: 4.0),
            child: gradientButton(
              imagePath: 'assets/shop/coins.png',
              // Replace with your image asset
              text: 'HOME',
              onPressed: () {
                // Define the action for the button
                _onTabTapped(0);
              },
              isIpad: isIpad,
              isIphone: isIphone,
            ),
          ),
          //############################### EMOJI BUTTON #############################
          Padding(
            padding: (isIphone)
                ? const EdgeInsets.only(top: 0.0, bottom: 0.0)
                : const EdgeInsets.only(top: 0.0, bottom: 4.0),
            child: gradientButton(
              imagePath: 'assets/shop/emoji.png',
              // Replace with your image asset
              text: 'HOME',
              onPressed: () {
                // Define the action for the button
                _onTabTapped(0);
              },
              isIpad: isIpad,
              isIphone: isIphone,
            ),
          ),
          //############################### TABLES BUTTON #############################
          Padding(
            padding: (isIphone)
                ? const EdgeInsets.only(top: 0.0, bottom: 0.0)
                : const EdgeInsets.only(top: 0.0, bottom: 4.0),
            child: gradientButton(
              imagePath: 'assets/shop/tables.png',
              // Replace with your image asset
              text: 'HOME',
              onPressed: () {
                // Define the action for the button
                _onTabTapped(0);
              },
              isIpad: isIpad,
              isIphone: isIphone,
            ),
          ),
          //############################### CARDS BUTTON #############################
          Padding(
            padding: (isIphone)
                ? const EdgeInsets.only(top: 0.0, bottom: 0.0)
                : const EdgeInsets.only(top: 0.0, bottom: 4.0),
            child: gradientButton(
              imagePath: 'assets/shop/cards.png',
              // Replace with your image asset
              text: 'HOME',
              onPressed: () {
                // Define the action for the button
                _onTabTapped(0);
              },
              isIpad: isIpad,
              isIphone: isIphone,
            ),
          ),
          //############################### SPECIAL BUTTON #############################
          Padding(
            padding: (isIphone)
                ? const EdgeInsets.only(top: 0.0, bottom: 0.0)
                : const EdgeInsets.only(top: 0.0, bottom: 4.0),
            child: gradientButton(
              imagePath: 'assets/shop/special.png',
              // Replace with your image asset
              text: 'HOME',
              onPressed: () {
                // Define the action for the button
                _onTabTapped(0);
              },
              isIpad: isIpad,
              isIphone: isIphone,
            ),
          ),
          //############################### REDEEM BUTTON #############################
          Padding(
            padding: (isIphone)
                ? const EdgeInsets.only(top: 0.0, bottom: 0.0)
                : const EdgeInsets.only(top: 0.0, bottom: 4.0),
            child: gradientButton(
              imagePath: 'assets/shop/redeem.png',
              // Replace with your image asset
              text: 'HOME',
              onPressed: () {
                // Define the action for the button
                _onTabTapped(0);
              },
              isIpad: isIpad,
              isIphone: isIphone,
            ),
          ),

          // Add more icons if needed
        ],
      ),
    );
  }

//######################################### Button Gradient Widget ##############
  Widget gradientButton({
    required String imagePath,
    required String text,
    required VoidCallback onPressed,
    required bool isIpad,
    required bool isIphone,
  }) {
    return Container(
      height: (isIphone) ? 40 : 70,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.transparent,
          backgroundColor: Colors.transparent,
          elevation: 0,
          // Remove shadow
          side: BorderSide.none,
          // Remove border
          // Color of the text
          padding: const EdgeInsets.all(0), // Remove default padding
        ).copyWith(
          overlayColor: WidgetStateProperty.resolveWith<Color?>(
            (Set<WidgetState> states) {
              if (states.contains(WidgetState.pressed)) {
                return Colors.purple
                    .withOpacity(1); // Ripple color when pressed
              }
              return null; // Default ripple color if not pressed
            },
          ),
        ),
        onPressed: onPressed,
        child: Container(
          height: (isIphone) ? 38 : 66,
          padding: EdgeInsets.all((isIphone) ? 2 : 6),
          width: (isIphone) ? 140 : 200,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromRGBO(255, 255, 255, 0.5),
                Color.fromRGBO(255, 255, 255, 0.2)
              ],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(50.0),
              bottomLeft: Radius.circular(50.0),
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 2.0),
                child: ClipRRect(
                  // borderRadius: BorderRadius.circular(12.0), // Rounded image
                  child: Image.asset(
                    imagePath, // Image path from the function argument
                    width: (isIphone) ? 24 : 50,
                    height: (isIphone) ? 24 : 50,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(
                width: 6,
              ),
              Text(
                text, // Text from the function argument
                style: TextStyle(
                  color: Colors.white,
                  fontSize: (isIphone) ? 14 : 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//######################################### SHOP ITEM #####################

Widget shopItem({
  required bool isIpad,
  required bool isIphone,
}) {
  double containerWidth = (isIphone) ? 200 : 300,
      containerHeight = (isIphone) ? 150 : 230,
      bottomOffset = (isIphone) ? 40 : 60;

  // return Container(
  //    width:200,
  //   height: 200,
  //   color: Colors.lightGreenAccent,
  // );
  return Container(
    width: containerWidth,
    height: containerHeight,
    decoration: BoxDecoration(
      color: Colors.deepPurple,
      borderRadius: BorderRadius.circular(20),
    ),
    child: Stack(
      children: [
        Positioned(
          top: 0,
          left: (isIphone) ? 0 : 0,
          right: (isIphone) ? 0 : 0,
          child: Container(
            width: containerWidth,
            height: containerHeight - bottomOffset,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.all(6.0),
              child: Row(
                children: [
                  // Placeholder for the image
                  Container(
                    padding: const EdgeInsets.only(left: 4.0),
                    width: (isIphone) ? 60 : 130,
                    height: (isIphone) ? 60 : 130,
                    color: Colors.white,
                    // Replace with an actual image
                    child: Image.asset("assets/menuIcons/blankAvatar_2.png"),
                  ),
                  const SizedBox(width: 10),
                  // product name, coins and
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    //  crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Product Name',
                        style: TextStyle(
                          fontSize: (isIphone) ? 14 : 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image.asset(
                            "assets/shop/coins.png",
                            // Image path from the function argument
                            width: 30,
                            height: 30,
                            fit: BoxFit.cover,
                          ),
                          Text(
                            '83611',
                            style: TextStyle(
                              fontSize: (isIphone) ? 14 : 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),

        // ######################################## GIFT AND BUY BUTTONS
        Positioned(
          bottom: (isIphone) ? 0 : 10,
          left: 0,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                style: ButtonStyle(
                  // backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                  fixedSize: WidgetStateProperty.all<Size>(
                      Size((isIphone) ? 70 : 50, (isIphone) ? 25 : 50)),
                ),
                onPressed: () {
                  // Action for "Gift" button
                },
                child: Text(
                    style: TextStyle(
                      fontSize: (isIphone) ? 16 : 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    'BUY'),
              ), //BUY
              Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                child: Container(
                  width: 3,
                  height: (isIphone) ? 24 : 34,
                  color: Colors.white,
                ),
              ), //DIVIDER
              TextButton(
                style: ButtonStyle(
                  //backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                  fixedSize: WidgetStateProperty.all<Size>(
                      Size((isIphone) ? 70 : 50, 50)),
                ),
                onPressed: () {
                  // Action for "Gift" button
                },
                child: Text(
                    style: TextStyle(
                      fontSize: (isIphone) ? 16 : 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    'GIFT'),
              ), //GIFT
            ],
          ),
        ),

        // ######################################## top left tag
        Positioned(
          top: 0,
          left: (isIphone) ? 100 : 160,
          right: 0,
          child: Container(
              height: (isIphone) ? 20 : 30, // 70% of 300
              decoration: const BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                  bottomRight:
                      Radius.circular(0), // No radius for bottom-right corner
                ),
              ),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  "popular",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: (isIphone) ? 14 : 16),
                ),
              )),
        ),
      ],
    ),
  );
}

// ################################################################################
// ###############################   CONTENT WIDGETS    ###########################
// #################################################################################

//######################################### HOME VIEW content ########################
Widget homeView({
  required bool isIpad,
  required bool isIphone,
}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        // Aligns children to the start
        children: [
          Padding(
            padding: const EdgeInsets.all(2),
            child: Transform.scale(
                scale: 0.9,
                // scale:1,
                child: shopItem(isIpad: isIpad, isIphone: isIphone)),
          ),
          Padding(
            padding: const EdgeInsets.all(2),
            child: Transform.scale(
                scale: 0.9,
                // scale:1,
                child: shopItem(isIpad: isIpad, isIphone: isIphone)),
          ),
          Padding(
            padding: const EdgeInsets.all(2),
            child: Transform.scale(
                scale: 0.9,
                // scale:1,
                child: shopItem(isIpad: isIpad, isIphone: isIphone)),
          ),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        // Aligns children to the start

        children: [
          Padding(
            padding: const EdgeInsets.all(2),
            child: Transform.scale(
                scale: 0.9,
                // scale:1,
                child: shopItem(isIpad: isIpad, isIphone: isIphone)),
          ),
          Padding(
            padding: const EdgeInsets.all(2),
            child: Transform.scale(
                scale: 0.9,
                // scale:1,
                child: shopItem(isIpad: isIpad, isIphone: isIphone)),
          ),
          Padding(
            padding: const EdgeInsets.all(2),
            child: Transform.scale(
                scale: 0.9,
                // scale:1,
                child: shopItem(isIpad: isIpad, isIphone: isIphone)),
          ),
        ],
      ),
    ],
  );
}

//######################################### SUBSCRIPTION VIEW content #####################

Widget subscriptionView({
  required bool isIpad,
  required bool isIphone,
}) {
  return const Expanded(
    child: Center(
      child: Text('subscriptionView Content Here'),
    ),
  );
}
