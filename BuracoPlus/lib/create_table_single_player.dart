import 'package:flutter/material.dart';
import 'package:buracoplus/gameplay_single_player.dart';

class CreateTableSP extends StatefulWidget {
  const CreateTableSP({super.key});

  @override
  State<CreateTableSP> createState() => _CreateTableSPState();
}

class _CreateTableSPState extends State<CreateTableSP> {
  bool classicToggle = false;
  bool professionalToggle = true;
  bool twoPlayersToggle = true;
  bool fourPlayersToggle = false;
  bool directToggle = true;
  bool indirectToggle = false;
  bool makartCheckbox = true;
  bool pointsOne = true;
  bool pointsTwo = false;
  bool pointsThree = false;
  bool pointsFour = false;
  bool difficultyEasy = true;
  bool difficultyNormal = false;

  void toggleSelection(String toggleSelected) {
    switch (toggleSelected) {
      case "classicToggle":
        setState(() {
          classicToggle = true;
          professionalToggle = false;
        });
        return;
      case "professionalToggle":
        setState(() {
          professionalToggle = true;
          classicToggle = false;
        });
        return;
      case "twoPlayersToggle":
        setState(() {
          twoPlayersToggle = true;
          fourPlayersToggle = false;
        });
        return;
      case "fourPlayersToggle":
        setState(() {
          fourPlayersToggle = true;
          twoPlayersToggle = false;
        });
        return;
      case "directToggle":
        setState(() {
          directToggle = true;
          indirectToggle = false;
        });
        return;
      case "indirectToggle":
        setState(() {
          indirectToggle = true;
          directToggle = false;
        });
        return;
      case "makartCheckbox":
        setState(() {
          makartCheckbox = !makartCheckbox;
        });
        return;
      case "pointsOne":
        setState(() {
          pointsOne = true;
          pointsTwo = false;
          pointsThree = false;
          pointsFour = false;
        });
        return;
      case "pointsTwo":
        setState(() {
          pointsTwo = true;
          pointsOne = false;
          pointsThree = false;
          pointsFour = false;
        });
        return;
      case "pointsThree":
        setState(() {
          pointsThree = true;
          pointsOne = false;
          pointsTwo = false;
          pointsFour = false;
        });
        return;
      case "pointsFour":
        setState(() {
          pointsFour = true;
          pointsOne = false;
          pointsTwo = false;
          pointsThree = false;
        });
        return;
      case "difficultyEasy":
        setState(() {
          difficultyEasy = true;
          difficultyNormal = false;
        });
        return;
      case "difficultyNormal":
        setState(() {
          difficultyNormal = true;
          difficultyEasy = false;
        });
        return;
      default:
        return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            Container(
                decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color.fromRGBO(
                      114, 60, 125, 1.0), // Colore medio lato sinistro
                  Color.fromRGBO(
                      141, 107, 147, 1.0), // Colore medio lato superiore
                  Color.fromRGBO(
                      96, 132, 166, 1.0), // Colore medio lato inferiore
                  Color.fromRGBO(88, 104, 147, 1.0), // Colore medio lato destro
                ],
                stops: [
                  0.0,
                  0.33,
                  0.66,
                  1.0
                ], // Regola questi valori per i tuoi bisogni
              ),
            )),
            Positioned(
              top: 10.0,
              right: 70.0,
              child: Container(
                width: 115,
                height: 45,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                ),
              ),
            ),
            Center(
                child: Column(
              children: [
                Image.asset(
                  'assets/logo-and-cards.png',
                  width: 100,
                  height: 50,
                ),
              ],
            )),
            Positioned.fill(
              child: Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 460,
                    height: 340,
                    decoration: BoxDecoration(
                      color:
                          const Color.fromRGBO(255, 255, 255, 20), // Box color
                      borderRadius:
                          BorderRadius.circular(10.0), // Rounded corners
                    ),
                    child: Column(
                      children: [
                        const Text(
                          'Game Options',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 5.0),
                        Row(
                          children: [
                            const SizedBox(width: 20.0),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16.0, vertical: 0.0),
                              decoration: BoxDecoration(
                                color: Colors.blueAccent.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              child: Row(
                                children: [
                                  const Text(
                                    'Buraco Rule',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 12.0),
                                  ),
                                  const SizedBox(width: 18.0),
                                  ElevatedButtonTheme(
                                    data: ElevatedButtonThemeData(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.transparent,
                                        padding: EdgeInsets.zero,
                                        elevation: 0.0,
                                      ),
                                    ),
                                    child: ElevatedButton(
                                      style: ButtonStyle(
                                        fixedSize: MaterialStateProperty.all(
                                            const Size(140, 40)),
                                      ),
                                      onPressed: () {},
                                      child: Ink.image(
                                        image: classicToggle
                                            ? const AssetImage(
                                                'assets/button_23_curved.png')
                                            : const AssetImage(
                                                'assets/button_22_curved.png'),
                                        fit: BoxFit.fill,
                                        child: InkWell(
                                          onTap: () {
                                            toggleSelection("classicToggle");
                                          },
                                          child: Center(
                                            child: Text(
                                              'Classic',
                                              style: TextStyle(
                                                color: classicToggle
                                                    ? Colors.white
                                                    : Colors.black87,
                                                fontSize: 12.0,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 20.0),
                                  ElevatedButtonTheme(
                                    data: ElevatedButtonThemeData(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.transparent,
                                        padding: EdgeInsets.zero,
                                        elevation: 0.0,
                                      ),
                                    ),
                                    child: ElevatedButton(
                                      style: ButtonStyle(
                                        fixedSize: MaterialStateProperty.all(
                                            const Size(140, 40)),
                                      ),
                                      onPressed: () {},
                                      child: Ink.image(
                                        image: professionalToggle
                                            ? const AssetImage(
                                                'assets/button_23_curved.png')
                                            : const AssetImage(
                                                'assets/button_22_curved.png'),
                                        fit: BoxFit.fill,
                                        child: InkWell(
                                          onTap: () {
                                            toggleSelection(
                                                "professionalToggle");
                                          },
                                          child: Center(
                                            child: Text(
                                              'Professional',
                                              style: TextStyle(
                                                color: professionalToggle
                                                    ? Colors.white
                                                    : Colors.black87,
                                                fontSize: 12.0,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: professionalToggle ? 5.0 : 20.0),
                        Row(
                          children: [
                            const SizedBox(width: 20.0),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16.0, vertical: 0.0),
                              decoration: BoxDecoration(
                                color: Colors.blueAccent.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              child: Row(
                                children: [
                                  const Text(
                                    'Players',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 12.0),
                                  ),
                                  const SizedBox(width: 46.0),
                                  ElevatedButtonTheme(
                                    data: ElevatedButtonThemeData(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.transparent,
                                        padding: EdgeInsets.zero,
                                        elevation: 0.0,
                                      ),
                                    ),
                                    child: ElevatedButton(
                                      style: ButtonStyle(
                                        fixedSize: MaterialStateProperty.all(
                                            const Size(140, 40)),
                                      ),
                                      onPressed: () {},
                                      child: Ink.image(
                                        image: twoPlayersToggle
                                            ? const AssetImage(
                                                'assets/button_23_curved.png')
                                            : const AssetImage(
                                                'assets/button_22_curved.png'),
                                        fit: BoxFit.fill,
                                        child: InkWell(
                                          onTap: () {
                                            toggleSelection("twoPlayersToggle");
                                          },
                                          child: Center(
                                            child: Text(
                                              '2 Players',
                                              style: TextStyle(
                                                color: twoPlayersToggle
                                                    ? Colors.white
                                                    : Colors.black87,
                                                fontSize: 12.0,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 20.0),
                                  ElevatedButtonTheme(
                                    data: ElevatedButtonThemeData(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.transparent,
                                        padding: EdgeInsets.zero,
                                        elevation: 0.0,
                                      ),
                                    ),
                                    child: ElevatedButton(
                                      style: ButtonStyle(
                                        fixedSize: MaterialStateProperty.all(
                                            const Size(140, 40)),
                                      ),
                                      onPressed: () {},
                                      child: Ink.image(
                                        image: fourPlayersToggle
                                            ? const AssetImage(
                                                'assets/button_23_curved.png')
                                            : const AssetImage(
                                                'assets/button_22_curved.png'),
                                        fit: BoxFit.fill,
                                        child: InkWell(
                                          onTap: () {
                                            toggleSelection(
                                                "fourPlayersToggle");
                                          },
                                          child: Center(
                                            child: Text(
                                              '4 Players',
                                              style: TextStyle(
                                                color: fourPlayersToggle
                                                    ? Colors.white
                                                    : Colors.black87,
                                                fontSize: 12.0,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Visibility(
                            visible: professionalToggle,
                            child: Column(
                              children: [
                                SizedBox(
                                    height: professionalToggle ? 5.0 : 20.0),
                                Row(
                                  children: [
                                    const SizedBox(width: 20.0),
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 16.0, vertical: 0.0),
                                      decoration: BoxDecoration(
                                        color:
                                            Colors.blueAccent.withOpacity(0.1),
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                      ),
                                      child: Row(
                                        children: [
                                          const Text(
                                            'Mode',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 12.0),
                                          ),
                                          const SizedBox(width: 57.0),
                                          ElevatedButtonTheme(
                                            data: ElevatedButtonThemeData(
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor:
                                                    Colors.transparent,
                                                padding: EdgeInsets.zero,
                                                elevation: 0.0,
                                              ),
                                            ),
                                            child: ElevatedButton(
                                              style: ButtonStyle(
                                                fixedSize:
                                                    MaterialStateProperty.all(
                                                        const Size(78, 40)),
                                              ),
                                              onPressed: () {},
                                              child: Ink.image(
                                                image: directToggle
                                                    ? const AssetImage(
                                                        'assets/button_23_curved.png')
                                                    : const AssetImage(
                                                        'assets/button_22_curved.png'),
                                                fit: BoxFit.fill,
                                                child: InkWell(
                                                  onTap: () {
                                                    toggleSelection(
                                                        "directToggle");
                                                  },
                                                  child: Center(
                                                    child: Text(
                                                      'Direct',
                                                      style: TextStyle(
                                                        color: directToggle
                                                            ? Colors.white
                                                            : Colors.black87,
                                                        fontSize: 12.0,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(width: 20.0),
                                          ElevatedButtonTheme(
                                            data: ElevatedButtonThemeData(
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor:
                                                    Colors.transparent,
                                                padding: EdgeInsets.zero,
                                                elevation: 0.0,
                                              ),
                                            ),
                                            child: ElevatedButton(
                                              style: ButtonStyle(
                                                fixedSize:
                                                    MaterialStateProperty.all(
                                                        const Size(78, 40)),
                                              ),
                                              onPressed: () {},
                                              child: Ink.image(
                                                image: indirectToggle
                                                    ? const AssetImage(
                                                        'assets/button_23_curved.png')
                                                    : const AssetImage(
                                                        'assets/button_22_curved.png'),
                                                fit: BoxFit.fill,
                                                child: InkWell(
                                                  onTap: () {
                                                    toggleSelection(
                                                        "indirectToggle");
                                                  },
                                                  child: Center(
                                                    child: Text(
                                                      'Indirect',
                                                      style: TextStyle(
                                                        color: indirectToggle
                                                            ? Colors.white
                                                            : Colors.black87,
                                                        fontSize: 12.0,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(width: 15.0),
                                          ElevatedButtonTheme(
                                            data: ElevatedButtonThemeData(
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor:
                                                    Colors.transparent,
                                                padding: EdgeInsets.zero,
                                                elevation: 0.0,
                                              ),
                                            ),
                                            child: Row(
                                              children: [
                                                const Text(
                                                  'Makart',
                                                  style: TextStyle(
                                                    color: Colors.black87,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 12.0,
                                                  ),
                                                ),
                                                const SizedBox(width: 0.0),
                                                ElevatedButton(
                                                  onPressed: () {},
                                                  child: Stack(
                                                    children: [
                                                      Ink.image(
                                                        image: const AssetImage(
                                                            'assets/button_22_curved.png'),
                                                        fit: BoxFit.fill,
                                                        width: 30,
                                                        height: 30,
                                                        child: InkWell(
                                                          onTap: () {
                                                            toggleSelection(
                                                                "makartCheckbox");
                                                          },
                                                        ),
                                                      ),
                                                      Positioned(
                                                        top: 5,
                                                        right: 0,
                                                        left: 0,
                                                        child: Ink.image(
                                                          image: makartCheckbox
                                                              ? const AssetImage(
                                                                  'assets/ic_check_gradiant2.png')
                                                              : const AssetImage(
                                                                  'assets/white_empty.png'),
                                                          width: 40,
                                                          height: 20,
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
                              ],
                            )),
                        SizedBox(height: professionalToggle ? 5.0 : 20.0),
                        Row(
                          children: [
                            const SizedBox(width: 20.0),
                            Container(
                              width: 420,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16.0, vertical: 0.0),
                              decoration: BoxDecoration(
                                color: Colors.blueAccent.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              child: Row(
                                children: [
                                  const Text(
                                    'Points',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 12.0),
                                  ),
                                  const SizedBox(width: 54.0),
                                  ElevatedButtonTheme(
                                    data: ElevatedButtonThemeData(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.transparent,
                                        padding: EdgeInsets.zero,
                                        elevation: 0.0,
                                      ),
                                    ),
                                    child: ElevatedButton(
                                      style: ButtonStyle(
                                        fixedSize: MaterialStateProperty.all(
                                            const Size(66.5, 40)),
                                      ),
                                      onPressed: () {},
                                      child: Ink.image(
                                        image: pointsOne
                                            ? const AssetImage(
                                                'assets/button_23_curved.png')
                                            : const AssetImage(
                                                'assets/button_22_curved.png'),
                                        fit: BoxFit.fill,
                                        child: InkWell(
                                          onTap: () {
                                            toggleSelection("pointsOne");
                                          },
                                          child: Center(
                                            child: Text(
                                              'One Hand',
                                              style: TextStyle(
                                                color: pointsOne
                                                    ? Colors.white
                                                    : Colors.black87,
                                                fontSize: 11.0,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  ElevatedButtonTheme(
                                    data: ElevatedButtonThemeData(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.transparent,
                                        padding: EdgeInsets.zero,
                                        elevation: 0.0,
                                      ),
                                    ),
                                    child: ElevatedButton(
                                      style: ButtonStyle(
                                        fixedSize: MaterialStateProperty.all(
                                            const Size(66.5, 40)),
                                      ),
                                      onPressed: () {},
                                      child: Ink.image(
                                        image: pointsTwo
                                            ? const AssetImage(
                                                'assets/button_23_curved.png')
                                            : const AssetImage(
                                                'assets/button_22_curved.png'),
                                        fit: BoxFit.fill,
                                        child: InkWell(
                                          onTap: () {
                                            toggleSelection("pointsTwo");
                                          },
                                          child: Center(
                                            child: Text(
                                              classicToggle ? "1005" : "1505",
                                              style: TextStyle(
                                                color: pointsTwo
                                                    ? Colors.white
                                                    : Colors.black87,
                                                fontSize: 12.0,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  ElevatedButtonTheme(
                                    data: ElevatedButtonThemeData(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.transparent,
                                        padding: EdgeInsets.zero,
                                        elevation: 0.0,
                                      ),
                                    ),
                                    child: ElevatedButton(
                                      style: ButtonStyle(
                                        fixedSize: MaterialStateProperty.all(
                                            const Size(66.5, 40)),
                                      ),
                                      onPressed: () {},
                                      child: Ink.image(
                                        image: pointsThree
                                            ? const AssetImage(
                                                'assets/button_23_curved.png')
                                            : const AssetImage(
                                                'assets/button_22_curved.png'),
                                        fit: BoxFit.fill,
                                        child: InkWell(
                                          onTap: () {
                                            toggleSelection("pointsThree");
                                          },
                                          child: Center(
                                            child: Text(
                                              classicToggle ? "1505" : "2000",
                                              style: TextStyle(
                                                color: pointsThree
                                                    ? Colors.white
                                                    : Colors.black87,
                                                fontSize: 12.0,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  Visibility(
                                    visible: classicToggle,
                                    child: ElevatedButtonTheme(
                                      data: ElevatedButtonThemeData(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.transparent,
                                          padding: EdgeInsets.zero,
                                          elevation: 0.0,
                                        ),
                                      ),
                                      child: ElevatedButton(
                                        style: ButtonStyle(
                                          fixedSize: MaterialStateProperty.all(
                                              const Size(66.5, 40)),
                                        ),
                                        onPressed: () {
                                          // Your onPressed logic here
                                        },
                                        child: Ink.image(
                                          image: pointsFour
                                              ? const AssetImage(
                                                  'assets/button_23_curved.png')
                                              : const AssetImage(
                                                  'assets/button_22_curved.png'),
                                          fit: BoxFit.fill,
                                          width: double
                                              .infinity, // Make the image fill the button
                                          height: double
                                              .infinity, // Make the image fill the button
                                          child: InkWell(
                                            onTap: () {
                                              toggleSelection("pointsFour");
                                            },
                                            child: Center(
                                              child: Text(
                                                "2005",
                                                style: TextStyle(
                                                  color: pointsFour
                                                      ? Colors.white
                                                      : Colors.black87,
                                                  fontSize: 12.0,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: professionalToggle ? 5.0 : 20.0),
                        Row(
                          children: [
                            const SizedBox(width: 20.0),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16.0, vertical: 0.0),
                              decoration: BoxDecoration(
                                color: Colors.blueAccent.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              child: Row(
                                children: [
                                  const Text(
                                    'Difficulty',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 12.0),
                                  ),
                                  const SizedBox(width: 34.0),
                                  ElevatedButtonTheme(
                                    data: ElevatedButtonThemeData(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.transparent,
                                        padding: EdgeInsets.zero,
                                        elevation: 0.0,
                                      ),
                                    ),
                                    child: ElevatedButton(
                                      style: ButtonStyle(
                                        fixedSize: MaterialStateProperty.all(
                                            const Size(140, 40)),
                                      ),
                                      onPressed: () {},
                                      child: Ink.image(
                                        image: difficultyEasy
                                            ? const AssetImage(
                                                'assets/button_23_curved.png')
                                            : const AssetImage(
                                                'assets/button_22_curved.png'),
                                        fit: BoxFit.fill,
                                        child: InkWell(
                                          onTap: () {
                                            toggleSelection("difficultyEasy");
                                          },
                                          child: Center(
                                            child: Text(
                                              'Easy',
                                              style: TextStyle(
                                                color: difficultyEasy
                                                    ? Colors.white
                                                    : Colors.black87,
                                                fontSize: 12.0,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 20.0),
                                  ElevatedButtonTheme(
                                    data: ElevatedButtonThemeData(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.transparent,
                                        padding: EdgeInsets.zero,
                                        elevation: 0.0,
                                      ),
                                    ),
                                    child: ElevatedButton(
                                      style: ButtonStyle(
                                        fixedSize: MaterialStateProperty.all(
                                            const Size(140, 40)),
                                      ),
                                      onPressed: () {},
                                      child: Ink.image(
                                        image: difficultyNormal
                                            ? const AssetImage(
                                                'assets/button_23_curved.png')
                                            : const AssetImage(
                                                'assets/button_22_curved.png'),
                                        fit: BoxFit.fill,
                                        child: InkWell(
                                          onTap: () {
                                            toggleSelection("difficultyNormal");
                                          },
                                          child: Center(
                                            child: Text(
                                              'Normal',
                                              style: TextStyle(
                                                color: difficultyNormal
                                                    ? Colors.white
                                                    : Colors.black87,
                                                fontSize: 12.0,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 5.0),
                        ElevatedButtonTheme(
                          data: ElevatedButtonThemeData(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              padding: EdgeInsets.zero,
                              elevation: 0.0,
                            ),
                          ),
                          child: ElevatedButton(
                            style: ButtonStyle(
                              fixedSize: MaterialStateProperty.all(
                                  const Size(150, 40)),
                            ),
                            onPressed: () {},
                            child: Ink.image(
                              image: const AssetImage(
                                  'assets/square_curved_2.png'),
                              fit: BoxFit.fill,
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const GameplaySP()));
                                },
                                child: const Center(
                                  child: Text(
                                    'PLAY GAME',
                                    style: TextStyle(
                                      color: Colors.black87,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12.0,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )),
            ),
          ],
        ),
      ),
      floatingActionButton: Stack(
        children: [
          Positioned(
            width: 70,
            bottom: 0.0,
            left: 100.0,
            child: FloatingActionButton(
              heroTag: null,
              onPressed: () {
                Navigator.of(context).pop();
              },
              backgroundColor: Colors.transparent,
              splashColor: Colors.transparent,
              elevation: 0.0,
              child: Row(children: [
                Transform.rotate(
                  angle: 1.6,
                  child: Image.asset(
                    'assets/simple_arrow_down.png',
                    width: 30,
                    height: 30,
                  ),
                ),
                const Text('BACK', style: TextStyle(color: Colors.white)),
              ]),
            ),
          ),
          Positioned(
            width: 50,
            top: 50.0,
            right: 55.0,
            child: FloatingActionButton(
              heroTag: null,
              onPressed: () {
                //exit(0);
              },
              backgroundColor: Colors.transparent,
              splashColor: Colors.transparent,
              elevation: 0.0,
              child: Column(children: [
                Image.asset(
                  'assets/ic_settings.png',
                  width: 30,
                  height: 25,
                ),
                const Text('OPTIONS',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.bold)),
              ]),
            ),
          ),
          Positioned(
            width: 50,
            height: 50,
            top: 50.0,
            right: 0.0,
            child: FloatingActionButton(
              heroTag: null,
              onPressed: () {
                //exit(0);
              },
              backgroundColor: Colors.transparent,
              splashColor: Colors.transparent,
              elevation: 0.0,
              child: Column(
                children: [
                  Image.asset(
                    'assets/ic_rankings.png',
                    width: 30,
                    height: 25,
                  ),
                  const Text('RANKING',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
