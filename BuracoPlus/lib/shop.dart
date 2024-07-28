import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ShopView extends StatefulWidget {
  const ShopView({super.key});

  @override
  State<ShopView> createState() => _ShopViewState();
}

class _ShopViewState extends State<ShopView> {
  bool isIphone = false;
  bool isIpad = false;

  @override
  void initState() {
    super.initState();
    checkDeviceType();
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
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: SizedBox(
          width: (isIpad)?screenWidth * 0.95:screenWidth * 0.88,
          height: screenHeight * 0.8,
          child: DefaultTabController(
            length: 8, // Number of tabs
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white, // Background color for the container
                borderRadius: BorderRadius.circular(20), // Rounded corners
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10,
                    spreadRadius: 5,
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.blue, // Background color for the TabBar
                      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                    ),
                    child: const TabBar(
                      labelColor: Colors.white,
                      unselectedLabelColor: Colors.white60,
                      tabs: [
                        Tab(icon: Icon(Icons.home), text: 'HOME'),
                        Tab(icon: Icon(Icons.star), text: 'SUBSCRIPTION'),
                        Tab(icon: Icon(Icons.currency_bitcoin), text: 'COINS'),
                        Tab(icon: Icon(Icons.emoji_emotions_rounded), text: 'EMOJIS'),
                        Tab(icon: Icon(Icons.table_restaurant_rounded), text: 'TABLES'),
                        Tab(icon: Icon(Icons.card_giftcard_outlined), text: 'CARDS'),
                        Tab(icon: Icon(Icons.folder_special), text: 'SPECIAL'),
                        Tab(icon: Icon(Icons.redeem), text: 'REDEEM'),

                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
                        color: Colors.white, // Background color for the TabBarView
                      ),
                      child: TabBarView(
                        children: [
                          Center(child: Text('Home Tab Content')),
                          Center(child: Text('Favorites Tab Content')),
                          Center(child: Text('Settings Tab Content')),
                          Center(child: Text('Home Tab Content')),
                          Center(child: Text('Favorites Tab Content')),
                          Center(child: Text('Settings Tab Content')),
                          Center(child: Text('Home Tab Content')),
                          Center(child: Text('Favorites Tab Content')),
                        
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
    );
  }
}
