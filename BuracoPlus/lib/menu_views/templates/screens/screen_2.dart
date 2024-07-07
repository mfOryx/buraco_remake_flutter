// import 'package:flutter/material.dart'
//     show
//         BoxDecoration,
//         BuildContext,
//         Center,
//         Colors,
//         Column,
//         Container,
//         FontStyle,
//         FontWeight,
//         Icon,
//         Icons,
//         MainAxisAlignment,
//         MainAxisSize,
//         MaterialPageRoute,
//         Navigator,
//         SizedBox,
//         StatelessWidget,
//         Text,
//         TextAlign,
//         TextStyle,
//         Widget;
//
// //class Screen2 extends StatefulWidget {
// class Screen2 extends StatelessWidget {
//   const Screen2({super.key});
//
// //   @override
// //   State<Screen2> createState() {
// //     return _Screen2State();
// //   }
// // }
//
// // class _Screen2State extends State<Screen2> {
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: const BoxDecoration(
//         gradient: italianGradient,
//       ),
//       child: SizedBox(
//         width: double.infinity,
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             mainAxisSize: MainAxisSize.min,
//             children: <Widget>[
//               ImmagineSfocata(
//                 custSfocatura: Colors.white.withOpacity(0.2),
//               ),
//               const SizedBox(
//                 height: 30,
//               ),
//               const Titolo(
//                 custTitolo: 'Pagina 2',
//               ),
//               const SizedBox(
//                 height: 30,
//               ),
//               GradientTextButton(
//                 custGradiente: gradButton1,
//                 custTestoBottone: const Testo(
//                   custTesto: 'Schermo 1',
//                 ),
//                 custClick: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => const TopContainer(
//                         color1: Colors.green,
//                         color2: Colors.white,
//                         color3: Colors.red,
//                       ),
//                     ),
//                   );
//                 },
//                 custLongClick: null,
//                 custIcon: const Icon(Icons.arrow_back_ios),
//               ),
//               const SizedBox(
//                 height: 30,
//               ),
//               const Text(
//                 'prova testo',
//                 //style: GoogleFonts.lato(
//                 ////style: GoogleFonts.getFont('Lato'),
//                 style: TextStyle(
//                   color: Colors.red,
//                   fontSize: 30,
//                   fontStyle: FontStyle.italic,
//                   fontFamily:
//                       'assets/fonts/google_fonts/IbarraRealNova-Bold.ttf',
//                   //'assets/fonts/google_fonts/IbarraRealNova-BoldItalic.ttf',
//                   //'assets/fonts/google_fonts/IbarraRealNova-Italic-VariableFont_wght.ttf',
//                   //'assets/fonts/google_fonts/IbarraRealNova-Italic.ttf',
//                   //'assets/fonts/google_fonts/IbarraRealNova-Medium.ttf',
//                   //'assets/fonts/google_fonts/IbarraRealNova-Medium.ttf',
//                   //'assets/fonts/google_fonts/IbarraRealNova-MediumItalic.ttf',
//                   //'assets/fonts/google_fonts/IbarraRealNova-Regular.ttf',
//                   //'assets/fonts/google_fonts/IbarraRealNova-SemiBoldItalic.ttf',
//                   //'assets/fonts/google_fonts/IbarraRealNova-SemiBoldItalic.ttf',
//                   //fontWeight: FontWeight.w100, //: 'Thin',
//                   //fontWeight: FontWeight.w200, //: 'ExtraLight',
//                   //fontWeight: FontWeight.w300, //: 'Light',
//                   fontWeight: FontWeight.w400, //: 'Regular',
//                   //fontWeight: FontWeight.w500, //: 'Medium',
//                   //fontWeight: FontWeight.w600, //: 'SemiBold',
//                   //fontWeight: FontWeight.w700, //: 'Bold',
//                   //fontWeight: FontWeight.w800, //: 'ExtraBold',
//                   //fontWeight: FontWeight.w900, //: 'Black',
//                 ),
//                 textAlign: TextAlign.right,
//                 selectionColor: Colors.red,
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
