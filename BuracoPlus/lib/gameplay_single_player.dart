import 'dart:ffi';
import 'dart:math';
import 'package:buracoplus/create_table_single_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'common/translation_manager.dart';
import 'package:buracoplus/blocks/lobby_option_item.dart';
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';
import 'package:buracoplus/helpers/modal_helpers.dart';
import 'package:buracoplus/models/options_model.dart';
import 'package:buracoplus/providers/theme_provider.dart';

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
  List<Card> classicDeck = [
    Card('Special_2_1', 'assets/spadesCards/Spade2.png'),
    Card('Special_2_2', 'assets/spadesCards/Spade2.png'),
    Card('Spade_3_1', 'assets/spadesCards/Spade3.png'),
    Card('Spade_3_2', 'assets/spadesCards/Spade3.png'),
    Card('Spade_4_1', 'assets/spadesCards/Spade4.png'),
    Card('Spade_4_2', 'assets/spadesCards/Spade4.png'),
    Card('Spade_5_1', 'assets/spadesCards/Spade5.png'),
    Card('Spade_5_2', 'assets/spadesCards/Spade5.png'),
    Card('Spade_6_1', 'assets/spadesCards/Spade6.png'),
    Card('Spade_6_2', 'assets/spadesCards/Spade6.png'),
    Card('Spade_7_1', 'assets/spadesCards/Spade7.png'),
    Card('Spade_7_2', 'assets/spadesCards/Spade7.png'),
    Card('Spade_8_1', 'assets/spadesCards/Spade8.png'),
    Card('Spade_8_2', 'assets/spadesCards/Spade8.png'),
    Card('Spade_9_1', 'assets/spadesCards/Spade9.png'),
    Card('Spade_9_2', 'assets/spadesCards/Spade9.png'),
    Card('Spade_10_1', 'assets/spadesCards/Spade10.png'),
    Card('Spade_10_2', 'assets/spadesCards/Spade10.png'),
    Card('Spade_11_1', 'assets/spadesCards/Spade11.png'),
    Card('Spade_11_2', 'assets/spadesCards/Spade11.png'),
    Card('Spade_12_1', 'assets/spadesCards/Spade12.png'),
    Card('Spade_12_2', 'assets/spadesCards/Spade12.png'),
    Card('Spade_13_1', 'assets/spadesCards/Spade13.png'),
    Card('Spade_13_2', 'assets/spadesCards/Spade13.png'),
    Card('Spade_14_1', 'assets/spadesCards/Spade14.png'),
    Card('Spade_14_2', 'assets/spadesCards/Spade14.png'),
    Card('Special_2_1', 'assets/clubsCards/Club2.png'),
    Card('Special_2_2', 'assets/clubsCards/Club2.png'),
    Card('Club_3_1', 'assets/clubsCards/Club3.png'),
    Card('Club_3_2', 'assets/clubsCards/Club3.png'),
    Card('Club_4_1', 'assets/clubsCards/Club4.png'),
    Card('Club_4_2', 'assets/clubsCards/Club4.png'),
    Card('Club_5_1', 'assets/clubsCards/Club5.png'),
    Card('Club_5_2', 'assets/clubsCards/Club5.png'),
    Card('Club_6_1', 'assets/clubsCards/Club6.png'),
    Card('Club_6_2', 'assets/clubsCards/Club6.png'),
    Card('Club_7_1', 'assets/clubsCards/Club7.png'),
    Card('Club_7_2', 'assets/clubsCards/Club7.png'),
    Card('Club_8_1', 'assets/clubsCards/Club8.png'),
    Card('Club_8_2', 'assets/clubsCards/Club8.png'),
    Card('Club_9_1', 'assets/clubsCards/Club9.png'),
    Card('Club_9_2', 'assets/clubsCards/Club9.png'),
    Card('Club_10_1', 'assets/clubsCards/Club10.png'),
    Card('Club_10_2', 'assets/clubsCards/Club10.png'),
    Card('Club_11_1', 'assets/clubsCards/Club11.png'),
    Card('Club_11_2', 'assets/clubsCards/Club11.png'),
    Card('Club_12_1', 'assets/clubsCards/Club12.png'),
    Card('Club_12_2', 'assets/clubsCards/Club12.png'),
    Card('Club_13_1', 'assets/clubsCards/Club13.png'),
    Card('Club_13_2', 'assets/clubsCards/Club13.png'),
    Card('Club_14_1', 'assets/clubsCards/Club14.png'),
    Card('Club_14_2', 'assets/clubsCards/Club14.png'),
    Card('Special_2_1', 'assets/diamondsCards/Diamond2.png'),
    Card('Special_2_2', 'assets/diamondsCards/Diamond2.png'),
    Card('Diamond_3_1', 'assets/diamondsCards/Diamond3.png'),
    Card('Diamond_3_2', 'assets/diamondsCards/Diamond3.png'),
    Card('Diamond_4_1', 'assets/diamondsCards/Diamond4.png'),
    Card('Diamond_4_2', 'assets/diamondsCards/Diamond4.png'),
    Card('Diamond_5_1', 'assets/diamondsCards/Diamond5.png'),
    Card('Diamond_5_2', 'assets/diamondsCards/Diamond5.png'),
    Card('Diamond_6_1', 'assets/diamondsCards/Diamond6.png'),
    Card('Diamond_6_2', 'assets/diamondsCards/Diamond6.png'),
    Card('Diamond_7_1', 'assets/diamondsCards/Diamond7.png'),
    Card('Diamond_7_2', 'assets/diamondsCards/Diamond7.png'),
    Card('Diamond_8_1', 'assets/diamondsCards/Diamond8.png'),
    Card('Diamond_8_2', 'assets/diamondsCards/Diamond8.png'),
    Card('Diamond_9_1', 'assets/diamondsCards/Diamond9.png'),
    Card('Diamond_9_2', 'assets/diamondsCards/Diamond9.png'),
    Card('Diamond_10_1', 'assets/diamondsCards/Diamond10.png'),
    Card('Diamond_10_2', 'assets/diamondsCards/Diamond10.png'),
    Card('Diamond_11_1', 'assets/diamondsCards/Diamond11.png'),
    Card('Diamond_11_2', 'assets/diamondsCards/Diamond11.png'),
    Card('Diamond_12_1', 'assets/diamondsCards/Diamond12.png'),
    Card('Diamond_12_2', 'assets/diamondsCards/Diamond12.png'),
    Card('Diamond_13_1', 'assets/diamondsCards/Diamond13.png'),
    Card('Diamond_13_2', 'assets/diamondsCards/Diamond13.png'),
    Card('Diamond_14_1', 'assets/diamondsCards/Diamond14.png'),
    Card('Diamond_14_2', 'assets/diamondsCards/Diamond14.png'),
    Card('Special_2_1', 'assets/heartsCards/Heart2.png'),
    Card('Special_2_2', 'assets/heartsCards/Heart2.png'),
    Card('Heart_3_1', 'assets/heartsCards/Heart3.png'),
    Card('Heart_3_2', 'assets/heartsCards/Heart3.png'),
    Card('Heart_4_1', 'assets/heartsCards/Heart4.png'),
    Card('Heart_4_2', 'assets/heartsCards/Heart4.png'),
    Card('Heart_5_1', 'assets/heartsCards/Heart5.png'),
    Card('Heart_5_2', 'assets/heartsCards/Heart5.png'),
    Card('Heart_6_1', 'assets/heartsCards/Heart6.png'),
    Card('Heart_6_2', 'assets/heartsCards/Heart6.png'),
    Card('Heart_7_1', 'assets/heartsCards/Heart7.png'),
    Card('Heart_7_2', 'assets/heartsCards/Heart7.png'),
    Card('Heart_8_1', 'assets/heartsCards/Heart8.png'),
    Card('Heart_8_2', 'assets/heartsCards/Heart8.png'),
    Card('Heart_9_1', 'assets/heartsCards/Heart9.png'),
    Card('Heart_9_2', 'assets/heartsCards/Heart9.png'),
    Card('Heart_10_1', 'assets/heartsCards/Heart10.png'),
    Card('Heart_10_2', 'assets/heartsCards/Heart10.png'),
    Card('Heart_11_1', 'assets/heartsCards/Heart11.png'),
    Card('Heart_11_2', 'assets/heartsCards/Heart11.png'),
    Card('Heart_12_1', 'assets/heartsCards/Heart12.png'),
    Card('Heart_12_2', 'assets/heartsCards/Heart12.png'),
    Card('Heart_13_1', 'assets/heartsCards/Heart13.png'),
    Card('Heart_13_2', 'assets/heartsCards/Heart13.png'),
    Card('Heart_14_1', 'assets/heartsCards/Heart14.png'),
    Card('Heart_14_2', 'assets/heartsCards/Heart14.png'),
    Card('Joker_15_1', 'assets/extraCards/Joker.png'),
    Card('Joker_15_2', 'assets/extraCards/Joker.png'),
    Card('Joker_15_3', 'assets/extraCards/Joker.png'),
    Card('Joker_15_4', 'assets/extraCards/Joker.png'),
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
  List<List<Card>> player1Table = [];
  List<List<Card>> player2Table = [];
  List<Card> cardsToBeAddedInTable = [];
  late Widget cardsToDisplayInTable;
  List<bool> isTapped = [];
  double yOffset = 5;
  bool is20CardsInHand = false;
  bool rowsButtonToggle = false;
  bool sort234Button = false;
  bool sort432Button = false;
  bool sortKKKButton = false;
  bool menuButton = false;
  bool menuExitButton = false;
  bool menuClubsButton = false;
  bool menuNoticeButton = false;
  bool menuMessagesButton = false;
  bool menuContactsButton = false;
  bool menuOptionsButton = false;
  bool menuProfileButton = false;
  bool manualSorting = false;
  bool isCardTaken = false;

  void toggleCard(int index) {
    setState(() {
      if (isTapped[index] == false) {
        isTapped[index] = true;
        yOffset = isTapped[index]
            ? MediaQuery.of(context).size.height * -0.015
            : MediaQuery.of(context).size.height * 0.015;
        cardsToBeAddedInTable.add(player1Cards[index]);
      } else {
        isTapped[index] = false;
        if (cardsToBeAddedInTable.isNotEmpty) {
          Card cardToRemove = player1Cards[index];
          for (int i = 0; i < cardsToBeAddedInTable.length; i++) {
            if (cardToRemove.cardId == cardsToBeAddedInTable[i].cardId) {
              cardsToBeAddedInTable.removeAt(i);
            }
          }
        }
      }
    });
  }

  late AnimationController _controller;
  late final List<Animation<Offset>> _animations = [];

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    );

    // Delay before starting the animation
    Future.delayed(const Duration(seconds: 1), () {
      double screenWidth = MediaQuery.of(context).size.width;
      double screenHeight = MediaQuery.of(context).size.height;

      // Calculate the offset to the bottom-left corner from the center
      double offsetX = -(screenWidth / 2 - 30);
      double offsetY = screenHeight / 2 - 50;

      setState(() {
        for (int i = 0; i < classicDeck.length; i++) {
          _animations.add(Tween<Offset>(
            begin: const Offset(0, 0),
            end: Offset(offsetX + i * 10, offsetY + i * 10), // Adjust increment to avoid overlap
          ).animate(CurvedAnimation(
            parent: _controller,
            curve: Curves.easeInOut,
          )));
        }
      });

      // Start the animation after the delay
      _controller.forward();
    });

    classicDeck.shuffle(Random());
    player1Cards = classicDeck.take(11).toList();
    player2Cards = classicDeck.skip(11).take(11).toList();
    pot = classicDeck.skip(22).take(22).toList();
    discardPile = classicDeck.skip(44).take(1).toList();
    deck = classicDeck.skip(45).toList();
    isTapped = List.generate(player1Cards.length, (_) => false);
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
        isCardTaken = !isCardTaken;
        player1Cards.add(Card(cardId, imagePath));
        isTapped.add(false);
        deck.removeAt(randomIndex);
        if (manualSorting == false) {
          if (sort234Button == true) {
            sort234(player1Cards);
          }
          if (sort432Button == true) {
            sort432(player1Cards);
          }
          if (sortKKKButton == true) {
            sortKKK(player1Cards);
          }
        }
        _controller.reset();
        _controller.forward();
      }
    });
  }

  void giveOrTakeDiscardPile() {
    setState(() {
      if (isCardTaken) {
        for (int i = 0; i < player1Cards.length; i++) {
          if (isTapped[i] == true) {
            discardPile.add(Card(player1Cards[i].cardId, player1Cards[i].imagePath));
            isTapped[i] = false;
            player1Cards.removeAt(i);
            isTapped.removeAt(i);
            cardsToBeAddedInTable.clear();
          }
        }
      } else {
        List<Card> cardsToMove = List.from(discardPile);
        discardPile.clear();
        for (int i = 0; i < cardsToMove.length; i++) {
          player1Cards.add(Card(cardsToMove[i].cardId, cardsToMove[i].imagePath));
          isTapped.add(false);
        }

        if (!manualSorting) {
          if (sort234Button) {
            sort234(player1Cards);
          }
          if (sort432Button) {
            sort432(player1Cards);
          }
          if (sortKKKButton) {
            sortKKK(player1Cards);
          }
        }
      }
    });
  }

  void addTableCardsColumn() {
    setState(() {
      if (kDebugMode) {
        for (int i = 0; i < cardsToBeAddedInTable.length; i++) {
          print(cardsToBeAddedInTable[i].cardId);
          print(cardsToBeAddedInTable.length);
        }
      }
      if (cardsToBeAddedInTable.isNotEmpty) {
        cardsToDisplayInTable = tableCardsColumnBuild();
      }
    });
  }

  Widget tableCardsColumnBuild() {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.4,
      height: MediaQuery.of(context).size.height * 0.52,
      child: Stack(
        children: List.generate(player1Table.length, (i) {
          double containerWidth;
          double cardWidth;
          double totalSpaceForCards;
          double spaceBetweenCards;
          double leftPosition;
          double screenWidth = MediaQuery.of(context).size.width;
          double screenHeight = MediaQuery.of(context).size.height;
          containerWidth = screenWidth * 0.395;
          cardWidth = screenWidth * 0.05;
          totalSpaceForCards = containerWidth - (cardWidth * player1Table.length);
          spaceBetweenCards = totalSpaceForCards / (player1Table.length - 1);
          leftPosition = player1Table.length <= 7 ? (cardWidth * i) : (cardWidth + spaceBetweenCards) * i;


          return Positioned(
            left: leftPosition.isFinite ? leftPosition : 0,
            child: SizedBox(
              width: screenWidth * 0.05,
              height: screenHeight * 0.5,
              child: Stack(
                children: List.generate(player1Table[i].length, (j) {
                  double containerHeight = screenWidth * 0.4;
                  double cardHeight = screenHeight * 0.135;
                  double totalSpaceForCards = containerHeight - (cardHeight * player1Table[i].length);
                  double spaceBetweenCards = totalSpaceForCards / (player1Table[i].length - 1);
                  double topPosition = player1Table[i].length <= 6 ? ((cardHeight / 2) * j) : (((cardHeight + spaceBetweenCards)/ 2) * j);
                  return AnimatedPositioned(
                    duration: const Duration(milliseconds: 300),
                    top: topPosition.isFinite ? topPosition : 0,
                    child: GestureDetector(
                      onTap: () {},
                      child: Image.asset(
                        player1Table[i][j].imagePath,
                        fit: BoxFit.fill,
                        width: cardWidth,
                        height: cardHeight,
                      ),
                    ),
                  );
                }),
              ),
            ),
          );
        }),
      ),
    );
  }

  void addToTable() {
    setState(() {
      player1Table.add(List.from(cardsToBeAddedInTable));
      for (int i = 0; i < cardsToBeAddedInTable.length; i++) {
        for (int j = 0; j < player1Cards.length; j++) {
          isTapped[j] = false;
          if ((cardsToBeAddedInTable[i].cardId).compareTo((player1Cards[j].cardId)) == 0) {
            player1Cards.removeAt(j);
            isTapped.removeAt(j);
          }
        }
      }
      cardsToBeAddedInTable.clear();
    });
  }

  void updatePlayer1Hand(){
    setState(() {
      splitInTwoRows(player1Cards.isNotEmpty ? (player1Cards.length > 1 ? player1Cards.length ~/ 2 : 1) : 0);
    });
  }

  List<Widget> splitInTwoRows(int splitCut) {
    return List.generate(player1Cards.length, (index) {
      double containerWidth;
      double cardWidth;
      double totalSpaceForCards;
      double spaceBetweenCards;
      double leftPosition;
      double topPosition;
      double screenWidth = MediaQuery.of(context).size.width;
      double screenHeight = MediaQuery.of(context).size.height;

      if(player1Cards.length > 1 && player1Cards.length <= 19){
        is20CardsInHand = false;
        rowsButtonToggle = false;
        containerWidth = screenWidth * 0.672;
        cardWidth = screenWidth * 0.055;
        totalSpaceForCards = containerWidth - (cardWidth * player1Cards.length);
        spaceBetweenCards = totalSpaceForCards / (player1Cards.length - 1);
        if(player1Cards.length > 1 && player1Cards.length <= 12){
          containerWidth = screenWidth * 0.672;
          cardWidth = screenWidth * 0.055;
          leftPosition = (cardWidth) * index + (screenWidth * 0.005);
          topPosition = isTapped[index] ? yOffset : (screenHeight * 0.01);
        } else if(player1Cards.length >= 13 && player1Cards.length <= 19){
          is20CardsInHand = false;
          if (rowsButtonToggle) {
            containerWidth = screenWidth * 1.305;
            cardWidth = screenWidth * 0.055;
            totalSpaceForCards = containerWidth - (cardWidth * player1Cards.length);
            spaceBetweenCards = totalSpaceForCards / (player1Cards.length - 1);
            leftPosition = (cardWidth + spaceBetweenCards) * index + (screenWidth * 0.005);
            topPosition = isTapped[index] ? yOffset : (screenHeight * 0.01);
          } else {
            containerWidth = screenWidth * 0.672;
            cardWidth = screenWidth * 0.055;
            totalSpaceForCards = containerWidth - (cardWidth * player1Cards.length);
            spaceBetweenCards = totalSpaceForCards / (player1Cards.length - 1);
            leftPosition = (cardWidth + spaceBetweenCards) * index + (screenWidth * 0.005);
            topPosition = isTapped[index] ? yOffset : (screenHeight * 0.01);
          }
        } else {
          containerWidth = screenWidth * 0.672;
          cardWidth = screenWidth * 0.055;
          totalSpaceForCards = containerWidth - (cardWidth * player1Cards.length);
          spaceBetweenCards = totalSpaceForCards / (player1Cards.length - 1);
          leftPosition = (cardWidth + spaceBetweenCards) * index + (screenWidth * 0.005);
          topPosition = isTapped[index] ? yOffset : (screenHeight * 0.01);
        }
      } else{
        if (index < splitCut) {
          is20CardsInHand = false;
          if (rowsButtonToggle) {
            containerWidth = screenWidth * 1.305;
            cardWidth = screenWidth * 0.055;
            totalSpaceForCards = containerWidth - (cardWidth * player1Cards.length);
            spaceBetweenCards = player1Cards.length <= 23 ? (totalSpaceForCards / (player1Cards.length - 1)) - 10 : totalSpaceForCards / (player1Cards.length - 1);
            leftPosition = player1Cards.length <= 23 ? (((cardWidth + spaceBetweenCards) * index + (screenWidth * 0.005)) + screenWidth * 0.06) : (cardWidth + spaceBetweenCards) * index + (screenWidth * 0.005);
            topPosition = isTapped[index] ? yOffset : (screenHeight * 0.01);
          } else {
            containerWidth = screenWidth * 0.672;
            cardWidth = screenWidth * 0.055;
            totalSpaceForCards = containerWidth - (cardWidth * player1Cards.length);
            spaceBetweenCards = totalSpaceForCards / (player1Cards.length - 1);
            leftPosition = (cardWidth + spaceBetweenCards) * index + (screenWidth * 0.005);
            topPosition = isTapped[index] ? yOffset : (screenHeight * 0.01);
          }
        } else {
          is20CardsInHand = true;
          containerWidth = screenWidth * 0.672;
          cardWidth = screenWidth * 0.055;
          totalSpaceForCards = containerWidth - (cardWidth * player1Cards.length);
          spaceBetweenCards = totalSpaceForCards / (player1Cards.length - 1);

          if (rowsButtonToggle) {
            containerWidth = (player1Cards.length) % 2 == 0
                ? (screenWidth * 1.305)
                : (screenWidth * 1.288);
            cardWidth = screenWidth * 0.055;
            totalSpaceForCards = containerWidth - (cardWidth * player1Cards.length);
            spaceBetweenCards = player1Cards.length <= 23 ? (totalSpaceForCards / (player1Cards.length - 1)) - 10 : totalSpaceForCards / (player1Cards.length - 1);
            leftPosition = player1Cards.length <= 23 ? (((cardWidth + spaceBetweenCards) * (index - splitCut) + (screenWidth * 0.005)) + screenWidth * 0.06) : (cardWidth + spaceBetweenCards) * (index - splitCut) + (screenWidth * 0.005);
            topPosition = isTapped[index] ? yOffset + (screenHeight * 0.05) : (screenHeight * 0.06);
          } else {
            leftPosition = (cardWidth + spaceBetweenCards) * index + (screenWidth * 0.005);
            topPosition = isTapped[index] ? yOffset : (screenHeight * 0.01);
          }
        }
      }

      return AnimatedPositioned(
        duration: const Duration(milliseconds: 300),
        left: leftPosition.isFinite ? leftPosition : 5,
        top: topPosition.isFinite ? topPosition : 0,
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
          if (rankCompare != 0) {
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
          if (rankCompare != 0) {
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

  // Custom comparator function to sort the cards in kkk order
  void sortKKK(List<Card?> deck) {
    deck.sort((a, b) {
      // Define the order of suits and ranks
      Map<String, int> suitOrder = {
        'Special': 0,
        'Joker': 1,
        'Spade': 2,
        'Diamond': 3,
        'Club': 4,
        'Heart': 5,
      };

      Map<String, int> rankOrder = {
        '2': 0,
        '15': 1,
        '3': 2,
        '4': 3,
        '5': 4,
        '6': 5,
        '7': 6,
        '8': 7,
        '9': 8,
        '10': 9,
        '11': 10,
        '12': 11,
        '13': 12,
        '14': 13,
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
        if (rankCompare != 0) {
          return rankCompare;
        } else {
          if (suitCompare != 0) {
            return suitCompare;
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
    final translationManager = Provider.of<TranslationManager>(context);
    int player2CardsCount = (player2Cards.length).toInt();
    int deckCount = (deck.length).toInt();
    // int potCount = (pot.length).toInt();
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xFF344264),
      body: Stack(
        children: [
          Center(
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
                                  backgroundImage: const AssetImage(
                                      'assets/menuIcons/blankAvatar_2.png'),
                                ),
                                SizedBox(width: screenWidth * 0.02),
                                Text(
                                  translationManager.translate('ABC XYZ'), //Replace ABC XYZ with Actual Player Name Later
                                  style: TextStyle(
                                      fontSize: screenWidth * 0.01,
                                      color: Colors.white),
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
                                      border: Border.all(
                                          color: Colors.white38, width: 1),
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
                                        right:
                                            (screenWidth * 0.005) + (index * 1),
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
                                    margin:
                                        const EdgeInsets.only(left: 5, top: 5),
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
                                          style: const TextStyle(
                                              fontSize: 10,
                                              color: Colors.black),
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
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Text(
                                      translationManager.translate('ABC XYZ'), //Replace ABC XYZ with Actual Player Name Later
                                      style: const TextStyle(
                                          fontSize: 10, color: Colors.white),
                                    ),
                                  ),
                                  const Spacer(),
                                  const Padding(
                                    padding: EdgeInsets.only(right: 8.0),
                                    child: Text(
                                      '0/0',// Add the player points instead of 0/0
                                      style: TextStyle(
                                          fontSize: 10, color: Colors.white),
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
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Text(
                                      translationManager.translate('XYZ ABC'), //Replace XYZ ABC with Actual Player Name Later
                                      style: const TextStyle(
                                          fontSize: 10, color: Colors.white),
                                    ),
                                  ),
                                  const Spacer(),
                                  const Padding(
                                    padding: EdgeInsets.only(right: 8.0),
                                    child: Text(
                                      '0/0',// Add the player points instead of 0/0
                                      style: TextStyle(
                                          fontSize: 10, color: Colors.white),
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
                            GestureDetector(
                              onTap: () {
                                if(cardsToBeAddedInTable.isNotEmpty){
                                  setState(() {
                                    addToTable();
                                    addTableCardsColumn();
                                  });
                                }
                              },
                              child: Container(
                                width: screenWidth * 0.4,
                                height: screenHeight * 0.52,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.grey.withOpacity(0.2),
                                      width: 2),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.white.withOpacity(0),
                                      spreadRadius: 3,
                                      blurRadius: 7,
                                      offset: const Offset(0, 3),
                                    ),
                                  ],
                                ),
                                child: tableCardsColumnBuild(),
                              ),
                            ),
                            const SizedBox(width: 2.0),
                            Container(
                              width: screenWidth * 0.4,
                              height: screenHeight * 0.52,
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: Colors.grey.withOpacity(0.2),
                                    width: 2),
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
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.white),
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
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
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
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            border: Border.all(
                                                color: Colors.white38,
                                                width: 1),
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
                                                      width:
                                                          screenWidth * 0.042,
                                                      height:
                                                          screenHeight * 0.105,
                                                    ),
                                                  ),
                                                  Positioned(
                                                    left: screenWidth * 0.003,
                                                    child: Image.asset(
                                                      'assets/extraCards/Blue.png',
                                                      fit: BoxFit.fill,
                                                      width:
                                                          screenWidth * 0.035,
                                                      height:
                                                          screenHeight * 0.105,
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
                                                angle:
                                                    pi / 2, // Rotate 90 degrees
                                                child: Stack(
                                                  children: [
                                                    // Rotated cards
                                                    ...List.generate(
                                                      11,
                                                      (index) => Image.asset(
                                                        pot[index + 11]
                                                            .imagePath,
                                                        width:
                                                            screenWidth * 0.035,
                                                        height: screenHeight *
                                                            0.105,
                                                      ),
                                                    ),
                                                    // Covering card for the rest of the cards
                                                    Positioned(
                                                      child: Image.asset(
                                                        'assets/extraCards/Blue.png',
                                                        width:
                                                            screenWidth * 0.035,
                                                        height: screenHeight *
                                                            0.105,
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
                                  SizedBox(height: screenHeight * 0.02),
                                  PopupMenuButton<String>(
                                    color: Colors.grey.withOpacity(0.8),
                                    itemBuilder: (BuildContext context) => [
                                      PopupMenuItem<String>(
                                        value: 'PROFILE',
                                        child: Center(
                                          child: SizedBox(
                                            width: screenWidth * 0.07,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Image.asset(
                                                  'assets/menuIcons/w_profile.png',
                                                  width: screenWidth * 0.06,
                                                  height: screenHeight * 0.06,
                                                ),
                                                SizedBox(
                                                    height:
                                                        screenHeight * 0.01),
                                                Text(
                                                  translationManager.translate('txtProfile').toUpperCase(),
                                                  textAlign: TextAlign.center,
                                                  style: const TextStyle(
                                                    fontSize: 10,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: screenHeight * 0.02,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      PopupMenuItem<String>(
                                        value: 'OPTIONS',
                                        child: Center(
                                          child: SizedBox(
                                            width: screenWidth * 0.07,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Image.asset(
                                                  menuOptionsButton
                                                      ? 'assets/menuIcons/ic_settings_selected.png'
                                                      : 'assets/menuIcons/ic_settings.png',
                                                  width: screenWidth * 0.06,
                                                  height: screenHeight * 0.06,
                                                ),
                                                SizedBox(
                                                    height:
                                                        screenHeight * 0.01),
                                                Text(
                                                  translationManager.translate('txtOptions').toUpperCase(),
                                                  textAlign: TextAlign.center,
                                                  style: const TextStyle(
                                                    fontSize: 10,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: screenHeight * 0.02,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      PopupMenuItem<String>(
                                        value: 'CONTACTS',
                                        child: Center(
                                          child: SizedBox(
                                            width: screenWidth * 0.07,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Image.asset(
                                                  'assets/menuIcons/ic_contacts.png',
                                                  width: screenWidth * 0.06,
                                                  height: screenHeight * 0.06,
                                                ),
                                                SizedBox(
                                                    height:
                                                        screenHeight * 0.01),
                                                Text(
                                                  translationManager.translate('txtContacts').toUpperCase(),
                                                  textAlign: TextAlign.center,
                                                  style: const TextStyle(
                                                    fontSize: 10,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: screenHeight * 0.02,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      PopupMenuItem<String>(
                                        value: 'MESSAGES',
                                        child: Center(
                                          child: SizedBox(
                                            width: screenWidth * 0.07,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Image.asset(
                                                  'assets/menuIcons/mail.png',
                                                  width: screenWidth * 0.06,
                                                  height: screenHeight * 0.06,
                                                ),
                                                SizedBox(
                                                    height:
                                                        screenHeight * 0.01),
                                                Text(
                                                  translationManager.translate('txtMessages').toUpperCase(),
                                                  textAlign: TextAlign.center,
                                                  style: const TextStyle(
                                                    fontSize: 10,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: screenHeight * 0.02,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      PopupMenuItem<String>(
                                        value: 'NOTICE',
                                        child: Center(
                                          child: SizedBox(
                                            width: screenWidth * 0.07,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Image.asset(
                                                  'assets/menuIcons/w_advice.png',
                                                  width: screenWidth * 0.06,
                                                  height: screenHeight * 0.06,
                                                ),
                                                SizedBox(
                                                    height:
                                                        screenHeight * 0.01),
                                                Text(
                                                  translationManager.translate('txtNotice').toUpperCase(),
                                                  textAlign: TextAlign.center,
                                                  style: const TextStyle(
                                                    fontSize: 10,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: screenHeight * 0.02,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      PopupMenuItem<String>(
                                        value: 'CLUBS',
                                        child: Center(
                                          child: SizedBox(
                                            width: screenWidth * 0.07,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Image.asset(
                                                  'assets/menuIcons/ic_clubs.png',
                                                  width: screenWidth * 0.06,
                                                  height: screenHeight * 0.06,
                                                ),
                                                SizedBox(
                                                    height:
                                                        screenHeight * 0.01),
                                                Text(
                                                  translationManager.translate('txtClubs').toUpperCase(),
                                                  textAlign: TextAlign.center,
                                                  style: const TextStyle(
                                                    fontSize: 10,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: screenHeight * 0.02,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      PopupMenuItem<String>(
                                        value: 'EXIT',
                                        child: Center(
                                          child: SizedBox(
                                            width: screenWidth * 0.07,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Image.asset(
                                                  'assets/buttons/button_25_white_exit.png',
                                                  width: screenWidth * 0.07,
                                                  height: screenHeight * 0.07,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                    onSelected: (String value) {
                                      // Handle menu item selection here if needed
                                      print('Selected: $value');
                                      if (value == 'PROFILE') {
                                        setState(() {
                                          menuProfileButton =
                                              !menuProfileButton;
                                        });
                                      } else if (value == 'OPTIONS') {
                                        setState(() {
                                          menuOptionsButton =
                                              !menuOptionsButton;
                                        });
                                      } else if (value == 'CONTACTS') {
                                        setState(() {
                                          menuContactsButton =
                                              !menuContactsButton;
                                        });
                                      } else if (value == 'MESSAGES') {
                                        setState(() {
                                          menuMessagesButton =
                                              !menuMessagesButton;
                                        });
                                      } else if (value == 'NOTICE') {
                                        setState(() {
                                          menuNoticeButton = !menuNoticeButton;
                                        });
                                      } else if (value == 'CLUBS') {
                                        setState(() {
                                          menuClubsButton = !menuClubsButton;
                                        });
                                      } else if (value == 'EXIT') {
                                        setState(() {
                                          menuExitButton = !menuExitButton;
                                        });
                                      }
                                    },
                                    child: SizedBox(
                                      width: screenWidth * 0.05,
                                      height: screenHeight * 0.06,
                                      child: Image.asset(
                                        'assets/buttons/button_25_white.png',
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                  //menu end
                                ],
                              ),
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
                                                updatePlayer1Hand();
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
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                      border: Border.all(
                                                          color: Colors.white38,
                                                          width: 1),
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
                                                    margin: const EdgeInsets.only(
                                                        left: 5, top: 5),
                                                    child: Image.asset(
                                                      'assets/extraCards/Red.png',
                                                      fit: BoxFit.fill,
                                                      width:
                                                          screenWidth * 0.053,
                                                      height:
                                                          screenHeight * 0.147,
                                                    ),
                                                  ),
                                                  Center(
                                                    child: Container(
                                                      width: screenWidth * 0.05,
                                                      height:
                                                          screenHeight * 0.05,
                                                      decoration:
                                                          const BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        color: Colors.white,
                                                      ),
                                                      child: Center(
                                                        child: Text(
                                                          deckCount.toString(),
                                                          style: const TextStyle(
                                                              fontSize: 10,
                                                              color:
                                                                  Colors.black),
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
                                                setState(() {
                                                  giveOrTakeDiscardPile();
                                                });
                                              },
                                              child: Stack(
                                                children: [
                                                  Container(
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                      border: Border.all(
                                                          color: Colors.white38,
                                                          width: 1),
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
                                                  AnimatedBuilder(
                                                    animation: _controller,
                                                    builder: (context, child) {
                                                      return Stack(
                                                        children: List.generate(discardPile.length, (index) {
                                                          // Calculate the animated left position based on index and animation value
                                                          double screenWidth = MediaQuery.of(context).size.width;
                                                          double screenHeight = MediaQuery.of(context).size.height;
                                                          double containerWidth = screenWidth * 0.54;
                                                          double cardWidth = screenWidth * 0.055;
                                                          double totalSpaceForCards = containerWidth - (cardWidth * discardPile.length);
                                                          double spaceBetweenCards = totalSpaceForCards / (discardPile.length - 1);
                                                          double leftPosition = discardPile.length <= 9 ? (cardWidth * index) + (screenWidth * 0.005) : (cardWidth + spaceBetweenCards) * index + (screenWidth * 0.005);
                                                          return AnimatedPositioned(
                                                            duration: const Duration(milliseconds: 300),
                                                            left: leftPosition.isFinite ? leftPosition : 5,
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
                                            backgroundImage: const AssetImage(
                                                'assets/menuIcons/blankAvatar_2.png'),
                                          ),
                                          SizedBox(width: screenWidth * 0.012),
                                          Text(
                                            translationManager.translate('XYZ ABC'), //Replace XYZ ABC with Actual Player Name Later
                                            style: const TextStyle(
                                                fontSize: 10,
                                                color: Colors.white),
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
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                border: Border.all(
                                                    color: Colors.white38,
                                                    width: 1),
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
                                              children: splitInTwoRows(player1Cards.isNotEmpty ? (player1Cards.length > 1 ? player1Cards.length ~/ 2 : 1) : 0),
                                              //   children: populatePlayer1Hand(),
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
                                    SizedBox(
                                      width: screenWidth * 0.06,
                                      height: screenHeight * 0.1,
                                      child: Visibility(
                                        visible: is20CardsInHand,
                                        child: ElevatedButton(
                                          onPressed: () {
                                            setState(() {
                                              rowsButtonToggle =
                                                  !rowsButtonToggle;
                                            });
                                          },
                                          style: ElevatedButton.styleFrom(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            padding: EdgeInsets.zero,
                                            elevation: 0,
                                            backgroundColor: Colors.transparent,
                                          ),
                                          child: Image.asset(
                                            rowsButtonToggle
                                                ? 'assets/buttons/2rowson.png'
                                                : 'assets/buttons/2rowsoff.png',
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Stack(
                                      children: [
                                        SizedBox(
                                          width: screenWidth * 0.06,
                                          height: screenHeight * 0.1,
                                          child: ElevatedButton(
                                            onPressed: () {
                                              setState(() {
                                                sort234Button =
                                                    true; // Hide 234 button
                                                sort432Button =
                                                    false; // Show 432 button
                                                sortKKKButton = false;
                                                sort234(player1Cards);
                                              });
                                            },
                                            style: ElevatedButton.styleFrom(
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              padding: EdgeInsets.zero,
                                              elevation: 0,
                                              backgroundColor:
                                                  Colors.transparent,
                                            ),
                                            child: Image.asset(
                                              sort234Button
                                                  ? 'assets/buttons/sort234on.png'
                                                  : 'assets/buttons/sort234off.png',
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        Visibility(
                                          visible: sort234Button,
                                          child: SizedBox(
                                            width: screenWidth * 0.06,
                                            height: screenHeight * 0.1,
                                            child: ElevatedButton(
                                              onPressed: () {
                                                setState(() {
                                                  sort234Button =
                                                      false; // Show 234 button
                                                  sort432Button =
                                                      true; // Hide 432 button
                                                  sortKKKButton = false;
                                                  sort432(player1Cards);
                                                });
                                              },
                                              style: ElevatedButton.styleFrom(
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                padding: EdgeInsets.zero,
                                                elevation: 0,
                                                backgroundColor:
                                                    Colors.transparent,
                                              ),
                                              child: Image.asset(
                                                sort432Button
                                                    ? 'assets/buttons/sort432on.png'
                                                    : 'assets/buttons/sort432off.png',
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      width: screenWidth * 0.06,
                                      height: screenHeight * 0.1,
                                      child: ElevatedButton(
                                        onPressed: () {
                                          setState(() {
                                            sortKKKButton = !sortKKKButton;
                                            sort234Button = false;
                                            sort432Button = false;
                                            sortKKK(player1Cards);
                                          });
                                        },
                                        style: ElevatedButton.styleFrom(
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          padding: EdgeInsets.zero,
                                          elevation: 0,
                                          backgroundColor: Colors.transparent,
                                        ),
                                        child: Image.asset(
                                          sortKKKButton
                                              ? 'assets/buttons/sortKKKon.png'
                                              : 'assets/buttons/sortKKKoff.png',
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
          //Cards Stack start
          Stack(
              children: List.generate(classicDeck.length, (index) {
                if (index < _animations.length) {
                  double leftPosition = screenWidth / 2 - 50 + _animations[index].value.dx;
                  double topPosition = screenHeight / 2 - 50 + _animations[index].value.dy;
                  // // Calculate center positions
                  // double centerX = screenWidth / 2 - 50;
                  // double centerY = screenHeight / 2 - 50;
                  //
                  // // Determine the quadrant for the card
                  // double dx = _animations[index].value.dx;
                  // double dy = _animations[index].value.dy;
                  //
                  // // Top-left
                  // if (index % 4 == 0) {
                  //   leftPosition = centerX - dx;
                  //   topPosition = centerY - dy;
                  // }
                  // // Top-right
                  // else if (index % 4 == 1) {
                  //   leftPosition = centerX + dx;
                  //   topPosition = centerY - dy;
                  // }
                  // // Bottom-left
                  // else if (index % 4 == 2) {
                  //   leftPosition = centerX - dx;
                  //   topPosition = centerY + dy;
                  // }
                  // // Bottom-right
                  // else if (index % 4 == 3) {
                  //   leftPosition = centerX + dx;
                  //   topPosition = centerY + dy;
                  // }
                  return AnimatedBuilder(
                    animation: _animations[index],
                    builder: (context, child) {
                      return Positioned(
                        left: leftPosition,
                        top: topPosition,
                        child: child!,
                      );
                    },
                    child: Image.asset(
                      classicDeck[index].imagePath,
                      fit: BoxFit.fill,
                      width: screenWidth * 0.055,
                      height: screenHeight * 0.15,
                    ),
                  );
                } else {
                  // Return a placeholder widget if the animation index is out of bounds
                  return Container();
                }
              }),
          ),
          //Cards Stack end
          //Options popup start
          Stack(
            children: [
              Stack(
                children: [
                  if (menuOptionsButton)
                    Positioned.fill(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            menuOptionsButton = false;
                          });
                        },
                        child: Container(
                          color: Colors.transparent,
                        ),
                      ),
                    ),
                  Visibility(
                    visible: menuOptionsButton,
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: EdgeInsets.only(
                            top: screenHeight * 0.03, left: screenWidth * 0.1),
                        child: Container(
                          width: screenWidth * 0.3,
                          height: screenHeight * 0.9,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5.0),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black26,
                                blurRadius: 5,
                                offset: Offset(2, 2),
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    'assets/options_logo_en.png',
                                    width: screenWidth * 0.1,
                                    height: screenHeight * 0.1,
                                  ),
                                ],
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    top: screenHeight * 0.01,
                                    left: screenWidth * 0.01),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          translationManager.translate('txtManualSorting').toUpperCase(),
                                          style: const TextStyle(
                                              fontSize: 15,
                                              color: Colors.black),
                                        ),
                                        const Spacer(),
                                        ElevatedButton(
                                          onPressed: () {
                                            setState(() {
                                              manualSorting = !manualSorting;
                                            });
                                          },
                                          style: ElevatedButton.styleFrom(
                                            elevation: 0.0,
                                          ),
                                          child: Image.asset(
                                            manualSorting
                                                ? 'assets/buttons/toggle_on.png'
                                                : 'assets/buttons/toggle_off.png',
                                            width: screenWidth * 0.06,
                                            height: screenHeight * 0.06,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              //Options popup end
              //Exit Alert Popup start
              Stack(
                children: [
                  if (menuExitButton)
                    Positioned.fill(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            menuExitButton = false;
                          });
                        },
                        child: Container(
                          color: Colors.transparent,
                        ),
                      ),
                    ),
                  Visibility(
                    visible: menuExitButton,
                    child: Align(
                      alignment: Alignment.center,
                      child: Container(
                        width: screenWidth * 0.35,
                        height: screenHeight * 0.3,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.0),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 5,
                              offset: Offset(2, 2),
                            ),
                          ],
                        ),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                translationManager.translate('txtAreYouSureYouWantToExit'),
                                style: TextStyle(
                                    fontSize: screenWidth * 0.02, color: Colors.black),
                              ),
                              const Spacer(),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ElevatedButton(
                                    onPressed: () {
                                      setState(() {
                                        menuExitButton = false;
                                      });
                                    },
                                    style: ElevatedButton.styleFrom(
                                      elevation: 0.0,
                                    ),
                                    child: Image.asset(
                                      'assets/buttons/square_button_edge_glow_rounded_no.png',
                                      width: screenWidth * 0.1,
                                      height: screenHeight * 0.1,
                                    ),
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const CreateTableSP()),
                                      );
                                    },
                                    style: ElevatedButton.styleFrom(
                                      elevation: 0.0,
                                    ),
                                    child: Image.asset(
                                      'assets/buttons/square_button_edge_glow_rounded_yes.png',
                                      width: screenWidth * 0.1,
                                      height: screenHeight * 0.1,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              //Exit Alert Popup end
            ],
          ),
        ],
      ),
    );
  }
}