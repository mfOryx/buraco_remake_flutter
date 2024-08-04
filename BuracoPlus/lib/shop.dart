import 'package:flutter/material.dart';
import 'shop_view.dart';

class ShopView extends StatefulWidget {
  const ShopView({super.key});

  @override
  State<ShopView> createState() => _ShopViewState();
}

class _ShopViewState extends State<ShopView> {
  @override
  void initState() {
    super.initState();
    // checkDeviceType();
  }
  // bool isIphone = false;
  // bool isIpad = false;
  //
  // Future<void> checkDeviceType() async {
  //   DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  //   IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
  //
  //   if (iosInfo.model.toLowerCase().contains('ipad')) {
  //     isIpad = true;
  //     if (kDebugMode) {
  //       print('This device is an iPad');
  //     }
  //   } else if (iosInfo.model.toLowerCase().contains('iphone')) {
  //     isIphone = true;
  //     if (kDebugMode) {
  //       print('This device is an iPhone');
  //     }
  //   } else {
  //     if (kDebugMode) {
  //       print('This device is neither iPhone nor iPad');
  //     }
  //   }
  //   setState(() {});
  // }

  @override
  Widget build(BuildContext context) {
    // double screenWidth =  MediaQuery.of(context).size.width;
    // double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: MainShopDialog(),
    );
  }
}
