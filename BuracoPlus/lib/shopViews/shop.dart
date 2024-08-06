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
   
  }


  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: MainShopDialog(),
    );
  }
}
