import 'package:buracoplus/shop_views/buy_confirm_popup.dart';
import 'package:buracoplus/shop_views/exclusive_cards_view.dart';
import 'package:buracoplus/shop_views/three_letters_buy.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../common/translation_manager.dart';

// double mainContentWidth = 1000;
// double mainContentHeight =  800;
enum Views {
  home,
  purchase,
  gifts,
  subscription,
  coins,
  emojis,
  tables,
  cards,
  special,
  redeem
}

class MainShopDialog extends StatefulWidget {
  @override
  State<MainShopDialog> createState() => _MainShopDialogState();
}

class _MainShopDialogState extends State<MainShopDialog>
{
  //#############################################################################
  //############################### | STATE VARIABLES | #########################
  // TABS RELATED

  // contains the views for tabs content
  late final List<Widget> _tabs;
  int _selectedIndex = 0;

  // PURCHASES AND GIFTS BUTTON
  Set<int> _selected = {0};

  // WIDGET LOADING
  bool _isLoading = true;

  //SIDE BAR BUTTONS SELECTED STATUS
  bool btn_home = false;
  bool btn_subscription = false;
  bool btn_coins = false;
  bool btn_emojis = false;
  bool btn_tables = false;
  bool btn_cards = false;
  bool btn_special = false;
  bool btn_redeem = false;

  //############################################################################
  //############################### | STATE VARIABLES END | ####################

  // other non state variables
  bool isIphone = false;
  bool isIpad = false;
  late double screenWidth;
  late double screenHeight;
  BuildContext? myContext;

  //############################################################################
  //############################### || FUNCTIONS  || ###########################

  //################################## check device ############################
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

  //################################## Initialize Main Content Panels ##########
  void initialize() async {
    await checkDeviceType();
    _tabs = [
      homeView(isIpad: isIpad, isIphone: isIphone),
      purchasesView(isIpad: isIpad, isIphone: isIphone),
      giftsView(isIpad: isIpad, isIphone: isIphone),
      subscriptionView(isIpad: isIpad, isIphone: isIphone),
      coinsView(isIpad: isIpad, isIphone: isIphone),
      emojisView(isIpad: isIpad, isIphone: isIphone),
      tablesView(isIpad: isIpad, isIphone: isIphone),
      cardsView(isIpad: isIpad, isIphone: isIphone),
      specialView(isIpad: isIpad, isIphone: isIphone, context: this.context),
      redeemView(isIpad: isIpad, isIphone: isIphone),
    ];
    setState(() {
      _isLoading = false;
    });
  }

  //################################## sidebar button click ####################
  void onClick_SidebarButton(Views view) {
    changeSidebarButtonColor(view);
    setState(() {
      _selected = {0};
    });
  }

  void onClick_BuyButton(View view) {}
  //################################## sidebar tab changed #####################
  void _onTabTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  //################################## Sidebar Button Color ####################
  // helper function used in  "changeSidebarButtonColor()"
  void setAllButtonsColorToDefault() {
    setState(() {
      btn_home = false;
      btn_subscription = false;
      btn_coins = false;
      btn_emojis = false;
      btn_tables = false;
      btn_cards = false;
      btn_special = false;
      btn_redeem = false;
    });
  }

  void changeSidebarButtonColor(Views view) {
    setAllButtonsColorToDefault();
    switch (view) {
      case Views.home:
        setState(() {
          btn_home = true;
        });
        break;
      case Views.subscription:
        setState(() {
          btn_subscription = true;
        });
        break;
      case Views.coins:
        setState(() {
          btn_coins = true;
        });
        break;
      case Views.emojis:
        setState(() {
          btn_emojis = true;
        });
        break;
      case Views.tables:
        setState(() {
          btn_tables = true;
        });
        break;
      case Views.cards:
        setState(() {
          btn_cards = true;
        });
        break;
      case Views.special:
        setState(() {
          btn_special = true;
        });
        break;
      case Views.redeem:
        setState(() {
          btn_redeem = true;
        });
        break;
      default:
        break;
    }
  }

  // bool getClickedStatusByView(Views view){
  //   setAllButtonsColorToDefault();
  //   switch (view) {
  //     case Views.home:
  //
  //         return btn_home = true;
  //
  //       break;
  //     case Views.subscription:
  //
  //       return btn_subscription = true;
  //
  //       break;
  //     case Views.coins:
  //
  //       return btn_coins = true;
  //
  //       break;
  //     case Views.emojis:
  //
  //       return btn_emojis = true;
  //       break;
  //     case Views.tables:
  //       return btn_tables = true;
  //       break;
  //     case Views.cards:
  //       return btn_cards = true;
  //       break;
  //     case Views.special:
  //       return  btn_special = true;
  //       break;
  //     case Views.redeem:
  //       return btn_redeem = true;
  //       break;
  //     default:
  //       return false;
  //       break;
  //   }
  //
  //
  // }

  //############################################################################
  //############################### || FUNCTIONS END  || #######################

  @override
  void initState() {
    super.initState();
    initialize();
  }

  @override
  Widget build(BuildContext context) {
    //double screenWidth = MediaQuery.of(context).size.width;
    //double screenHeight = MediaQuery.of(context).size.height;
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

  // ###########################################################################
  // ###############################   LAYOUT WIDGETS    #######################
  // ###########################################################################

  Widget topBar({
    required bool isIpad,
    required bool isIphone,
  }) {
    return Container(
      height: (isIphone) ? 40 : 80,
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
          Align(
            alignment: Alignment.centerLeft,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                topItems(isIpad: isIpad, isIphone: isIphone),
              ],
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: IconButton(
              icon: const Icon(Icons.close, color: Colors.white),
              onPressed: () {
                // Handle exit action
                Navigator.pop(context);
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
    final translationManager =
        Provider.of<TranslationManager>(context, listen: false);

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
          //##################|--| HOME BUTTON and SHOP title |--|##############
          Padding(
            padding: EdgeInsets.only(
                top: (isIphone) ? 4.0 : 20,
                left: 10,
                right: 10,
                bottom: (isIphone) ? 0 : 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  translationManager.translate("txtShop").toUpperCase(),
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: (isIphone) ? 16 : 22,
                      color: Colors.white),
                ), //SHOP
                OutlinedButton(
                  onPressed: () {
                    onClick_SidebarButton(Views.home);
                    _onTabTapped(0);
                  }, // Handle tap
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.black,
                    backgroundColor: Colors.white, // Background color
                    side: const BorderSide(
                        color: Color.fromRGBO(97, 137, 178, 1.0),
                        width: 2), // Blue border
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8), // Rounded corners
                    ),
                    padding: EdgeInsets.only(
                        top: (isIphone) ? 2 : 6,
                        bottom: (isIphone) ? 2 : 6), // Remove default padding
                    elevation: 4, // Drop shadow elevation
                  ),
                  child: Container(
                    width: (isIphone) ? 22 : 30, // Button width
                    height: (isIphone) ? 20 : 36, // Button height
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/shop/home.png"), // Image URL
                        fit: BoxFit.cover, // Image fit
                      ),
                    ), // BoxDecoration widget
                  ), // Container widget
                ), // OutlinedButton widget
              ],
            ),
          ),
          //#############|--| PURCHASES AND GIFTS BUTTONS |--|##################
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.195,
            child: SegmentedButton(
              selectedIcon: Icon(
                Icons.check,
                color: Colors.white,
                size: (isIphone) ? 10 : 16,
              ),
              style: ButtonStyle(
                visualDensity:
                    (isIphone) ? VisualDensity.compact : VisualDensity.standard,
                side: WidgetStateProperty.all(const BorderSide(
                    color: Color.fromRGBO(174, 141, 197, 0.7),
                    width: 2)), // Border color and width
                backgroundColor: WidgetStateProperty.all<Color>(
                  const Color(0xFF7e2d79),
                ),
              ),
              segments: <ButtonSegment<int>>[
                ButtonSegment<int>(
                  value: 1,
                  label: Text(
                    'Purchases',
                    style: TextStyle(
                      fontSize: (isIphone) ? 10 : 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                ButtonSegment<int>(
                  value: 2,
                  label: Text(
                    "Gifts",
                    style: TextStyle(
                      fontSize: (isIphone) ? 10 : 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
              selected: _selected,
              onSelectionChanged: (Set<int> newSelection) {
                setState(() {
                  _selected = newSelection;

                  if (newSelection.first == 2)
                    _onTabTapped(2);
                  else if (newSelection.first == 1) _onTabTapped(1);
                });
              },
            ),
          ),
          SizedBox(
            height: (isIphone) ? 1 : 70,
          ),
          //############################### SUBSCRIPTION BUTTON ################
          Padding(
            padding: (isIphone)
                ? const EdgeInsets.only(top: 0.0, bottom: 0.0)
                : const EdgeInsets.only(top: 0.0, bottom: 4.0),
            child: gradientButton(
                imagePath: 'assets/shop/subscription.png',
                text: translationManager.translate("txtSubscription"),
                onPressed: () {
                  onClick_SidebarButton(Views.subscription);
                  _onTabTapped(3);
                  setState(() {
                    _selected = {0};
                  });
                },
                isIpad: isIpad,
                isIphone: isIphone,
                view: btn_subscription),
          ),
          //############################### COINS BUTTON #######################
          Padding(
            padding: (isIphone)
                ? const EdgeInsets.only(top: 0.0, bottom: 0.0)
                : const EdgeInsets.only(top: 0.0, bottom: 4.0),
            child: gradientButton(
                imagePath: 'assets/shop/coins.png',
                // Replace with your image asset
                text: translationManager.translate("txtCoins"),
                onPressed: () {
                  onClick_SidebarButton(Views.coins);
                  // Define the action for the button
                  _onTabTapped(4);
                },
                isIpad: isIpad,
                isIphone: isIphone,
                view: btn_coins),
          ),
          //############################### EMOJI BUTTON #######################
          Padding(
            padding: (isIphone)
                ? const EdgeInsets.only(top: 0.0, bottom: 0.0)
                : const EdgeInsets.only(top: 0.0, bottom: 4.0),
            child: gradientButton(
                imagePath: 'assets/shop/emoji.png',
                // Replace with your image asset
                text: translationManager.translate("txtEmojis"),
                onPressed: () {
                  onClick_SidebarButton(Views.emojis);
                  // Define the action for the button
                  _onTabTapped(5);
                },
                isIpad: isIpad,
                isIphone: isIphone,
                view: btn_emojis),
          ),
          //############################### TABLES BUTTON ######################
          Padding(
            padding: (isIphone)
                ? const EdgeInsets.only(top: 0.0, bottom: 0.0)
                : const EdgeInsets.only(top: 0.0, bottom: 4.0),
            child: gradientButton(
                imagePath: 'assets/shop/tables.png',
                // Replace with your image asset
                text: translationManager.translate("txtTables"),
                onPressed: () {
                  onClick_SidebarButton(Views.tables);
                  // Define the action for the button
                  _onTabTapped(6);
                },
                isIpad: isIpad,
                isIphone: isIphone,
                view: btn_tables),
          ),
          //############################### CARDS BUTTON #######################
          Padding(
            padding: (isIphone)
                ? const EdgeInsets.only(top: 0.0, bottom: 0.0)
                : const EdgeInsets.only(top: 0.0, bottom: 4.0),
            child: gradientButton(
                imagePath: 'assets/shop/cards.png',
                // Replace with your image asset
                text: translationManager.translate("txtCards"),
                onPressed: () {
                  onClick_SidebarButton(Views.cards);
                  // Define the action for the button
                  _onTabTapped(7);
                },
                isIpad: isIpad,
                isIphone: isIphone,
                view: btn_cards),
          ),
          //############################### SPECIAL BUTTON #####################
          Padding(
            padding: (isIphone)
                ? const EdgeInsets.only(top: 0.0, bottom: 0.0)
                : const EdgeInsets.only(top: 0.0, bottom: 4.0),
            child: gradientButton(
                imagePath: 'assets/shop/special.png',
                // Replace with your image asset
                text: translationManager.translate("txtSpecial"),
                onPressed: () {
                  onClick_SidebarButton(Views.special);
                  // Define the action for the button
                  _onTabTapped(8);
                },
                isIpad: isIpad,
                isIphone: isIphone,
                view: btn_special),
          ),
          //############################### REDEEM BUTTON ######################
          Padding(
            padding: (isIphone)
                ? const EdgeInsets.only(top: 0.0, bottom: 0.0)
                : const EdgeInsets.only(top: 0.0, bottom: 4.0),
            child: gradientButton(
                imagePath: 'assets/shop/redeem.png',
                // Replace with your image asset
                text: translationManager.translate("txtRedeem"),
                onPressed: () {
                  onClick_SidebarButton(Views.redeem);
                  // Define the action for the button
                  _onTabTapped(9);
                },
                isIpad: isIpad,
                isIphone: isIphone,
                view: btn_redeem),
          ),
          // Add more icons if needed
        ],
      ),
    );
  }

//########### Button Gradient Widget [sidebar button widget] ##############
  Widget gradientButton({
    required String imagePath,
    required String text,
    required VoidCallback onPressed,
    required bool isIpad,
    required bool isIphone,
    required bool view,
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
          decoration: BoxDecoration(
            gradient: (view)
                ? LinearGradient(
                    colors: [
                      Color.fromRGBO(224, 224, 224, 1.0),
                      Color.fromRGBO(224, 224, 224, 1.0),
                    ],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  )
                : LinearGradient(
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
                  color: (view) ? Color(0xFF7e2d79) : Colors.white,
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
//######################################### SHOP ITEM ##########################

Widget shopItem({
  required bool isIpad,
  required bool isIphone,
  String topLeftRibbonText = 'New',
  String productID = "0",
  VoidCallback? onClickBuy,
  VoidCallback? onClickGift,
}) {
  double containerWidth = (isIphone) ? 200 : 300,
      containerHeight = (isIphone) ? 150 : 230,
      bottomOffset = (isIphone) ? 40 : 60;

  return Container(
    width: containerWidth,
    height: containerHeight,
    decoration: BoxDecoration(
      color: Color(0xFF7e2d79),
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
                  // Action for "BUY" button
                  if (onClickBuy != null) onClickBuy();
                  print("Product ID : " + productID);
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
                  // Action for "GIFT" button
                  if (onClickGift != null) onClickGift();
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

        topLeftRibbon(
            isIpad: isIpad, isIphone: isIphone, text: topLeftRibbonText),
      
      ],
    ),
  );
}

// overload of shop item with one button in center
Widget shopItemSingle({
  required bool isIpad,
  required bool isIphone,
}) {
  double containerWidth = (isIphone) ? 200 : 300,
      containerHeight = (isIphone) ? 150 : 230,
      bottomOffset = (isIphone) ? 40 : 60;

  return Container(
    width: containerWidth,
    height: containerHeight,
    decoration: BoxDecoration(
      color: Color(0xFF7e2d79),
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
              // Padding(
              //   padding: const EdgeInsets.only(left: 8.0, right: 8.0),
              //   child: Container(
              //     width: 3,
              //     height: (isIphone) ? 24 : 34,
              //     color: Colors.white,
              //   ),
              // ), //DIVIDER
              // TextButton(
              //   style: ButtonStyle(
              //     //backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
              //     fixedSize: WidgetStateProperty.all<Size>(
              //         Size((isIphone) ? 70 : 50, 50)),
              //   ),
              //   onPressed: () {
              //     // Action for "Gift" button
              //   },
              //   child: Text(
              //       style: TextStyle(
              //         fontSize: (isIphone) ? 16 : 20,
              //         fontWeight: FontWeight.bold,
              //         color: Colors.white,
              //       ),
              //       'GIFT'),
              // ), //GIFT
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
                gradient: LinearGradient(
                  colors: [
                    Color(0xFF7e2d79),
                    // Purple-ish
                    Color(0xFF507aa0) // Pink-ish
                  ], // Pink-ish), Color.fromRGBO(87, 111, 154, 1)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                // color: Colors.amber,
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

//######################################### Top ITEMs ##########################
Widget topItems({
  required bool isIpad,
  required bool isIphone,
}) {
  return Row(
    children: [
      // ############################# | DIAMONDS | ####################
      const SizedBox(width: 30),
      Container(
        width: (isIphone) ? 110 : 160,
        height: (isIphone) ? 29 : 45,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(45),
        ),
        padding: const EdgeInsets.symmetric(
            horizontal:
                8), // Adjusted padding to fit within the specified dimensions
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Image.asset(
              "assets/lobby/diamond-final.png",
              width: (isIphone) ? 16 : 32,
              height: (isIphone) ? 16 : 32,
            ),
            const SizedBox(
                width:
                    5), // Adjusted spacing to fit within the specified dimensions
            Text(
              '7645',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: (isIphone) ? 12 : 18,
                  fontWeight: FontWeight
                      .bold), // Adjusted text size to fit within the specified dimensions
            ),
          ],
        ),
      ),
      const SizedBox(width: 10),
      // ############################# | COINS | ####################
      Container(
        width: (isIphone) ? 110 : 160,
        height: (isIphone) ? 29 : 45,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(45),
        ),
        padding: const EdgeInsets.symmetric(
            horizontal:
                8), // Adjusted padding to fit within the specified dimensions
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Image.asset(
              "assets/lobby/BuracoPlusCoin.png",
              width: (isIphone) ? 16 : 32,
              height: (isIphone) ? 16 : 32,
            ),
            const SizedBox(
                width:
                    5), // Adjusted spacing to fit within the specified dimensions
            Text(
              '7645',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: (isIphone) ? 12 : 18,
                  fontWeight: FontWeight
                      .bold), // Adjusted text size to fit within the specified dimensions
            ),
          ],
        ),
      ),
      const SizedBox(width: 10),
      // ############################# | SPECIAL | ####################

      Container(
        width: (isIphone) ? 110 : 160,
        height: (isIphone) ? 29 : 45,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(45),
        ),
        padding: const EdgeInsets.symmetric(
            horizontal:
                8), // Adjusted padding to fit within the specified dimensions
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Image.asset(
              "assets/lobby/BuracoPlusLife_big.png",
              width: (isIphone) ? 16 : 32,
              height: (isIphone) ? 16 : 32,
            ),
            const SizedBox(
                width:
                    5), // Adjusted spacing to fit within the specified dimensions
            Text(
              '7645',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: (isIphone) ? 12 : 18,
                  fontWeight: FontWeight
                      .bold), // Adjusted text size to fit within the specified dimensions
            ),
          ],
        ),
      ),
    ],
  );
}

//########################## TOP_LEFT_RIBBON  ##################################

Widget topLeftRibbon({
  required bool isIpad,
  required bool isIphone,
  String text = "",
}) {
  return Positioned(
    top: 0,
    left: (isIphone) ? 100 : 160,
    right: 0,
    child: Container(
        height: (isIphone) ? 20 : 30, // 70% of 300
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
          // color: Colors.amber,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
            bottomLeft: Radius.circular(20),
            bottomRight:
                Radius.circular(0), // No radius for bottom-right corner
          ),
        ),
        child: Align(
          alignment: Alignment.center,
          child: Text(
            text,
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: (isIphone) ? 14 : 16),
          ),
        )),
  );
}

// #############################################################################
// ############################### |  CONTENT WIDGETS   | ######################
// #############################################################################

//######################################### | HOME VIEW content | ##############
Widget homeView({
  required bool isIpad,
  required bool isIphone,
}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
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
                child: shopItemSingle(isIpad: isIpad, isIphone: isIphone)),
          ),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
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

//######################################### SUBSCRIPTION VIEW content ##########

Widget subscriptionView({
  required bool isIpad,
  required bool isIphone,
}) {
  return Container(
    //color: Colors.red,
    width: 1000,
    height: (isIphone) ? 340 : 800,
    child: SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
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
            mainAxisAlignment: MainAxisAlignment.center,
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
            mainAxisAlignment: MainAxisAlignment.center,
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
            mainAxisAlignment: MainAxisAlignment.center,
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
            mainAxisAlignment: MainAxisAlignment.center,
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
            mainAxisAlignment: MainAxisAlignment.center,
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
      ),
    ),
  );
}

//######################################### coinsView VIEW content #############

Widget coinsView({
  required bool isIpad,
  required bool isIphone,
}) {
  return Container(
    //color: Colors.red,
    width: 1000,
    height: (isIphone) ? 340 : 800,
    child: SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
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
            mainAxisAlignment: MainAxisAlignment.center,
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
            mainAxisAlignment: MainAxisAlignment.center,
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
            mainAxisAlignment: MainAxisAlignment.center,
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
            mainAxisAlignment: MainAxisAlignment.center,
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
            mainAxisAlignment: MainAxisAlignment.center,
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
      ),
    ),
  );
}

//######################################### emojisView VIEW content ############

Widget emojisView({
  required bool isIpad,
  required bool isIphone,
}) {
  return Container(
    //color: Colors.red,
    width: 1000,
    height: (isIphone) ? 340 : 800,
    child: SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
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
            mainAxisAlignment: MainAxisAlignment.center,
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
            mainAxisAlignment: MainAxisAlignment.center,
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
            mainAxisAlignment: MainAxisAlignment.center,
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
            mainAxisAlignment: MainAxisAlignment.center,
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
            mainAxisAlignment: MainAxisAlignment.center,
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
      ),
    ),
  );
}

//######################################### tablesView VIEW content ############

Widget tablesView({
  required bool isIpad,
  required bool isIphone,
}) {
  return Container(
    //color: Colors.red,
    width: 1000,
    height: (isIphone) ? 340 : 800,
    child: SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
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
            mainAxisAlignment: MainAxisAlignment.center,
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
            mainAxisAlignment: MainAxisAlignment.center,
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
            mainAxisAlignment: MainAxisAlignment.center,
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
            mainAxisAlignment: MainAxisAlignment.center,
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
            mainAxisAlignment: MainAxisAlignment.center,
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
      ),
    ),
  );
}

//######################################### cardsView VIEW content #############

Widget cardsView({
  required bool isIpad,
  required bool isIphone,
}) {
  return Container(
    //color: Colors.red,
    width: 1000,
    height: (isIphone) ? 340 : 800,
    child: SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
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
            mainAxisAlignment: MainAxisAlignment.center,
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
            mainAxisAlignment: MainAxisAlignment.center,
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
            mainAxisAlignment: MainAxisAlignment.center,
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
            mainAxisAlignment: MainAxisAlignment.center,
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
            mainAxisAlignment: MainAxisAlignment.center,
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
      ),
    ),
  );
}
//######################################### specialView VIEW content ###########

Widget specialView({
  required bool isIpad,
  required bool isIphone,
  required BuildContext context,
}) {
  return Container(
    //color: Colors.red,
    width: 1000,
    height: (isIphone) ? 340 : 800,
    child: SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            // Aligns children to the start
            children: [
              Padding(
                padding: const EdgeInsets.all(2),
                child: Transform.scale(
                    scale: 0.9,
                    // scale:1,
                    child: shopItem(
                        isIpad: isIpad,
                        isIphone: isIphone,
                        productID: "001",
                        topLeftRibbonText: "3 letters",
                        onClickBuy: () {
                          showDialog(
                           // useSafeArea: false,
                            context: context,
                            builder: (BuildContext context) {
                              return const ThreeLettersBuy();
                            },
                          );
                        },
                        onClickGift: () {})),
              ),
              Padding(
                padding: const EdgeInsets.all(2),
                child: Transform.scale(
                    scale: 0.9,
                    // scale:1,
                    child: shopItem(
                        isIpad: isIpad,
                        isIphone: isIphone,
                        productID: "002",
                        topLeftRibbonText: "Exclusive",
                        onClickBuy: () {
                          showDialog(
                            // useSafeArea: false,
                            context: context,
                            builder: (BuildContext context) {
                              return const ExclusiveCardsView();
                            },
                          );
                        },
                        onClickGift: () {})),
              ),
              Padding(
                padding: const EdgeInsets.all(2),
                child: Transform.scale(
                    scale: 0.9,
                    // scale:1,
                    child: shopItem(
                        isIpad: isIpad,
                        isIphone: isIphone,
                        productID: "003",
                        topLeftRibbonText: "Friends",
                        onClickBuy: () {
                          showDialog(
                            // useSafeArea: false,
                            context: context,
                            builder: (BuildContext context) {
                              return const BuyConfirmPopup();
                            },
                          );

                        },
                        onClickGift: () {})),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
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
            mainAxisAlignment: MainAxisAlignment.center,
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
            mainAxisAlignment: MainAxisAlignment.center,
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
            mainAxisAlignment: MainAxisAlignment.center,
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
            mainAxisAlignment: MainAxisAlignment.center,
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
      ),
    ),
  );
}
//######################################### redeemView VIEW content ############

Widget redeemView({
  required bool isIpad,
  required bool isIphone,
}) {
  return Container(
    //color: Colors.red,
    width: 1000,
    height: (isIphone) ? 340 : 800,
    child: SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
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
            mainAxisAlignment: MainAxisAlignment.center,
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
            mainAxisAlignment: MainAxisAlignment.center,
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
            mainAxisAlignment: MainAxisAlignment.center,
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
            mainAxisAlignment: MainAxisAlignment.center,
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
            mainAxisAlignment: MainAxisAlignment.center,
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
      ),
    ),
  );
}

//######################################### purchase VIEW content ##############
Widget purchasesView({
  required bool isIpad,
  required bool isIphone,
}) {
  return Container(
    //color: Colors.green,
    width: 1000,
    height: (isIphone) ? 340 : 800,
    child: SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
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
            mainAxisAlignment: MainAxisAlignment.center,
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
            mainAxisAlignment: MainAxisAlignment.center,
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
            mainAxisAlignment: MainAxisAlignment.center,
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
            mainAxisAlignment: MainAxisAlignment.center,
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
            mainAxisAlignment: MainAxisAlignment.center,
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
      ),
    ),
  );
}

//######################################### GIFTS VIEW content #################
Widget giftsView({
  required bool isIpad,
  required bool isIphone,
}) {
  return Container(
    // color: Colors.red,
    width: 1000,
    height: (isIphone) ? 340 : 800,
    child: SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
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
            mainAxisAlignment: MainAxisAlignment.center,
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
            mainAxisAlignment: MainAxisAlignment.center,
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
            mainAxisAlignment: MainAxisAlignment.center,
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
            mainAxisAlignment: MainAxisAlignment.center,
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
            mainAxisAlignment: MainAxisAlignment.center,
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
      ),
    ),
  );
}
