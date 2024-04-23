import 'package:flutter/material.dart';

class GameplaySP extends StatefulWidget {
  const GameplaySP({super.key});

  @override
  State<GameplaySP> createState() => _GameplaySPState();
}

class _GameplaySPState extends State<GameplaySP> {
  List<bool> isTapped = List.generate(13, (_) => false);
  double yOffset = 0;
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
                  width: 70,
                  height: 75,
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
                        left: 20,
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
                      height: 75,
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
                      width: 500,
                      height: 75,
                      child: Stack(
                        children: [
                          Container(
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
                          // Stack(
                          //   children: List.generate(13, (index) {
                          //     return AnimatedPositioned(
                          //       duration: Duration(milliseconds: 300),
                          //       curve: Curves.easeInOut,
                          //       left: 5 + (index * 15),
                          //       top: isTapped[index] ? yOffset : 5,
                          //       child: GestureDetector(
                          //         onTap: () {
                          //           setState(() {
                          //             isTapped[index] = !isTapped[index];
                          //             yOffset = isTapped[index] ? -20 : 0;
                          //           });
                          //         },
                          //         child: Image.asset(
                          //           'assets/Spade${index + 2}.png',
                          //           fit: BoxFit.fill,
                          //           width: 50,
                          //           height: 65,
                          //         ),
                          //       ),
                          //     );
                          //   }),
                          // ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: SizedBox(
                    width: 754,
                    height: 75,
                    child: Stack(
                      children: [
                        Container(
                          width: 640,
                          height: 75,
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
                        // Cards stack
                        Stack(
                          children: List.generate(13, (index) {
                            return AnimatedPositioned(
                              duration: Duration(milliseconds: 300),
                              left: 5 + (index * 35),
                              top: isTapped[index] ? yOffset : 5,
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    isTapped[index] = !isTapped[index];
                                    yOffset = isTapped[index] ? -25 : 0;
                                  });
                                },
                                child: Image.asset(
                                  'assets/Spade${index + 2}.png',
                                  fit: BoxFit.fill,
                                  width: 50,
                                  height: 65,
                                ),
                              ),
                            );
                          }),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}