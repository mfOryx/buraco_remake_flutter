import 'package:flutter/material.dart';


 
class MainShopDialog extends StatefulWidget {
  final bool isIphone;
  final bool isIpad;
  final double screenWidth;
  final double screenHeight;
  
  MainShopDialog({
    required this.isIphone,
    required this.isIpad,
    required this.screenWidth,
    required this.screenHeight,


  });

  @override
  State<MainShopDialog> createState() => _MainShopDialogState();
}

class _MainShopDialogState extends State<MainShopDialog> {
  // TABS RELATED
  int _selectedIndex = 0;

   // contains the views for tabs content
  late final List<Widget> _tabs;

  @override
  void initState() {
    super.initState();
    // Initialize the _tabs list with the parameters from the widget
    _tabs = [
      homeView(
        screenWidth: widget.screenWidth,
        screenHeight: widget.screenHeight,
        isIpad: widget.isIpad,
        isIphone: widget.isIphone,
      ),
      subscriptionView(
        screenWidth: widget.screenWidth,
        screenHeight: widget.screenHeight,
        isIpad: widget.isIpad,
        isIphone: widget.isIphone,
      ),
    ];
  }
 

  void _onTabTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  //END

  @override
  Widget build(BuildContext context) {
    return Center(

      child: Container(
        width: MediaQuery.of(context).size.width * 0.95,
        height: MediaQuery.of(context).size.height * 0.90,
        decoration: BoxDecoration(
          color: Color.fromRGBO(224, 224, 224, 1.0),
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
            bottomRight: Radius.circular(16.0), // No border radius for the bottom-right corner
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
            sideBar(context: context),
            //  Content Panel
            Expanded(
              child: Stack(
                children: [
                  // Main Content Panel with Rounded Corners
                  Container(
                    margin: const EdgeInsets.only(left: 0.0, right: 0.0, top: 0.0),
                    child: Column(
                      children: [
                        // Top Bar with Chips and Exit Button
                      topBar(),
                        // Main Content panel Goes Here
                        _tabs[_selectedIndex]  ,
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

  // ################################################################################
  // ###############################   LAYOUT WIDGETS    ###########################
  // #################################################################################

  Widget topBar(){
  return  Container(
    height:90,
    //padding: EdgeInsets.all(0.0),
    decoration: const BoxDecoration(

      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(0.0),
        topRight: Radius.circular(16.0),
        bottomLeft: Radius.circular(0.0),
        bottomRight: Radius.circular(0.0), // No border radius for the bottom-right corner
      ),
      gradient:
      LinearGradient(
        colors: [
          Color(0xFF7e2d79),
          // Purple-ish
          Color(0xFF507aa0)  // Pink-ish
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

Widget sideBar({required BuildContext context}){
  return  Container(
    decoration: const BoxDecoration(
      gradient: LinearGradient(
        colors: [
          Color(0xFF7e2d79),
        // Purple-ish
          Color(0xFF507aa0)  // Pink-ish
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
        bottomRight: Radius.circular(0.0), // No border radius for the bottom-right corner
      ),
    ),
    width: MediaQuery.of(context).size.width * 0.2,

    child: Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(height: 160,),

       //############################### HOME BUTTON ###############################
        Padding(
          padding: const EdgeInsets.only(top:0.0,bottom: 8.0),
          child: gradientButton(
            imagePath: 'assets/menuIcons/ic_clubs.png', // Replace with your image asset
            text: 'HOME',
            onPressed: () {
              // Define the action for the button
              _onTabTapped(0);
            },
          ),
        ),
        //############################### SUBSCRIPTION BUTTON ######################
        Padding(
          padding: const EdgeInsets.only(top:0.0,bottom: 8.0),
          child: gradientButton(
            imagePath: 'assets/shop/subscription.png', // Replace with your image asset
            text: 'HOME',
            onPressed: () {
              // Define the action for the button
              _onTabTapped(0);
            },
          ),
        ),
        //############################### COINS BUTTON #############################
        Padding(
          padding: const EdgeInsets.only(top:0.0,bottom: 8.0),
          child: gradientButton(
            imagePath: 'assets/shop/coins.png', // Replace with your image asset
            text: 'HOME',
            onPressed: () {
              // Define the action for the button
              _onTabTapped(0);
            },
          ),
        ),
        //############################### EMOJI BUTTON #############################
        Padding(
          padding: const EdgeInsets.only(top:0.0,bottom: 8.0),
          child: gradientButton(
            imagePath: 'assets/shop/emoji.png', // Replace with your image asset
            text: 'HOME',
            onPressed: () {
              // Define the action for the button
              _onTabTapped(0);
            },
          ),
        ),
        //############################### TABLES BUTTON #############################
        Padding(
          padding: const EdgeInsets.only(top:0.0,bottom: 8.0),
          child: gradientButton(
            imagePath: 'assets/shop/tables.png', // Replace with your image asset
            text: 'HOME',
            onPressed: () {
              // Define the action for the button
              _onTabTapped(0);
            },
          ),
        ),
        //############################### CARDS BUTTON #############################
        Padding(
          padding: const EdgeInsets.only(top:0.0,bottom: 8.0),
          child: gradientButton(
            imagePath: 'assets/shop/cards.png', // Replace with your image asset
            text: 'HOME',
            onPressed: () {
              // Define the action for the button
              _onTabTapped(0);
            },
          ),
        ),
        //############################### SPECIAL BUTTON #############################
        Padding(
          padding: const EdgeInsets.only(top:0.0,bottom: 8.0),
          child: gradientButton(
            imagePath: 'assets/shop/special.png', // Replace with your image asset
            text: 'HOME',
            onPressed: () {
              // Define the action for the button
              _onTabTapped(0);
            },
          ),
        ),
        //############################### REDEEM BUTTON #############################
        Padding(
          padding: const EdgeInsets.only(top:0.0,bottom: 0.0),
          child: gradientButton(
            imagePath: 'assets/shop/redeem.png', // Replace with your image asset
            text: 'HOME',
            onPressed: () {
              // Define the action for the button
              _onTabTapped(0);
            },
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
}) {
    return Container(
     
      // padding: EdgeInsets.only(top: 12.0,bottom: 12), // Padding around the button
      child: ElevatedButton(

        style: ElevatedButton.styleFrom(
         

          
          foregroundColor: Colors.transparent,
          backgroundColor: Colors.transparent,
          elevation: 0, // Remove shadow
          side: BorderSide.none, // Remove border
          // Color of the text
          padding: const EdgeInsets.all(0), // Remove default padding
        ).copyWith(
          overlayColor: MaterialStateProperty.resolveWith<Color?>(
                (Set<MaterialState> states) {
              if (states.contains(MaterialState.pressed)) {
                return Colors.purple.withOpacity(1); // Ripple color when pressed
              }
              return null; // Default ripple color if not pressed
            },
          ),
        
        ),
        onPressed: onPressed,
        child: Container(
          height: 66,
          padding: EdgeInsets.all(6),
          width:200,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color.fromRGBO(255, 255, 255, 0.5), Color.fromRGBO(
                  255, 255, 255, 0.2)],
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
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(width: 6,),
              Text(
                text, // Text from the function argument
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }}


//######################################### SHOP ITEM #####################

Widget shopItem({required double screenWidth,
  required double screenHeight,
  required bool isIpad,
  required bool isIphone,}) {

  double containerWidth,containerHeight,bottomOffset = 60;

  return
    Transform.scale(
      scale: 0.90,
      child: Container(
      width:containerWidth = 300,
      height: containerHeight = 230,


      decoration: BoxDecoration(
        color: Colors.deepPurple,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        children: [




          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              width: containerWidth,
              height: containerHeight-bottomOffset, // 70% of 300
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
                      padding: EdgeInsets.only(left: 4.0),
                      width: 130,                   
                      height: 130,
                      color: Colors.white, // Replace with an actual image
                      child: Image.asset("assets/menuIcons/blankAvatar_2.png"),
                    ),
                    const SizedBox(width: 10),
                   // product name, coins and
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                    //  crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        const Text(
                          'Product Name',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.asset(
                              "assets/shop/coins.png", // Image path from the function argument
                              width: 30,
                              height: 30,
                              fit: BoxFit.cover,
                            ),
                            const Text(
                              '8127653611',
                              style: TextStyle(
                                fontSize: 20,
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
          Positioned(
            bottom: 10,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  style: ButtonStyle(
                   // backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                    fixedSize: MaterialStateProperty.all<Size>(Size(120, 50)),
                  ),
                  onPressed: () {
                    // Action for "Gift" button
                  },
                  child: Text(
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      'BUY'),
                ),//BUY
                Padding(
                  padding: EdgeInsets.only(left: 8.0,right: 8.0),
                  child: Container(
                    width: 3,
                    height: 34,
                    color: Colors.white,
                  ),
                )      ,//DIVIDER
                TextButton(
                  style: ButtonStyle(
                    //backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                    fixedSize: MaterialStateProperty.all<Size>(Size(120, 50)),
                  ),
                  onPressed: () {
                    // Action for "Gift" button

                  },
                  child: Text(
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      'GIFT'),
                ), //GIFT
              ],
            ),
          ),
          Positioned(
            top: 0,
            left: 160,
            right: 0,
            child: Container(

              height: 30, // 70% of 300
              decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(0), // No radius for bottom-right corner
                ),
              ),

              child :Align(
                alignment: Alignment.center,
                child: Text("popular",
                style: TextStyle(

                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16
                ),
                ),
              )
            ),
          ),


        ],
      ),
        ),
    );
}

  // ################################################################################
  // ###############################   CONTENT WIDGETS    ###########################
  // #################################################################################


//######################################### HOME VIEW content ########################
Widget homeView({required double screenWidth,
  required double screenHeight,
  required bool isIpad,
  required bool isIphone,})
{
  return  Expanded(
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(2),
              child: shopItem(screenWidth: screenWidth, screenHeight: screenHeight, isIpad: isIpad, isIphone: isIphone),
            ),
            Padding(
              padding: const EdgeInsets.all(2),
              child: shopItem(screenWidth: screenWidth, screenHeight: screenHeight, isIpad: isIpad, isIphone: isIphone),
            ),
            Padding(
              padding: const EdgeInsets.all(2),
              child: shopItem(screenWidth: screenWidth, screenHeight: screenHeight, isIpad: isIpad, isIphone: isIphone),
            ),
           
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Padding(
              padding: const EdgeInsets.all(2),
              child: shopItem(screenWidth: screenWidth, screenHeight: screenHeight, isIpad: isIpad, isIphone: isIphone),
            ),
            Padding(
              padding: const EdgeInsets.all(2),
              child: shopItem(screenWidth: screenWidth, screenHeight: screenHeight, isIpad: isIpad, isIphone: isIphone),
            ),
            Padding(
              padding: const EdgeInsets.all(2),
              child: shopItem(screenWidth: screenWidth, screenHeight: screenHeight, isIpad: isIpad, isIphone: isIphone),
            ),

          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(2),
              child: shopItem(screenWidth: screenWidth, screenHeight: screenHeight, isIpad: isIpad, isIphone: isIphone),
            ),
            Padding(
              padding: const EdgeInsets.all(2),
              child: shopItem(screenWidth: screenWidth, screenHeight: screenHeight, isIpad: isIpad, isIphone: isIphone),
            ),
            Padding(
              padding: const EdgeInsets.all(2),
              child: shopItem(screenWidth: screenWidth, screenHeight: screenHeight, isIpad: isIpad, isIphone: isIphone),
            ),

          ],
        ),
      ],
    ),
  );
}

//######################################### SUBSCRIPTION VIEW content #####################

Widget subscriptionView({required double screenWidth,
  required double screenHeight,
  required bool isIpad,
  required bool isIphone,}){

  return Expanded(
    child: Center(
      child: Text('subscriptionView Content Here'),
    ),
  );
}

