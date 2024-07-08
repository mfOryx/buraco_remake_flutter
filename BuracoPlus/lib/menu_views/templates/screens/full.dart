// return Scaffold(
//       extendBodyBehindAppBar: true,
//       body: Center(
//         child: Stack(
//           alignment: Alignment.center,
//           children: [
//             GestureDetector(
//               onTap: () {
//                 if (isMenuVisible) {
//                   setState(() {
//                     isMenuVisible = false;
//                   });
//                 }
//               },
//               child: Container(
//                 decoration: BoxDecoration(
//                   gradient: colors.gradient,
//                 ),
//                 child: Container(
//                   decoration: const BoxDecoration(
//                     image: DecorationImage(
//                         image:
//                             AssetImage('assets/spade_transparent_v2.png.webp'),
//                         fit: BoxFit.scaleDown,
//                         alignment: Alignment.bottomLeft),
//                     color: Colors.transparent,
//                   ),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Align(
//                         alignment: Alignment.center,
//                         child: Container(
//                           width: screenSize.width * 0.4,
//                           padding: const EdgeInsets.all(10.0),
//                           decoration: BoxDecoration(
//                               color: Colors.white.withOpacity(0.3),
//                               borderRadius: BorderRadius.circular(20.0),
//                               border: Border.all(color: Colors.white)),
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Text(
//                                 translationManager.translate("hello"),
//                                 style: const TextStyle(color: Colors.white),
//                                 textAlign: TextAlign.center,
//                               ),
//                               Container(
//                                 margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
//                                 child: TextField(
//                                   controller: _usernameController,
//                                   style: const TextStyle(color: Colors.white),
//                                   decoration: InputDecoration(
//                                     hintText: translationManager
//                                         .translate('txtEmailNickname'),
//                                     hintStyle:
//                                         const TextStyle(color: Colors.white),
//                                     prefixIcon: const Icon(
//                                       Icons.person,
//                                       color: Colors.white,
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                               const SizedBox(height: 5),
//                               Container(
//                                 margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
//                                 child: TextField(
//                                   obscureText: _isObscured,
//                                   controller: _passwordController,
//                                   style: const TextStyle(color: Colors.white),
//                                   decoration: InputDecoration(
//                                     hintText: translationManager
//                                         .translate('txtPassword'),
//                                     hintStyle:
//                                         const TextStyle(color: Colors.white),
//                                     prefixIcon: const Icon(
//                                       Icons.lock,
//                                       color: Colors.white,
//                                     ),
//                                     contentPadding: const EdgeInsets.symmetric(
//                                         vertical: 10, horizontal: 10),
//                                     suffixIcon: IconButton(
//                                       onPressed: () {
//                                         setState(() {
//                                           _isObscured = !_isObscured;
//                                         });
//                                       },
//                                       icon: Icon(
//                                         _isObscured
//                                             ? Icons.visibility_off
//                                             : Icons.visibility,
//                                         color: Colors.white,
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                               const SizedBox(height: 5),
//                               Row(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: [
//                                   ElevatedButton(
//                                     onPressed: _sendLogin,
//                                     style: ElevatedButton.styleFrom(
//                                       // Impostazioni base del bottone, incluso il background
//                                       foregroundColor:
//                                           const Color.fromRGBO(92, 70, 154, 1),
//                                       backgroundColor: Colors.white,
//                                     ).copyWith(
//                                       side: WidgetStateProperty.resolveWith<
//                                           BorderSide>(
//                                         (Set<WidgetState> states) {
//                                           if (states
//                                               .contains(WidgetState.pressed)) {
//                                             return const BorderSide(
//                                               color: Colors.black,
//                                               width: 1.5,
//                                             );
//                                           }
//                                           return const BorderSide(
//                                             color:
//                                                 Color.fromRGBO(92, 70, 154, 1),
//                                             width: 1.5,
//                                           );
//                                         },
//                                       ),
//                                       shape: WidgetStateProperty.all<
//                                           RoundedRectangleBorder>(
//                                         RoundedRectangleBorder(
//                                           borderRadius: BorderRadius.circular(
//                                               10), // Aggiusta il raggio se necessario
//                                         ),
//                                       ),
//                                     ),
//                                     child: Text(
//                                       translationManager
//                                           .translate('txtLogin')
//                                           .toUpperCase(),
//                                       style: const TextStyle(
//                                         color: Color.fromRGBO(92, 70, 154, 1),
//                                       ),
//                                     ),
//                                   )
//                                 ],
//                               ),
//                               const SizedBox(height: 5),
//                               GestureDetector(
//                                 onTap: () {},
//                                 child: Text(
//                                   translationManager.translate('ForgotPW?'),
//                                   style: const TextStyle(
//                                     color: Colors.white,
//                                     decoration: TextDecoration.underline,
//                                     decorationColor: Colors.white,
//                                     fontSize: 10.0,
//                                   ),
//                                   textAlign: TextAlign.center,
//                                 ),
//                               )
//                             ],
//                           ),
//                         ),
//                       ),
//                       const SizedBox(height: 5),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           if (Platform.isIOS || Platform.isMacOS) ...[
//                             Column(children: [
//                               IconButton(
//                                 icon: SvgPicture.asset(
//                                   'assets/socialMediaIcons/apple.svg',
//                                   width: 40,
//                                   height: 40,
//                                   color: Colors.white,
//                                 ),
//                                 onPressed: () {
//                                   Navigator.push(
//                                       this.context,
//                                       MaterialPageRoute(
//                                           builder: (context) => const Home()));
//                                 },
//                               ),
//                             ]),
//                             const SizedBox(width: 40),
//                             Column(
//                               children: [
//                                 IconButton(
//                                   icon: SvgPicture.asset(
//                                     'assets/socialMediaIcons/gamecenter.svg',
//                                     width: 40,
//                                     height: 40,
//                                   ),
//                                   onPressed: () {
//                                     Navigator.push(
//                                         context,
//                                         MaterialPageRoute(
//                                             builder: (context) =>
//                                                 const Home()));
//                                   },
//                                 ),
//                               ],
//                             ),
//                           ],
//                           if (Platform.isAndroid) ...[
//                             Column(
//                               children: [
//                                 IconButton(
//                                   icon: SvgPicture.asset(
//                                     'assets/socialMediaIcons/gmail.svg',
//                                     width: 40,
//                                     height: 40,
//                                   ),
//                                   onPressed: () {
//                                     Navigator.push(
//                                         context,
//                                         MaterialPageRoute(
//                                             builder: (context) =>
//                                                 const Home()));
//                                   },
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),

//             Positioned(
//               top: MediaQuery.of(context).size.height < 550 ? 10.0 : 20.0,
//               left: 0,
//               right: 0,
//               child: Image.asset(
//                 'assets/logo-and-cards.png',
//                 width: 100,
//                 height: 60,
//               ),
//             ),
//             OptionsButton(toggleMenu: _toggleMenu),
//             //privacy section
//             PrivacyButton(toggleMenu: _toggleMenu),
//             PrivacyMenu(
//               isMenuVisible: isMenuVisible,
//               launchURL: (url) async {
//                 if (!await launchUrl(url)) {
//                   throw 'Could not launch $url';
//                 }
//               },
//             ),
//             Positioned(
//               width: 80.0,
//               bottom: 40.0,
//               right: Directionality.of(context) == TextDirection.rtl
//                   ? 40
//                   : null, // Set left or right based on text direction
//               left: Directionality.of(context) == TextDirection.rtl
//                   ? null
//                   : 40, // Only one will be set at a time

//               //left: Platform.isMacOS ? 40.0 : 40.0,
//               child: FloatingActionButton(
//                 heroTag: null,
//                 onPressed: () {
//                   //exit(0);
//                 },
//                 backgroundColor: Colors.transparent,
//                 splashColor: Colors.transparent,
//                 elevation: 0.0,
//                 child: Row(children: [
//                   Transform.rotate(
//                     angle: 1.6,
//                     child: Image.asset(
//                       'assets/simple_arrow_down.png',
//                       width: 30,
//                       height: 30,
//                     ),
//                   ),
//                   Text(translationManager.translate('txtQuit').toUpperCase(),
//                       style: const TextStyle(color: Colors.white)),
//                 ]),
//               ),
//             ),
//             Positioned(
//               width: 80.0,
//               bottom: 40.0,
//               left: Directionality.of(context) == TextDirection.rtl
//                   ? 40
//                   : null, // Set left or right based on text direction
//               right: Directionality.of(context) == TextDirection.rtl
//                   ? null
//                   : 40, // Only one will be set at a time
//               child: FloatingActionButton(
//                 heroTag: null,
//                 onPressed: () {
//                   Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                           builder: (context) => const CreateTableSP()));
//                 },
//                 backgroundColor: Colors.transparent,
//                 splashColor: Colors.transparent,
//                 elevation: 0.0,
//                 child: Row(
//                   children: [
//                     Text(translationManager.translate('txtTrain').toUpperCase(),
//                         style: const TextStyle(color: Colors.white)),
//                     Transform.rotate(
//                       angle: -1.6,
//                       child: Image.asset(
//                         'assets/simple_arrow_down.png',
//                         width: 30,
//                         height: 30,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }