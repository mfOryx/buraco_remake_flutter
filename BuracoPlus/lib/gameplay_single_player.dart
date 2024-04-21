import 'package:flutter/material.dart';

class GameplaySP extends StatefulWidget {
  const GameplaySP({super.key});

  @override
  State<GameplaySP> createState() => _GameplaySPState();
}

class _GameplaySPState extends State<GameplaySP> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF344266),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CircleAvatar(
                      radius: 25,
                      backgroundImage: AssetImage('assets/blankAvatar_2.png'),
                    ),
                    SizedBox(width: 12),
                    Text(
                      'ABC XYZ',
                      style: TextStyle(fontSize: 10, color: Colors.white),
                    ),
                  ],
                ),
                const SizedBox(width: 12),
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Stack(
                    children: [
                      Container(
                        width: 70,
                        height: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(color: Colors.white38, width: 1),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.white38,
                              spreadRadius: -2,
                              blurRadius: 4,
                              offset: Offset(0, 0),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        top: 40,
                        left: 25,
                        child: Container(
                          width: 20,
                          height: 20,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                          ),
                          child: const Center(
                            child: Text(
                              '99',
                              style: TextStyle(fontSize: 10, color: Colors.black),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 12),
                Container(
                  width: 180,
                  height: 30,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 8.0),
                        child: Text(
                          'ABC XYZ',
                          style: TextStyle(fontSize: 12, color: Colors.white),
                        ),
                      ),
                      Spacer(),
                      Padding(
                        padding: EdgeInsets.only(right: 8.0),
                        child: Text(
                          '0/0',
                          style: TextStyle(fontSize: 12, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 350,
                  height: 200,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.withOpacity(0.2), width: 2),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.white.withOpacity(0),
                        spreadRadius: 3,
                        blurRadius: 7,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: const Center(
                    child: Text(
                      '',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(width: 2.0),
                Container(
                  width: 350,
                  height: 200,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.withOpacity(0.2), width: 2),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.white.withOpacity(0),
                        spreadRadius: 3,
                        blurRadius: 7,
                        offset: const Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: const Center(
                    child: Text(
                      '',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 5.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 70,
                      height: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: Colors.white38, width: 1),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.white38,
                            spreadRadius: -2,
                            blurRadius: 4,
                            offset: Offset(0, 0),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 5.0),
                    SizedBox(
                      width: 450,
                      height: 100,
                      child: Stack(
                        children: [
                          Container(
                            width: 450,
                            height: 80,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(color: Colors.white38, width: 1),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.white38,
                                  spreadRadius: -2,
                                  blurRadius: 4,
                                  offset: Offset(0, 0),
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            left: 105,
                            top: 30,
                            child: Image.asset(
                              'assets/Spade2.png',
                              fit: BoxFit.fill,
                              width: 50,
                              height: 50,
                            ),
                          ),
                          // Positioned(
                          //   left: 65,
                          //   top: 30,
                          //   child: Image.asset(
                          //     'assets/Spade3.png',
                          //     fit: BoxFit.fill,
                          //     width: 50,
                          //     height: 50,
                          //   ),
                          // ),
                          // Positioned(
                          //   left: 75,
                          //   top: 30,
                          //   child: Image.asset(
                          //     'assets/Spade4.png',
                          //     fit: BoxFit.fill,
                          //     width: 50,
                          //     height: 50,
                          //   ),
                          // ),
                          // Positioned(
                          //   left: 85,
                          //   top: 30,
                          //   child: Image.asset(
                          //     'assets/Spade5.png',
                          //     fit: BoxFit.fill,
                          //     width: 50,
                          //     height: 50,
                          //   ),
                          // ),
                          // Positioned(
                          //   left: 95,
                          //   top: 30,
                          //   child: Image.asset(
                          //     'assets/Spade6.png',
                          //     fit: BoxFit.fill,
                          //     width: 50,
                          //     height: 50,
                          //   ),
                          // ),
                          // Positioned(
                          //   left: 105,
                          //   top: 30,
                          //   child: Image.asset(
                          //     'assets/Spade7.png',
                          //     fit: BoxFit.fill,
                          //     width: 50,
                          //     height: 50,
                          //   ),
                          // ),
                          // Positioned(
                          //   left: 115,
                          //   top: 30,
                          //   child: Image.asset(
                          //     'assets/Spade8.png',
                          //     fit: BoxFit.fill,
                          //     width: 50,
                          //     height: 50,
                          //   ),
                          // ),
                          // Positioned(
                          //   left: 125,
                          //   top: 30,
                          //   child: Image.asset(
                          //     'assets/Spade9.png',
                          //     fit: BoxFit.fill,
                          //     width: 50,
                          //     height: 50,
                          //   ),
                          // ),
                          // Positioned(
                          //   left: 135,
                          //   top: 30,
                          //   child: Image.asset(
                          //     'assets/Spade10.png',
                          //     fit: BoxFit.fill,
                          //     width: 50,
                          //     height: 50,
                          //   ),
                          // ),
                          // Positioned(
                          //   left: 145,
                          //   top: 30,
                          //   child: Image.asset(
                          //     'assets/SpadeJ.png',
                          //     fit: BoxFit.fill,
                          //     width: 50,
                          //     height: 50,
                          //   ),
                          // ),
                          // Positioned(
                          //   left: 155,
                          //   top: 30,
                          //   child: Image.asset(
                          //     'assets/SpadeQ.png',
                          //     fit: BoxFit.fill,
                          //     width: 50,
                          //     height: 50,
                          //   ),
                          // ),
                          // Positioned(
                          //   left: 165,
                          //   top: 30,
                          //   child: Image.asset(
                          //     'assets/SpadeK.png',
                          //     fit: BoxFit.fill,
                          //     width: 50,
                          //     height: 50,
                          //   ),
                          // ),
                          // Positioned(
                          //   left: 175,
                          //   top: 30,
                          //   child: Image.asset(
                          //     'assets/SpadeA.png',
                          //     fit: BoxFit.fill,
                          //     width: 50,
                          //     height: 50,
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Container(
              width: 450,
              height: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: Colors.white38, width: 1),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.white38,
                    spreadRadius: -2,
                    blurRadius: 4,
                    offset: Offset(0, 0),
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