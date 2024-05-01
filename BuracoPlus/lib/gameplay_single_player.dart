import 'dart:math';

import 'package:flutter/material.dart';

class GameplaySP extends StatefulWidget {
  const GameplaySP({super.key});

  @override
  State<GameplaySP> createState() => _GameplaySPState();
}

class Card {
  final String cardId;
  final String imagePath;
  Card(this.cardId, this.imagePath);
}

class _GameplaySPState extends State<GameplaySP> with TickerProviderStateMixin {

  List<Card> classic_deck = [
    Card('Spade2_1', 'assets/spadesCards/Spade2.png'), Card('Spade2_2', 'assets/spadesCards/Spade2.png'),
    Card('Spade3_1', 'assets/spadesCards/Spade3.png'), Card('Spade3_2', 'assets/spadesCards/Spade3.png'),
    Card('Spade4_1', 'assets/spadesCards/Spade4.png'), Card('Spade4_2', 'assets/spadesCards/Spade4.png'),
    Card('Spade5_1', 'assets/spadesCards/Spade5.png'), Card('Spade5_2', 'assets/spadesCards/Spade5.png'),
    Card('Spade6_1', 'assets/spadesCards/Spade6.png'), Card('Spade6_2', 'assets/spadesCards/Spade6.png'),
    Card('Spade7_1', 'assets/spadesCards/Spade7.png'), Card('Spade7_2', 'assets/spadesCards/Spade7.png'),
    Card('Spade8_1', 'assets/spadesCards/Spade8.png'), Card('Spade8_2', 'assets/spadesCards/Spade8.png'),
    Card('Spade9_1', 'assets/spadesCards/Spade9.png'), Card('Spade9_2', 'assets/spadesCards/Spade9.png'),
    Card('Spade10_1', 'assets/spadesCards/Spade10.png'), Card('Spade10_2', 'assets/spadesCards/Spade10.png'),
    Card('Spade11_1', 'assets/spadesCards/Spade11.png'), Card('Spade11_2', 'assets/spadesCards/Spade11.png'),
    Card('Spade12_1', 'assets/spadesCards/Spade12.png'), Card('Spade12_2', 'assets/spadesCards/Spade12.png'),
    Card('Spade13_1', 'assets/spadesCards/Spade13.png'), Card('Spade13_2', 'assets/spadesCards/Spade13.png'),
    Card('Spade14_1', 'assets/spadesCards/Spade14.png'), Card('Spade14_2', 'assets/spadesCards/Spade14.png'),
    Card('Club2_1', 'assets/clubsCards/Club2.png'), Card('Club2_2', 'assets/clubsCards/Club2.png'),
    Card('Club3_1', 'assets/clubsCards/Club3.png'), Card('Club3_2', 'assets/clubsCards/Club3.png'),
    Card('Club4_1', 'assets/clubsCards/Club4.png'), Card('Club4_2', 'assets/clubsCards/Club4.png'),
    Card('Club5_1', 'assets/clubsCards/Club5.png'), Card('Club5_2', 'assets/clubsCards/Club5.png'),
    Card('Club6_1', 'assets/clubsCards/Club6.png'), Card('Club6_2', 'assets/clubsCards/Club6.png'),
    Card('Club7_1', 'assets/clubsCards/Club7.png'), Card('Club7_2', 'assets/clubsCards/Club7.png'),
    Card('Club8_1', 'assets/clubsCards/Club8.png'), Card('Club8_2', 'assets/clubsCards/Club8.png'),
    Card('Club9_1', 'assets/clubsCards/Club9.png'), Card('Club9_2', 'assets/clubsCards/Club9.png'),
    Card('Club10_1', 'assets/clubsCards/Club10.png'), Card('Club10_2', 'assets/clubsCards/Club10.png'),
    Card('Club11_1', 'assets/clubsCards/Club11.png'), Card('Club11_2', 'assets/clubsCards/Club11.png'),
    Card('Club12_1', 'assets/clubsCards/Club12.png'), Card('Club12_2', 'assets/clubsCards/Club12.png'),
    Card('Club13_1', 'assets/clubsCards/Club13.png'), Card('Club13_2', 'assets/clubsCards/Club13.png'),
    Card('Club14_1', 'assets/clubsCards/Club14.png'), Card('Club14_2', 'assets/clubsCards/Club14.png'),
    Card('Diamond2_1', 'assets/diamondsCards/Diamond2.png'), Card('Diamond2_2', 'assets/diamondsCards/Diamond2.png'),
    Card('Diamond3_1', 'assets/diamondsCards/Diamond3.png'), Card('Diamond3_2', 'assets/diamondsCards/Diamond3.png'),
    Card('Diamond4_1', 'assets/diamondsCards/Diamond4.png'), Card('Diamond4_2', 'assets/diamondsCards/Diamond4.png'),
    Card('Diamond5_1', 'assets/diamondsCards/Diamond5.png'), Card('Diamond5_2', 'assets/diamondsCards/Diamond5.png'),
    Card('Diamond6_1', 'assets/diamondsCards/Diamond6.png'), Card('Diamond6_2', 'assets/diamondsCards/Diamond6.png'),
    Card('Diamond7_1', 'assets/diamondsCards/Diamond7.png'), Card('Diamond7_2', 'assets/diamondsCards/Diamond7.png'),
    Card('Diamond8_1', 'assets/diamondsCards/Diamond8.png'), Card('Diamond8_2', 'assets/diamondsCards/Diamond8.png'),
    Card('Diamond9_1', 'assets/diamondsCards/Diamond9.png'), Card('Diamond9_2', 'assets/diamondsCards/Diamond9.png'),
    Card('Diamond10_1', 'assets/diamondsCards/Diamond10.png'), Card('Diamond10_2', 'assets/diamondsCards/Diamond10.png'),
    Card('Diamond11_1', 'assets/diamondsCards/Diamond11.png'), Card('Diamond11_2', 'assets/diamondsCards/Diamond11.png'),
    Card('Diamond12_1', 'assets/diamondsCards/Diamond12.png'), Card('Diamond12_2', 'assets/diamondsCards/Diamond12.png'),
    Card('Diamond13_1', 'assets/diamondsCards/Diamond13.png'), Card('Diamond13_2', 'assets/diamondsCards/Diamond13.png'),
    Card('Diamond14_1', 'assets/diamondsCards/Diamond14.png'), Card('Diamond14_2', 'assets/diamondsCards/Diamond14.png'),
    Card('Heart2_1', 'assets/heartsCards/Heart2.png'), Card('Heart2_2', 'assets/heartsCards/Heart2.png'),
    Card('Heart3_1', 'assets/heartsCards/Heart3.png'), Card('Heart3_2', 'assets/heartsCards/Heart3.png'),
    Card('Heart4_1', 'assets/heartsCards/Heart4.png'), Card('Heart4_2', 'assets/heartsCards/Heart4.png'),
    Card('Heart5_1', 'assets/heartsCards/Heart5.png'), Card('Heart5_2', 'assets/heartsCards/Heart5.png'),
    Card('Heart6_1', 'assets/heartsCards/Heart6.png'), Card('Heart6_2', 'assets/heartsCards/Heart6.png'),
    Card('Heart7_1', 'assets/heartsCards/Heart7.png'), Card('Heart7_2', 'assets/heartsCards/Heart7.png'),
    Card('Heart8_1', 'assets/heartsCards/Heart8.png'), Card('Heart8_2', 'assets/heartsCards/Heart8.png'),
    Card('Heart9_1', 'assets/heartsCards/Heart9.png'), Card('Heart9_2', 'assets/heartsCards/Heart9.png'),
    Card('Heart10_1', 'assets/heartsCards/Heart10.png'), Card('Heart10_2', 'assets/heartsCards/Heart10.png'),
    Card('Heart11_1', 'assets/heartsCards/Heart11.png'), Card('Heart11_2', 'assets/heartsCards/Heart11.png'),
    Card('Heart12_1', 'assets/heartsCards/Heart12.png'), Card('Heart12_2', 'assets/heartsCards/Heart12.png'),
    Card('Heart13_1', 'assets/heartsCards/Heart13.png'), Card('Heart13_2', 'assets/heartsCards/Heart13.png'),
    Card('Heart14_1', 'assets/heartsCards/Heart14.png'), Card('Heart14_2', 'assets/heartsCards/Heart14.png'),
    Card('Joker1', 'assets/extraCards/Joker.png'), Card('Joker2', 'assets/extraCards/Joker.png'),
    Card('Joker3', 'assets/extraCards/Joker.png'), Card('Joker4', 'assets/extraCards/Joker.png'),
  ];
  // List<Card> professional_deck = [
  //   Card('assets/spadesCards/Spade2.png'), Card('assets/spadesCards/Spade3.png'), Card('assets/spadesCards/Spade4.png'),
  //   Card('assets/spadesCards/Spade5.png'), Card('assets/spadesCards/Spade6.png'), Card('assets/spadesCards/Spade7.png'),
  //   Card('assets/spadesCards/Spade8.png'), Card('assets/spadesCards/Spade9.png'), Card('assets/spadesCards/Spade10.png'),
  //   Card('assets/spadesCards/Spade11.png'), Card('assets/spadesCards/Spade12.png'), Card('assets/spadesCards/Spade13.png'),
  //   Card('assets/spadesCards/Spade14.png'), Card('assets/clubsCards/Club2.png'), Card('assets/clubsCards/Club3.png'),
  //   Card('assets/clubsCards/Club4.png'), Card('assets/clubsCards/Club5.png'), Card('assets/clubsCards/Club6.png'),
  //   Card('assets/clubsCards/Club7.png'), Card('assets/clubsCards/Club8.png'), Card('assets/clubsCards/Club9.png'),
  //   Card('assets/clubsCards/Club10.png'), Card('assets/clubsCards/Club11.png'), Card('assets/clubsCards/Club12.png'),
  //   Card('assets/clubsCards/Club13.png'), Card('assets/clubsCards/Club14.png'), Card('assets/diamondsCards/Diamond2.png'),
  //   Card('assets/diamondsCards/Diamond3.png'), Card('assets/diamondsCards/Diamond4.png'), Card('assets/diamondsCards/Diamond5.png'),
  //   Card('assets/diamondsCards/Diamond6.png'), Card('assets/diamondsCards/Diamond7.png'), Card('assets/diamondsCards/Diamond8.png'),
  //   Card('assets/diamondsCards/Diamond9.png'), Card('assets/diamondsCards/Diamond10.png'), Card('assets/diamondsCards/Diamond11.png'),
  //   Card('assets/diamondsCards/Diamond12.png'), Card('assets/diamondsCards/Diamond13.png'), Card('assets/diamondsCards/Diamond14.png'),
  //   Card('assets/heartsCards/Heart2.png'), Card('assets/heartsCards/Heart3.png'), Card('assets/heartsCards/Heart4.png'),
  //   Card('assets/heartsCards/Heart5.png'), Card('assets/heartsCards/Heart6.png'), Card('assets/heartsCards/Heart7.png'),
  //   Card('assets/heartsCards/Heart8.png'), Card('assets/heartsCards/Heart9.png'), Card('assets/heartsCards/Heart10.png'),
  //   Card('assets/heartsCards/Heart11.png'), Card('assets/heartsCards/Heart12.png'), Card('assets/heartsCards/Heart13.png'),
  //   Card('assets/heartsCards/Heart14.png'),
  // ];

  List<Card> player1Cards = [];
  List<Card> player2Cards = [];
  List<Card> pot = [];
  List<Card> deck = [];
  List<Card> discardPile = [];
  List<bool> isTapped = [];
  double yOffset = 5;

  void toggleCard(int index) {
    setState(() {
      if(isTapped[index] == false){
        isTapped[index] = true;
        yOffset = isTapped[index] ? -10 : 5;
      }
      else{
        isTapped[index] = false;
      }
    });
  }

  late AnimationController _controller;
  late Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();

    classic_deck.shuffle(Random());
    player1Cards = classic_deck.take(11).toList();
    player2Cards = classic_deck.skip(11).take(11).toList();
    pot = classic_deck.skip(22).take(22).toList();
    discardPile = classic_deck.skip(44).take(1).toList();
    deck = classic_deck.skip(45).toList();
    isTapped = List.generate(player1Cards.length, (_) => false);

    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );
    _animation = Tween<Offset>(
      begin: Offset.zero,
      end: Offset(0.5, 0),
    ).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void addRandomCard(List<Card> deck) {
    setState(() {
      if (deck.isNotEmpty) {
        int randomIndex = Random().nextInt(deck.length);
        String cardId = deck[randomIndex].cardId;
        String imagePath = deck[randomIndex].imagePath;
        player1Cards.add(Card(cardId, imagePath));
        isTapped.add(false);
        deck.removeAt(randomIndex);
        _controller.reset();
        _controller.forward();
      }
    });
  }

  @override
  Widget build(BuildContext context) {

    int player2CardsCount = (player2Cards.length).toInt();
    int deckCount = (deck.length).toInt();

    return Scaffold(
      backgroundColor: const Color(0xFF344264),
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
                //Avatar and Nickname starts
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
                //Avatar and Nickname ends
                const SizedBox(width: 12),
                //Player 2 Hand Container starts
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
                      Stack(
                        children: List.generate(
                          player2Cards.length,
                              (index) => Positioned(
                            right: 5 + (index * 1),
                            top: 5,
                            child: Image.asset(
                              player2Cards[index].imagePath,
                              width: 50,
                              height: 65,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 5, top: 5),
                        child: Image.asset(
                          'assets/extraCards/Blue.png',
                          fit: BoxFit.fill,
                          width: 50,
                          height: 65,
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
                          child: Center(
                            child: Text(
                              player2CardsCount.toString(),
                              style: TextStyle(fontSize: 10, color: Colors.black),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                //Player 2 Hand Container ends
                const SizedBox(width: 12),
                //Nickname with Points starts
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
                //Nickname with Points ends
              ],
            ),
            //Tables starts
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
            //Tables ends
            const SizedBox(height: 5.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    //Deck starts
                    SizedBox(
                      width: 60,
                      height: 75,
                      child: Stack(
                        children: [
                          GestureDetector(
                            onTap: () {
                              addRandomCard(deck);
                              setState(() {
                                deckCount = deck.length;
                              });
                            },
                            child: Stack(
                              children: [
                                Container(
                                  width: 60,
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
                                Container(
                                  margin: EdgeInsets.only(left: 5, top: 5),
                                  child: Image.asset(
                                    'assets/extraCards/Red.png',
                                    fit: BoxFit.fill,
                                    width: 50,
                                    height: 65,
                                  ),
                                ),
                                Center(
                                  child: Container(
                                    width: 20,
                                    height: 20,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.white,
                                    ),
                                    child: Center(
                                      child: Text(
                                        deckCount.toString(),
                                        style: TextStyle(fontSize: 10, color: Colors.black),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    //Deck ends
                    const SizedBox(width: 5.0),
                    //Discard Pile starts
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
                          Stack(
                            children: List.generate(discardPile.length, (index) {
                              return AnimatedPositioned(
                                duration: Duration(milliseconds: 300),
                                left: 5 + (index * 10),
                                top: 5,
                                child: Image.asset(
                                  discardPile[index].imagePath,
                                  fit: BoxFit.fill,
                                  width: 50,
                                  height: 65,
                                ),
                              );
                            }),
                          ),
                        ],
                      ),
                    ),
                    //Discard Pile ends
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                //Player 1 Hand Container starts
                Align(
                  alignment: Alignment.centerRight,
                  child: SizedBox(
                    width: 749,
                    height: 75,
                    child: Stack(
                      children: [
                        Container(
                          width: 635,
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
                          children: List.generate(player1Cards.length, (index) {
                            return AnimatedPositioned(
                              duration: Duration(milliseconds: 300),
                              left: (((635 - ((player1Cards.length - 1) + 5)) / player1Cards.length) * index) + 5,
                              top: isTapped[index] ? yOffset : 5,
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    toggleCard(index);
                                  });
                                },
                                child: Image.asset(
                                  player1Cards[index].imagePath,
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
                //Player 1 Hand Container ends
              ],
            ),
          ],
        ),
      ),
    );
  }
}