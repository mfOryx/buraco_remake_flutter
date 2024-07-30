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
    padding: EdgeInsets.all(0.0),
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
        gradientButton(
          imagePath: 'assets/menuIcons/ic_clubs.png', // Replace with your image asset
          text: 'HOME',
          onPressed: () {
            // Define the action for the button
            _onTabTapped(0);
          },
        ),

        gradientButton(
          imagePath: 'assets/menuIcons/ic_clubs.png', // Replace with your image asset
          text: 'SUBSCRIPTION',
          onPressed: () {
            // Define the action for the button
            _onTabTapped(1);
          },
        ),

        // Add more icons if needed
      ],
    ),
  );
}

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
        ),
        onPressed: onPressed,
        child: Container(
          padding: EdgeInsets.all(8),
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
                margin: const EdgeInsets.symmetric(horizontal: 8.0),
                child: ClipRRect(
                  // borderRadius: BorderRadius.circular(12.0), // Rounded image
                  child: Image.asset(
                    imagePath, // Image path from the function argument
                    width: 40,
                    height: 40,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Text(
                text, // Text from the function argument
                style: const TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }}


  // ################################################################################
  // ###############################   CONTENT WIDGETS    ###########################
  // #################################################################################


//######################################### HOME VIEW content ############################
Widget homeView({required double screenWidth,
  required double screenHeight,
  required bool isIpad,
  required bool isIphone,}){

  return Expanded(
    child: Center(
      child: shopItem(screenWidth: screenWidth, screenHeight: screenHeight, isIpad: isIpad, isIphone: isIphone),
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

//

Widget shopItem({required double screenWidth,
  required double screenHeight,
  required bool isIpad,
  required bool isIphone,}) {
  return Container(
    width:300,
    height: 300,
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
            width: 300,
            height: 210, // 70% of 300
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  // Placeholder for the image
                  Container(
                    width: 170,
                    height: 170,
                    color: Colors.white, // Replace with an actual image
                    child: Icon(Icons.image),
                  ),
                  SizedBox(width: 10),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Title Text',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Subtitle Text',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black54,
                        ),
                      ),
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
              ElevatedButton(
                onPressed: () {
                  // Action for "Gift" button
                },
                child: Text('Gift'),
              ),
              SizedBox(width: 10),
              ElevatedButton(
                onPressed: () {
                  // Action for "Products" button
                },
                child: Text('Products'),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}