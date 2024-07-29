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
                boxShadow: const [
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
                    decoration: const BoxDecoration(
                      color: Color.fromRGBO(227, 227, 227, 1.0), // Background color for the TabBar
                      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                    ),
                    child:  TabBar(
                      
                      labelColor: Colors.white,
                      unselectedLabelColor: Colors.white60,
                      tabs: [
                        Tab(

                          icon:   Image.asset("assets/menuIcons/ic_clubs.png",height:(isIphone)?24:32),
                          child: Text('HOME', style: TextStyle(color: Color.fromRGBO(0, 0, 0, 1.0))),
                        ),
                        Tab(
                          icon:   Image.asset("assets/menuIcons/ic_contacts.png",height:(isIphone)?24:32),
                          child: Text('SUBSCRIPTION', style: TextStyle(color: Color.fromRGBO(0, 0, 0, 1.0))),
                        ),
                        Tab(
                          icon:   Image.asset("assets/menuIcons/ic_clubs.png",height:(isIphone)?24:32),
                          child: Text('COINS', style: TextStyle(color: Color.fromRGBO(0, 0, 0, 1.0))),
                        ),
                        Tab(
                          icon:   Image.asset("assets/menuIcons/ic_clubs.png",height:(isIphone)?24:32),
                          child: Text('EMOJIS', style: TextStyle(color: Color.fromRGBO(0, 0, 0, 1.0))),
                        ),
                        Tab(
                          icon:   Image.asset("assets/menuIcons/ic_clubs.png",height:(isIphone)?24:32),
                          child: Text('TABLES', style: TextStyle(color: Color.fromRGBO(0, 0, 0, 1.0))),
                        ),
                        Tab(
                          icon:   Image.asset("assets/menuIcons/ic_clubs.png",height:(isIphone)?24:32),
                          child: Text('CARDS', style: TextStyle(color: Color.fromRGBO(0, 0, 0, 1.0))),
                        ),
                        Tab(
                          icon:   Image.asset("assets/menuIcons/ic_clubs.png",height:(isIphone)?24:32),
                          child: Text('SPECIAL', style: TextStyle(color: Color.fromRGBO(0, 0, 0, 1.0))),
                        ),
                        Tab(
                          icon:   Image.asset("assets/menuIcons/ic_clubs.png",height:(isIphone)?24:32),
                          child: Text('REDEEM', style: TextStyle(color: Color.fromRGBO(0, 0, 0, 1.0))),
                        ),


                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
                        color: Colors.white, // Background color for the TabBarView
                      ),
                      child: const TabBarView(
                        children: [
                          Center(child: Text('Home Tab Content Abdullah')),
                          Center(child: Text('Favorites Tab Content Abdullah')),
                          Center(child: Text('Settings Tab Content Abdullah')),
                          Center(child: Text('Home Tab Content Abdullah')),
                          Center(child: Text('Favorites Tab Content Abdullah')),
                          Center(child: Text('Settings Tab Content Abdullah')),
                          Center(child: Text('Home Tab Content Abdullah')),
                          Center(child: Text('Favorites Tab Content Abdullah')),
                        
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
