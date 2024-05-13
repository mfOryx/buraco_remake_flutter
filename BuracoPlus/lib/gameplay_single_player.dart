import 'dart:math';

import 'package:flutter/cupertino.dart';
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
    Card('Special_2_1', 'assets/spadesCards/Spade2.png'), Card('Special_2_2', 'assets/spadesCards/Spade2.png'),
    Card('Spade_3_1', 'assets/spadesCards/Spade3.png'), Card('Spade_3_2', 'assets/spadesCards/Spade3.png'),
    Card('Spade_4_1', 'assets/spadesCards/Spade4.png'), Card('Spade_4_2', 'assets/spadesCards/Spade4.png'),
    Card('Spade_5_1', 'assets/spadesCards/Spade5.png'), Card('Spade_5_2', 'assets/spadesCards/Spade5.png'),
    Card('Spade_6_1', 'assets/spadesCards/Spade6.png'), Card('Spade_6_2', 'assets/spadesCards/Spade6.png'),
    Card('Spade_7_1', 'assets/spadesCards/Spade7.png'), Card('Spade_7_2', 'assets/spadesCards/Spade7.png'),
    Card('Spade_8_1', 'assets/spadesCards/Spade8.png'), Card('Spade_8_2', 'assets/spadesCards/Spade8.png'),
    Card('Spade_9_1', 'assets/spadesCards/Spade9.png'), Card('Spade_9_2', 'assets/spadesCards/Spade9.png'),
    Card('Spade_10_1', 'assets/spadesCards/Spade10.png'), Card('Spade_10_2', 'assets/spadesCards/Spade10.png'),
    Card('Spade_11_1', 'assets/spadesCards/Spade11.png'), Card('Spade_11_2', 'assets/spadesCards/Spade11.png'),
    Card('Spade_12_1', 'assets/spadesCards/Spade12.png'), Card('Spade_12_2', 'assets/spadesCards/Spade12.png'),
    Card('Spade_13_1', 'assets/spadesCards/Spade13.png'), Card('Spade_13_2', 'assets/spadesCards/Spade13.png'),
    Card('Spade_14_1', 'assets/spadesCards/Spade14.png'), Card('Spade_14_2', 'assets/spadesCards/Spade14.png'),
    Card('Special_2_1', 'assets/clubsCards/Club2.png'), Card('Special_2_2', 'assets/clubsCards/Club2.png'),
    Card('Club_3_1', 'assets/clubsCards/Club3.png'), Card('Club_3_2', 'assets/clubsCards/Club3.png'),
    Card('Club_4_1', 'assets/clubsCards/Club4.png'), Card('Club_4_2', 'assets/clubsCards/Club4.png'),
    Card('Club_5_1', 'assets/clubsCards/Club5.png'), Card('Club_5_2', 'assets/clubsCards/Club5.png'),
    Card('Club_6_1', 'assets/clubsCards/Club6.png'), Card('Club_6_2', 'assets/clubsCards/Club6.png'),
    Card('Club_7_1', 'assets/clubsCards/Club7.png'), Card('Club_7_2', 'assets/clubsCards/Club7.png'),
    Card('Club_8_1', 'assets/clubsCards/Club8.png'), Card('Club_8_2', 'assets/clubsCards/Club8.png'),
    Card('Club_9_1', 'assets/clubsCards/Club9.png'), Card('Club_9_2', 'assets/clubsCards/Club9.png'),
    Card('Club_10_1', 'assets/clubsCards/Club10.png'), Card('Club_10_2', 'assets/clubsCards/Club10.png'),
    Card('Club_11_1', 'assets/clubsCards/Club11.png'), Card('Club_11_2', 'assets/clubsCards/Club11.png'),
    Card('Club_12_1', 'assets/clubsCards/Club12.png'), Card('Club_12_2', 'assets/clubsCards/Club12.png'),
    Card('Club_13_1', 'assets/clubsCards/Club13.png'), Card('Club_13_2', 'assets/clubsCards/Club13.png'),
    Card('Club_14_1', 'assets/clubsCards/Club14.png'), Card('Club_14_2', 'assets/clubsCards/Club14.png'),
    Card('Special_2_1', 'assets/diamondsCards/Diamond2.png'), Card('Special_2_2', 'assets/diamondsCards/Diamond2.png'),
    Card('Diamond_3_1', 'assets/diamondsCards/Diamond3.png'), Card('Diamond_3_2', 'assets/diamondsCards/Diamond3.png'),
    Card('Diamond_4_1', 'assets/diamondsCards/Diamond4.png'), Card('Diamond_4_2', 'assets/diamondsCards/Diamond4.png'),
    Card('Diamond_5_1', 'assets/diamondsCards/Diamond5.png'), Card('Diamond_5_2', 'assets/diamondsCards/Diamond5.png'),
    Card('Diamond_6_1', 'assets/diamondsCards/Diamond6.png'), Card('Diamond_6_2', 'assets/diamondsCards/Diamond6.png'),
    Card('Diamond_7_1', 'assets/diamondsCards/Diamond7.png'), Card('Diamond_7_2', 'assets/diamondsCards/Diamond7.png'),
    Card('Diamond_8_1', 'assets/diamondsCards/Diamond8.png'), Card('Diamond_8_2', 'assets/diamondsCards/Diamond8.png'),
    Card('Diamond_9_1', 'assets/diamondsCards/Diamond9.png'), Card('Diamond_9_2', 'assets/diamondsCards/Diamond9.png'),
    Card('Diamond_10_1', 'assets/diamondsCards/Diamond10.png'), Card('Diamond_10_2', 'assets/diamondsCards/Diamond10.png'),
    Card('Diamond_11_1', 'assets/diamondsCards/Diamond11.png'), Card('Diamond_11_2', 'assets/diamondsCards/Diamond11.png'),
    Card('Diamond_12_1', 'assets/diamondsCards/Diamond12.png'), Card('Diamond_12_2', 'assets/diamondsCards/Diamond12.png'),
    Card('Diamond_13_1', 'assets/diamondsCards/Diamond13.png'), Card('Diamond_13_2', 'assets/diamondsCards/Diamond13.png'),
    Card('Diamond_14_1', 'assets/diamondsCards/Diamond14.png'), Card('Diamond_14_2', 'assets/diamondsCards/Diamond14.png'),
    Card('Special_2_1', 'assets/heartsCards/Heart2.png'), Card('Special_2_2', 'assets/heartsCards/Heart2.png'),
    Card('Heart_3_1', 'assets/heartsCards/Heart3.png'), Card('Heart_3_2', 'assets/heartsCards/Heart3.png'),
    Card('Heart_4_1', 'assets/heartsCards/Heart4.png'), Card('Heart_4_2', 'assets/heartsCards/Heart4.png'),
    Card('Heart_5_1', 'assets/heartsCards/Heart5.png'), Card('Heart_5_2', 'assets/heartsCards/Heart5.png'),
    Card('Heart_6_1', 'assets/heartsCards/Heart6.png'), Card('Heart_6_2', 'assets/heartsCards/Heart6.png'),
    Card('Heart_7_1', 'assets/heartsCards/Heart7.png'), Card('Heart_7_2', 'assets/heartsCards/Heart7.png'),
    Card('Heart_8_1', 'assets/heartsCards/Heart8.png'), Card('Heart_8_2', 'assets/heartsCards/Heart8.png'),
    Card('Heart_9_1', 'assets/heartsCards/Heart9.png'), Card('Heart_9_2', 'assets/heartsCards/Heart9.png'),
    Card('Heart_10_1', 'assets/heartsCards/Heart10.png'), Card('Heart_10_2', 'assets/heartsCards/Heart10.png'),
    Card('Heart_11_1', 'assets/heartsCards/Heart11.png'), Card('Heart_11_2', 'assets/heartsCards/Heart11.png'),
    Card('Heart_12_1', 'assets/heartsCards/Heart12.png'), Card('Heart_12_2', 'assets/heartsCards/Heart12.png'),
    Card('Heart_13_1', 'assets/heartsCards/Heart13.png'), Card('Heart_13_2', 'assets/heartsCards/Heart13.png'),
    Card('Heart_14_1', 'assets/heartsCards/Heart14.png'), Card('Heart_14_2', 'assets/heartsCards/Heart14.png'),
    Card('Joker_15_1', 'assets/extraCards/Joker.png'), Card('Joker_15_2', 'assets/extraCards/Joker.png'),
    Card('Joker_15_3', 'assets/extraCards/Joker.png'), Card('Joker_15_4', 'assets/extraCards/Joker.png'),
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
  bool is20CardsInHand = false;
  bool rowsButtonToggle = false;
  bool sort234Button = true;
  bool sort432Button = false;
  bool sortKKKButton = false;

  void toggleCard(int index) {
    setState(() {
      if(isTapped[index] == false){
        isTapped[index] = true;
        yOffset = isTapped[index] ? MediaQuery.of(context).size.height * -0.015 : MediaQuery.of(context).size.height * 0.015;
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
      begin: Offset(-1.0, 0.0),
      end: Offset(0.0, 0.0),
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.elasticInOut,
    ));

    _controller.forward();
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
        if (sort234Button == true){
          sort234(player1Cards);
        }
        if (sortKKKButton == true){
          player1Cards.sort((a ,b) => a.cardId.compareTo(b.cardId));
        }
        isTapped.add(false);
        deck.removeAt(randomIndex);
        _controller.reset();
        _controller.forward();
      }
    });
  }

  void addDiscardPileToHand(List<Card> discardPile){
    setState(() {
      if (discardPile.isNotEmpty) {
        for(int i = 0; i < discardPile.length; i++){
          player1Cards.add(Card(discardPile[i].cardId, discardPile[i].imagePath));
          isTapped.add(false);
        }
        discardPile.clear();
      }
    });
  }

  List<Widget> splitInTwoRows(int splitCut){
    return List.generate(player1Cards.length, (index)
    {
      double containerWidth;
      double cardWidth;
      double totalSpaceForCards;
      double spaceBetweenCards;
      double leftPosition;
      double topPosition;
      double screenWidth = MediaQuery.of(context).size.width;
      double screenHeight = MediaQuery.of(context).size.height;

      if (index < splitCut) {
        containerWidth = screenWidth * 0.672; // Width of the container with minus 10 space units to give padding to the right
        cardWidth = screenWidth * 0.055; // Width of each card
        totalSpaceForCards = containerWidth - (cardWidth * player1Cards.length);
        spaceBetweenCards = totalSpaceForCards / (player1Cards.length - 1);
        leftPosition = (cardWidth + spaceBetweenCards) * index + (screenWidth * 0.005);
        topPosition = isTapped[index] ? yOffset : (screenHeight * 0.01);
        if (rowsButtonToggle){
          containerWidth = screenWidth * 1.305;
          cardWidth = screenWidth * 0.055; // Width of each card
          totalSpaceForCards = containerWidth - (cardWidth * player1Cards.length);
          spaceBetweenCards = totalSpaceForCards / (player1Cards.length - 1);
          leftPosition = (cardWidth + spaceBetweenCards) * index + (screenWidth * 0.005);
          topPosition = isTapped[index] ? yOffset : (screenHeight * 0.01);
        }
      } else {
        if(index > 18){ is20CardsInHand = true; }
        containerWidth = screenWidth * 0.672; // Width of the container with minus 10 space units to give padding to the right
        cardWidth = screenWidth * 0.055; // Width of each card
        totalSpaceForCards = containerWidth - (cardWidth * player1Cards.length);
        spaceBetweenCards = totalSpaceForCards / (player1Cards.length - 1);
        if (rowsButtonToggle) {
          containerWidth = (player1Cards.length) % 2 == 0 ? (screenWidth * 1.305) : (screenWidth * 1.288); // Width of the container with minus 10 space units to give padding to the right
          cardWidth = screenWidth * 0.055; // Width of each card
          totalSpaceForCards = containerWidth - (cardWidth * player1Cards.length);
          spaceBetweenCards = totalSpaceForCards / (player1Cards.length - 1);
          // For the second row, adjust the index and position
          leftPosition = (cardWidth + spaceBetweenCards) * (index - splitCut) + (screenWidth * 0.005);
          topPosition = isTapped[index] ? yOffset + (screenHeight * 0.05) : (screenHeight * 0.06); // Adjust the top position for the second row
        } else {
          leftPosition = (cardWidth + spaceBetweenCards) * index + (screenWidth * 0.005);
          topPosition = isTapped[index] ? yOffset : (screenHeight * 0.01);
        }
      }
      return AnimatedPositioned(
        duration: Duration(milliseconds: 300),
        left: leftPosition,
        top: topPosition,
        child: GestureDetector(
          onTap: () {
            setState(() {
              toggleCard(index);
            });
          },
          child: Image.asset(
            player1Cards[index].imagePath,
            fit: BoxFit.fill,
            width: cardWidth,
            height: screenHeight * 0.15,
          ),
        ),
      );
    });
  }

  // Custom comparator function to sort the cards in 234 order
  void sort234(List<Card?> deck) {
    deck.sort((a, b) {
      // Define the order of suits and ranks
      Map<String, int> suitOrder = {
        'Spade': 0,
        'Diamond': 1,
        'Club': 2,
        'Heart': 3,
        'Special': 4,
        'Joker': 5,
      };

      Map<String, int> rankOrder = {
        '3': 0,
        '4': 1,
        '5': 2,
        '6': 3,
        '7': 4,
        '8': 5,
        '9': 6,
        '10': 7,
        '11': 8,
        '12': 9,
        '13': 10,
        '14': 11,
        '2': 12,
        '15': 13,
      };

      String? getSuit(String? cardName) {
        if (cardName != null && cardName.contains('_')) {
          return cardName.split('_')[0];
        }
        return null;
      }

      String? getRank(String? cardName) {
        if (cardName != null && cardName.contains('_')) {
          return cardName.split('_')[1];
        }
        return null;
      }

      String? suitA = getSuit(a?.cardId);
      String? suitB = getSuit(b?.cardId);
      String? rankA = getRank(a?.cardId);
      String? rankB = getRank(b?.cardId);

      // Check for null values before comparison
      if (suitA != null && suitB != null && rankA != null && rankB != null) {
        int suitCompare = suitOrder[suitA]! - suitOrder[suitB]!;
        int rankCompare = rankOrder[rankA]!.compareTo(rankOrder[rankB]!);
        if (suitCompare != 0) {
          return suitCompare;
        } else {
          if (rankCompare != 0){
            return rankCompare;
          } else {
            return 0;
          }
        }
      } else {
        // Handle cases where one or both cards have null values
        if (suitA == null && suitB == null) {
          return 0; // Both are null, treat as equal
        } else if (suitA == null) {
          return 1; // Null suit comes after non-null
        } else if (suitB == null) {
          return -1; // Null suit comes before non-null
        } else {
          return 0; // Treat as equal
        }
      }
    });
  }

  // Custom comparator function to sort the cards in 432 order
  void sort432(List<Card?> deck) {
    deck.sort((a, b) {
      // Define the order of suits and ranks
      Map<String, int> suitOrder = {
        'Joker': 0,
        'Special': 1,
        'Spade': 2,
        'Diamond': 3,
        'Club': 4,
        'Heart': 5,
      };

      Map<String, int> rankOrder = {
        '15': 0,
        '2': 1,
        '14': 2,
        '13': 3,
        '12': 4,
        '11': 5,
        '10': 6,
        '9': 7,
        '8': 8,
        '7': 9,
        '6': 10,
        '5': 11,
        '4': 12,
        '3': 13,
      };

      String? getSuit(String? cardName) {
        if (cardName != null && cardName.contains('_')) {
          return cardName.split('_')[0];
        }
        return null;
      }

      String? getRank(String? cardName) {
        if (cardName != null && cardName.contains('_')) {
          return cardName.split('_')[1];
        }
        return null;
      }

      String? suitA = getSuit(a?.cardId);
      String? suitB = getSuit(b?.cardId);
      String? rankA = getRank(a?.cardId);
      String? rankB = getRank(b?.cardId);

      // Check for null values before comparison
      if (suitA != null && suitB != null && rankA != null && rankB != null) {
        int suitCompare = suitOrder[suitA]! - suitOrder[suitB]!;
        int rankCompare = rankOrder[rankA]!.compareTo(rankOrder[rankB]!);
        if (suitCompare != 0) {
          return suitCompare;
        } else {
          if (rankCompare != 0){
            return rankCompare;
          } else {
            return 0;
          }
        }
      } else {
        // Handle cases where one or both cards have null values
        if (suitA == null && suitB == null) {
          return 0; // Both are null, treat as equal
        } else if (suitA == null) {
          return 1; // Null suit comes after non-null
        } else if (suitB == null) {
          return -1; // Null suit comes before non-null
        } else {
          return 0; // Treat as equal
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {

    int player2CardsCount = (player2Cards.length).toInt();
    int deckCount = (deck.length).toInt();
    int potCount = (pot.length).toInt();
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xFF344264),
      body: Center(
        child: SizedBox(
          height: screenHeight,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        //Avatar and Nickname starts
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            CircleAvatar(
                              radius: screenWidth * 0.03,
                              backgroundImage: AssetImage('assets/menuIcons/blankAvatar_2.png'),
                            ),
                            SizedBox(width: screenWidth * 0.02),
                            Text(
                              'ABC XYZ',
                              style: TextStyle(fontSize: screenWidth * 0.01, color: Colors.white),
                            ),
                          ],
                        ),
                        //Avatar and Nickname ends
                        SizedBox(width: screenWidth * 0.02),
                        //Player 2 Hand Container starts
                        Container(
                          width: screenWidth * 0.065,
                          height: screenHeight * 0.14,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Stack(
                            children: [
                              Container(
                                width: screenWidth * 0.065,
                                height: screenHeight * 0.14,
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
                                    right: (screenWidth * 0.005) + (index * 1),
                                    top: screenHeight * 0.005,
                                    child: Image.asset(
                                      player2Cards[index].imagePath,
                                      width: screenWidth * 0.04,
                                      height: screenHeight * 0.135,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 5, top: 5),
                                child: Image.asset(
                                  'assets/extraCards/Blue.png',
                                  fit: BoxFit.fill,
                                  width: screenWidth * 0.04,
                                  height: screenHeight * 0.12,
                                ),
                              ),
                              Positioned(
                                top: 30,
                                left: 13,
                                child: Container(
                                  width: screenWidth * 0.02,
                                  height: screenHeight * 0.05,
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
                        SizedBox(width: screenWidth * 0.02),
                        //Nickname with Points starts
                        Container(
                          width: screenWidth * 0.15,
                          height: screenHeight * 0.05,
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
                                  style: TextStyle(fontSize: 10, color: Colors.white),
                                ),
                              ),
                              Spacer(),
                              Padding(
                                padding: EdgeInsets.only(right: 8.0),
                                child: Text(
                                  '0/0',
                                  style: TextStyle(fontSize: 10, color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 10),
                        Container(
                          width: screenWidth * 0.15,
                          height: screenHeight * 0.05,
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
                                  'XYZ ABC',
                                  style: TextStyle(fontSize: 10, color: Colors.white),
                                ),
                              ),
                              Spacer(),
                              Padding(
                                padding: EdgeInsets.only(right: 8.0),
                                child: Text(
                                  '0/0',
                                  style: TextStyle(fontSize: 10, color: Colors.white),
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
                          width: screenWidth * 0.4,
                          height: screenHeight * 0.52,
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
                          width: screenWidth * 0.4,
                          height: screenHeight * 0.52,
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
                    Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            //Pot starts
                            Container(
                              width: screenWidth * 0.05,
                              height: screenHeight * 0.128,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Stack(
                                children: [
                                  Container(
                                    width: screenWidth * 0.05,
                                    height: screenHeight * 0.128,
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
                                  // Normal stack of cards
                                  Stack(
                                    children: [
                                      Positioned(
                                        right: screenWidth * 0.005,
                                        top: screenHeight * 0.012,
                                        child: Stack(
                                          children: [
                                            ...List.generate(
                                              11,
                                                  (index) => Image.asset(
                                                pot[index].imagePath,
                                                width: screenWidth * 0.042,
                                                height: screenHeight * 0.105,
                                              ),
                                            ),
                                            Positioned(
                                              left: screenWidth * 0.003,
                                              child: Image.asset(
                                                'assets/extraCards/Blue.png',
                                                fit: BoxFit.fill,
                                                width: screenWidth * 0.035,
                                                height: screenHeight * 0.105,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  // Rotated stack of cards
                                  Stack(
                                    children: [
                                      Positioned(
                                        right: screenWidth * 0.008,
                                        bottom: screenHeight * 0.012,
                                        child: Transform.rotate(
                                          angle: pi / 2, // Rotate 90 degrees
                                          child: Stack(
                                            children: [
                                              // Rotated cards
                                              ...List.generate(
                                                11,
                                                    (index) => Image.asset(
                                                  pot[index + 11].imagePath, // Start from index 11 for rotated cards
                                                  width: screenWidth * 0.035,
                                                  height: screenHeight * 0.105,
                                                ),
                                              ),
                                              // Covering card for the rest of the cards
                                              Positioned(
                                                child: Image.asset(
                                                  'assets/extraCards/Blue.png', // Adjust the path to your covering card image
                                                  width: screenWidth * 0.035,
                                                  height: screenHeight * 0.105,
                                                ),
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
                            //Pot ends
                            SizedBox(width: screenWidth * 0.1),
                            Column(
                              children: [
                                Row(
                                  children: [
                                    //Deck starts
                                    SizedBox(
                                      width: screenWidth * 0.064,
                                      height: screenHeight * 0.17,
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
                                                  width: screenWidth * 0.064,
                                                  height: screenHeight * 0.17,
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
                                                    width: screenWidth * 0.053,
                                                    height: screenHeight * 0.147,
                                                  ),
                                                ),
                                                Center(
                                                  child: Container(
                                                    width: screenWidth * 0.05,
                                                    height: screenHeight * 0.05,
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
                                    SizedBox(width: screenWidth * 0.005),
                                    //Discard Pile starts
                                    SizedBox(
                                      width: screenWidth * 0.55,
                                      height: screenHeight * 0.17,
                                      child: Stack(
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              addDiscardPileToHand(discardPile);
                                            },
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
                                                //   children: List.generate(discardPile.length, (index) {
                                                //     return AnimatedPositioned(
                                                //       duration: Duration(milliseconds: 300),
                                                //       left: 5 + (index * 10),
                                                //       top: 5,
                                                //       child: Image.asset(
                                                //         discardPile[index].imagePath,
                                                //         fit: BoxFit.fill,
                                                //         width: 50,
                                                //         height: 65,
                                                //       ),
                                                //     );
                                                //   }),
                                                // ),
                                                AnimatedBuilder(
                                                  animation: _controller,
                                                  builder: (context, child) {
                                                    return Stack(
                                                      children: List.generate(discardPile.length, (index) {
                                                        // Calculate the animated left position based on index and animation value
                                                        double animatedLeft = 5.0 + (index * 10);

                                                        return AnimatedPositioned(
                                                          duration: Duration(milliseconds: 300),
                                                          left: animatedLeft.toDouble(),
                                                          top: screenHeight * 0.01,
                                                          child: Image.asset(
                                                            discardPile[index].imagePath,
                                                            fit: BoxFit.fill,
                                                            width: screenWidth * 0.055,
                                                            height: screenHeight * 0.15,
                                                          ),
                                                        );
                                                      }),
                                                    );
                                                  },
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    //Discard Pile ends
                                  ],
                                ),
                                Row(
                                  children: [
                                    Column(
                                      children: [
                                        CircleAvatar(
                                          radius: screenWidth * 0.03,
                                          backgroundImage: AssetImage('assets/menuIcons/blankAvatar_2.png'),
                                        ),
                                        SizedBox(width: screenWidth * 0.012),
                                        Text(
                                          'XYZ ABC',
                                          style: TextStyle(fontSize: 10, color: Colors.white),
                                        ),
                                      ],
                                    ),
                                    SizedBox(width: screenWidth * 0.005),
                                    // Player 1 Hand Container starts
                                    SizedBox(
                                      width: screenWidth * 0.682,
                                      height: screenHeight * 0.17,
                                      child: Stack(
                                        children: [
                                          Container(
                                            width: screenWidth * 0.682,
                                            height: screenHeight * 0.17,
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
                                            children: splitInTwoRows(player1Cards.length~/2),
                                          ),
                                        ],
                                      ),
                                    ),
                                    // Player 1 Hand Container ends
                                  ],
                                ),
                              ],
                            ),
                            Expanded(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: screenWidth * 0.06,
                                      height: screenHeight * 0.1,
                                      child: Visibility(
                                        visible: is20CardsInHand,
                                        child: ElevatedButton(
                                          onPressed: () {
                                            setState(() {
                                              rowsButtonToggle = !rowsButtonToggle;
                                            });
                                          },
                                          style: ElevatedButton.styleFrom(
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(10),
                                            ),
                                            padding: EdgeInsets.zero,
                                            elevation: 0,
                                            backgroundColor: Colors.transparent,
                                          ),
                                          child: Image.asset(
                                            'assets/buttons/2rowsoff.png',
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Stack(
                                      children: [
                                        Visibility(
                                          visible: sort234Button,
                                          child: Container(
                                            width: screenWidth * 0.06,
                                            height: screenHeight * 0.1,
                                            child: ElevatedButton(
                                              onPressed: () {
                                                setState(() {
                                                  sort234Button = false; // Hide 234 button
                                                  sort432Button = true; // Show 432 button
                                                  sortKKKButton = false;
                                                  sort234(player1Cards); // Perform sorting logic for 432
                                                });
                                              },
                                              style: ElevatedButton.styleFrom(
                                                shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(10),
                                                ),
                                                padding: EdgeInsets.zero,
                                                elevation: 0,
                                                backgroundColor: Colors.transparent,
                                              ),
                                              child: Image.asset(
                                                'assets/buttons/sort234off.png',
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Visibility(
                                          visible: sort432Button,
                                          child: Container(
                                            width: screenWidth * 0.06,
                                            height: screenHeight * 0.1,
                                            child: ElevatedButton(
                                              onPressed: () {
                                                setState(() {
                                                  sort234Button = true; // Show 234 button
                                                  sort432Button = false; // Hide 432 button
                                                  sortKKKButton = false;
                                                  sort432(player1Cards); // Perform sorting logic for 234
                                                });
                                              },
                                              style: ElevatedButton.styleFrom(
                                                shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(10),
                                                ),
                                                padding: EdgeInsets.zero,
                                                elevation: 0,
                                                backgroundColor: Colors.transparent,
                                              ),
                                              child: Image.asset(
                                                'assets/buttons/sort432off.png',
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Container(
                                      width: screenWidth * 0.06,
                                      height: screenHeight * 0.1,
                                      child: ElevatedButton(
                                        onPressed: () {
                                          setState(() {
                                            sortKKKButton = !sortKKKButton;
                                            sort234Button = true;
                                            sort432Button = false;
                                            player1Cards.sort((a ,b) => a.cardId.compareTo(b.cardId));
                                          });
                                        },
                                        style: ElevatedButton.styleFrom(
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(10),
                                          ),
                                          padding: EdgeInsets.zero,
                                          elevation: 0,
                                          backgroundColor: Colors.transparent,
                                        ),
                                        child: Image.asset(
                                          'assets/buttons/sortKKKoff.png',
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                            ),
                          ],
                        ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}