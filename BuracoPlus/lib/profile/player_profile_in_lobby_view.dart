import 'package:buracoplus/menu_views/notices/variables.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:math' as math;
import '../providers/dialog_provider.dart';
import 'clippers/profile_cliper.dart';
import 'widgets/club_badge.dart';

class PlayerProfileLobbyView extends StatefulWidget {
  const PlayerProfileLobbyView({super.key});

  @override
  State<PlayerProfileLobbyView> createState() => _MyProfileState();
}

class _MyProfileState extends State<PlayerProfileLobbyView> {
  //page view
  final PageController _pageController = PageController();
  int _currentPage = 0;
  @override
  void initState() {
    super.initState();

    _pageController.addListener(() {
      final newPage = _pageController.page?.round() ?? 0;
      if (newPage != _currentPage) {
        setState(() {
          _currentPage = newPage;
        });
      }
    });
  }

  void _onButtonPressed(int page) {
    setState(() {
      _currentPage = page;
    });
    print(_currentPage);
    _pageController.animateToPage(
      page,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;
    final devicePixelRatio = mediaQuery.devicePixelRatio;
    final screenDiagonalPixels = math.sqrt(
      (screenWidth * devicePixelRatio) * (screenWidth * devicePixelRatio) +
          (screenHeight * devicePixelRatio) * (screenHeight * devicePixelRatio),
    );
    final dpi = devicePixelRatio * 160;
    final screenDiagonalInches = screenDiagonalPixels / dpi;

    final isTablet = screenDiagonalInches > 7.0;

    return Consumer<DialogProvider>(builder: (context, dialogProvider, child) {
      if (dialogProvider.isPlayerProfileDialogVisible) {
        return Stack(
          children: [
            Positioned.fill(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    dialogProvider.hideProfileDialogVisible();
                  });
                },
                child: Container(
                  color: Colors.black.withOpacity(0.3),
                ),
              ),
            ),
            AnimatedPositioned(
              curve: Curves.easeInOut,
              top: MediaQuery.of(context).size.height < 550 ? 10.0 : 20.0,
              bottom: MediaQuery.of(context).size.height < 550 ? 10.0 : 60.0,
              left: Directionality.of(context) == TextDirection.rtl ? 15 : null,
              right:
                  Directionality.of(context) == TextDirection.rtl ? null : 15,
              duration: const Duration(milliseconds: 300),
              child: Material(
                elevation: 100,
                type: MaterialType.canvas,
                borderRadius: BorderRadius.circular(20.0),
                shadowColor: const Color.fromARGB(255, 80, 110, 150),
                child: Container(
                  width: screenWidth * 0.34,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.white,
                      width: 0.2,
                    ),
                    borderRadius: BorderRadius.circular(20.0),
                    color: const Color(0xFFE4E4E4),
                  ),
                  child: Column(
                    children: [
                      Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Positioned(
                            top: isTablet ? 80 : 75,
                            left: 0,
                            right: 0,
                            child: ClipPath(
                              clipper: ProfileClipperShadow(),
                              child: Container(
                                padding: EdgeInsets.only(
                                  left: 10,
                                  top: isTablet ? 10 : 8,
                                  bottom: isTablet ? 10 : 8,
                                ),
                                width: double.infinity,
                                height: isTablet
                                    ? screenHeight * 0.30
                                    : MediaQuery.of(context).size.height < 550
                                        ? screenHeight * 0.30
                                        : screenHeight * 0.34,
                                // decoration: menuBorderRadius,
                                color: Color(0xFF78377E),
                              ),
                            ),
                          ),
                          ClipPath(
                            clipper: ProfileClipper(),
                            clipBehavior: Clip.hardEdge,
                            child: Container(
                              padding: EdgeInsets.only(
                                left: 10,
                                top: isTablet ? 10 : 8,
                                bottom: isTablet ? 10 : 8,
                              ),
                              width: double.infinity,
                              height: isTablet
                                  ? screenHeight * 0.40
                                  : MediaQuery.of(context).size.height < 550
                                      ? screenHeight * 0.50
                                      : screenHeight * 0.55,
                              decoration: menuBorderRadius,
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.all(4),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(6),
                                          color: Colors.white.withOpacity(0.2),
                                        ),
                                        child: Image.asset(
                                          'assets/menuIcons/ic_settings.png',
                                          width: isTablet ? 30 : 20,
                                          height: isTablet ? 30 : 20,
                                        ),
                                      ),
                                      const SizedBox(width: 10),
                                      Text(
                                        'EDIT PROFILE',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: isTablet ? 14 : 10,
                                        ),
                                      ),
                                      const Spacer(),
                                      SizedBox(
                                        height: 30,
                                        child: IconButton(
                                          padding: EdgeInsets.all(0),
                                          onPressed: () {
                                            print(MediaQuery.of(context)
                                                .size
                                                .height);
                                            setState(() {
                                              dialogProvider
                                                  .hideProfileDialogVisible();
                                            });
                                          },
                                          icon: const Icon(
                                            Icons.close,
                                            color: Colors.white,
                                            size: 25,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: isTablet ? 30 : 20,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 24, bottom: 8),
                                        child: Text(
                                          'Isa2024',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: isTablet ? 22 : 12,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      const SizedBox(width: 10),
                                      Expanded(
                                        child: Stack(
                                          children: [
                                            Container(
                                              width: isTablet ? 110 : 70,
                                              height: isTablet ? 110 : 70,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                border: Border.all(
                                                  color: Color.fromARGB(
                                                      255, 255, 255, 255),
                                                  width: 8.0,
                                                ),
                                              ),
                                              child: ClipOval(
                                                child: Image.asset(
                                                  'assets/menuIcons/blankAvatar_2.png',
                                                  width: isTablet ? 110 : 70,
                                                  height: isTablet ? 110 : 70,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                            Positioned(
                                              bottom: 0,
                                              right: isTablet ? 25 : 10,
                                              child: Container(
                                                width: isTablet ? 35 : 25,
                                                height: isTablet ? 35 : 25,
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  shape: BoxShape.circle,
                                                ),
                                                child: Center(
                                                  child: IconButton(
                                                    padding: EdgeInsets.all(0),
                                                    icon: Icon(
                                                      Icons.camera_alt_outlined,
                                                      color: Colors.black,
                                                      size: isTablet ? 25 : 15,
                                                    ),
                                                    onPressed: () {},
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              EdgeInsets.all(isTablet ? 8 : 2),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Registerd',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize:
                                                        isTablet ? 14 : 10,
                                                    height: 1),
                                              ),
                                              Text(
                                                '22/03/2023',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: isTablet ? 14 : 10,
                                                ),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Text(
                                                'Subscription',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize:
                                                        isTablet ? 14 : 10,
                                                    height: 1),
                                              ),
                                              Text(
                                                '22/03/2023',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: isTablet ? 14 : 10,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 8),
                                          decoration: BoxDecoration(
                                            color: Color(0xFF8272A1),
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            boxShadow: const [
                                              BoxShadow(
                                                color: Color(0xFFD0C9D2),
                                                offset: Offset(0, 0),
                                                blurRadius: 1,
                                                spreadRadius: 0.1,
                                              ),
                                            ],
                                          ),
                                          alignment: Alignment.center,
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.symmetric(
                                                  vertical: isTablet ? 4 : 2,
                                                ),
                                                child: Row(
                                                  children: [
                                                    SizedBox(
                                                      width: isTablet ? 20 : 10,
                                                      height:
                                                          isTablet ? 20 : 10,
                                                      child: Image.asset(
                                                        'assets/lobby/BuracoPlusCoin.png',
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 8),
                                                      child: Text(
                                                        '2,523,998',
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: isTablet
                                                              ? 14
                                                              : 10,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.symmetric(
                                                  vertical: isTablet ? 4 : 2,
                                                ),
                                                child: Row(
                                                  children: [
                                                    SizedBox(
                                                      width: isTablet ? 20 : 10,
                                                      height:
                                                          isTablet ? 20 : 10,
                                                      child: Image.asset(
                                                        'assets/lobby/BuracoPlusLife_big.png',
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 8),
                                                      child: Text(
                                                        '13',
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: isTablet
                                                              ? 14
                                                              : 10,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.symmetric(
                                                  vertical: isTablet ? 4 : 2,
                                                ),
                                                child: Row(
                                                  children: [
                                                    SizedBox(
                                                      width: isTablet ? 20 : 10,
                                                      height:
                                                          isTablet ? 20 : 10,
                                                      child: Image.asset(
                                                        'assets/lobby/diamond-final.png',
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 8),
                                                      child: Text(
                                                        '5,233,787',
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: isTablet
                                                              ? 14
                                                              : 10,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: isTablet ? 25 : 10,
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                        ),
                        child: Container(
                          height: isTablet ? 40 : 30,
                          decoration: BoxDecoration(
                            color: const Color(0xFFD0C9D2),
                            borderRadius: BorderRadius.circular(30),
                            boxShadow: const [
                              BoxShadow(
                                color: Color(0xFFD0C9D2),
                                offset: Offset(0, 0),
                                blurRadius: 1.12,
                                spreadRadius: 2.0,
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(2),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Expanded(
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: _currentPage == 0
                                          ? Color(0xFF84588E)
                                          : Color(0xFF60266C),
                                      elevation: 5.0,
                                      shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(20),
                                            topLeft: Radius.circular(
                                                20)), // button's shape
                                      ),
                                    ),
                                    onPressed: () => _onButtonPressed(0),
                                    child: Center(
                                      child: Text(
                                        'PROFESSIONAL',
                                        style: TextStyle(
                                          fontSize: isTablet ? 10 : 8,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 0.5,
                                  color: Colors.white,
                                ),
                                Expanded(
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: _currentPage == 0
                                          ? Color(0xFF60266C)
                                          : Color(0xFF84588E),
                                      elevation: 5.0,
                                      shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                          bottomRight: Radius.circular(20),
                                          topRight: Radius.circular(20),
                                        ), // button's shape
                                      ),
                                    ),
                                    onPressed: () => _onButtonPressed(1),
                                    child: Center(
                                      child: Text(
                                        'CLASSIC',
                                        style: TextStyle(
                                          fontSize: isTablet ? 10 : 8,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10, vertical: isTablet ? 0 : 0),
                          child: PageView(
                            controller: _pageController,
                            children: [
                              ListView(
                                padding: EdgeInsets.zero,
                                children: [
                                  Stack(clipBehavior: Clip.none, children: [
                                    Container(
                                      width: double.infinity,
                                      height: isTablet ? 100 : 300,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 8.0, left: 8.0, right: 8.0),
                                      child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            color: Colors.white),
                                        child: Padding(
                                          padding: EdgeInsets.all(
                                              isTablet ? 16 : 10.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                children: [
                                                  Text(
                                                    'POINTS',
                                                    style: TextStyle(
                                                        color: const Color(
                                                            0xFF60266C),
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize:
                                                            isTablet ? 16 : 12,
                                                        height: 0.5),
                                                  ),
                                                  Text(
                                                    '24,499',
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize:
                                                          isTablet ? 24 : 18,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                  width: isTablet ? 50 : 40),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'LEVEL',
                                                    style: TextStyle(
                                                        color: const Color(
                                                            0xFF60266C),
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize:
                                                            isTablet ? 16 : 12,
                                                        height: 0.5),
                                                  ),
                                                  Row(
                                                    children: [
                                                      Text(
                                                        '140',
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: isTablet
                                                              ? 24
                                                              : 18,
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(6.0),
                                                        child: Container(
                                                          width: 25,
                                                          height: 25,
                                                          child: Image.asset(
                                                            'assets/shop/special.png',
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      top: isTablet ? 100 : 80,
                                      right: 0,
                                      left: 0,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            top: 4.0, left: 8.0, right: 8.0),
                                        child: Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(25),
                                              color: Colors.white),
                                          child: Padding(
                                            padding: EdgeInsets.all(
                                                isTablet ? 16 : 8),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Center(
                                                    child: Text(
                                                      'STATS OVERVIEW',
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize:
                                                            isTablet ? 16 : 14,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.all(
                                                      isTablet ? 16 : 8),
                                                  child: Stack(
                                                    children: [
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceAround,
                                                        children: [
                                                          Expanded(
                                                            child: Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Row(
                                                                  children: [
                                                                    Text(
                                                                      'Vittorie',
                                                                      style: TextStyle(
                                                                          color: const Color(
                                                                              0xFF7D72D9),
                                                                          fontWeight: FontWeight
                                                                              .bold,
                                                                          fontSize: isTablet
                                                                              ? 14
                                                                              : 12),
                                                                    ),
                                                                    SizedBox(
                                                                        width: isTablet
                                                                            ? 60
                                                                            : 40),
                                                                    Text(
                                                                      '24,227',
                                                                      style: TextStyle(
                                                                          color: Colors
                                                                              .black,
                                                                          fontWeight: FontWeight
                                                                              .bold,
                                                                          fontSize: isTablet
                                                                              ? 14
                                                                              : 12),
                                                                    ),
                                                                  ],
                                                                ),
                                                                const SizedBox(
                                                                    height: 8),
                                                                Row(
                                                                  children: [
                                                                    Text(
                                                                      'Sconfitte',
                                                                      style: TextStyle(
                                                                          color: Colors
                                                                              .black,
                                                                          fontWeight: FontWeight
                                                                              .bold,
                                                                          fontSize: isTablet
                                                                              ? 14
                                                                              : 12),
                                                                    ),
                                                                    SizedBox(
                                                                        width: isTablet
                                                                            ? 60
                                                                            : 40),
                                                                    Text(
                                                                      '4,584',
                                                                      style: TextStyle(
                                                                          color: Colors
                                                                              .black,
                                                                          fontWeight: FontWeight
                                                                              .bold,
                                                                          fontSize: isTablet
                                                                              ? 14
                                                                              : 12),
                                                                    ),
                                                                  ],
                                                                ),
                                                                const SizedBox(
                                                                    height: 8),
                                                                Row(
                                                                  children: [
                                                                    Text(
                                                                      'Sconfitte',
                                                                      style: TextStyle(
                                                                          color: Colors
                                                                              .black,
                                                                          fontWeight: FontWeight
                                                                              .bold,
                                                                          fontSize: isTablet
                                                                              ? 14
                                                                              : 12),
                                                                    ),
                                                                    SizedBox(
                                                                        width: isTablet
                                                                            ? 60
                                                                            : 40),
                                                                    Text(
                                                                      '4,584',
                                                                      style: TextStyle(
                                                                          color: Colors
                                                                              .black,
                                                                          fontWeight: FontWeight
                                                                              .bold,
                                                                          fontSize: isTablet
                                                                              ? 14
                                                                              : 12),
                                                                    ),
                                                                  ],
                                                                ),
                                                                const SizedBox(
                                                                    height: 8),
                                                                Row(
                                                                  children: [
                                                                    Text(
                                                                      'Abbandoni',
                                                                      style: TextStyle(
                                                                          color: const Color(
                                                                              0xFF7D72D9),
                                                                          fontWeight: FontWeight
                                                                              .bold,
                                                                          fontSize: isTablet
                                                                              ? 14
                                                                              : 12),
                                                                    ),
                                                                    SizedBox(
                                                                        width: isTablet
                                                                            ? 60
                                                                            : 40),
                                                                    Text(
                                                                      '105',
                                                                      style: TextStyle(
                                                                          color: Colors
                                                                              .black,
                                                                          fontWeight: FontWeight
                                                                              .bold,
                                                                          fontSize: isTablet
                                                                              ? 14
                                                                              : 12),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          SizedBox(
                                                              width: isTablet
                                                                  ? 60
                                                                  : 40),
                                                        ],
                                                      ),
                                                      Positioned(
                                                        right: 10,
                                                        top: isTablet ? 10 : 30,
                                                        child: SizedBox(
                                                          width: isTablet
                                                              ? 80
                                                              : 60,
                                                          height: isTablet
                                                              ? 80
                                                              : 60,
                                                          child:
                                                              const CircularProgressIndicator(
                                                            value: 0.78,
                                                            strokeWidth: 8,
                                                            valueColor:
                                                                AlwaysStoppedAnimation<
                                                                    Color>(
                                                              Color.fromARGB(
                                                                  255,
                                                                  93,
                                                                  54,
                                                                  199),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Positioned(
                                                        right:
                                                            isTablet ? 30 : 20,
                                                        top: isTablet ? 40 : 50,
                                                        child: const Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Text(
                                                              'Win Rate',
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontSize: 10,
                                                                  height: 1),
                                                            ),
                                                            Text(
                                                              '78%',
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontSize: 16,
                                                                  height: 1),
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
                                      ),
                                    ),
                                    Positioned(
                                      top: isTablet ? 80 : 70,
                                      left: 0,
                                      right: 0,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 40),
                                        child: Container(
                                          color: Colors.white,
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 3, vertical: 1),
                                          child: Container(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 8, vertical: 1),
                                            decoration: BoxDecoration(
                                              color: Color(0xFFECF0F3),
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                            ),
                                            child: Row(
                                              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text(
                                                  '1 POINT TO LEVEL 13',
                                                  style: TextStyle(
                                                    fontSize: isTablet ? 12 : 6,
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: isTablet ? 20 : 10,
                                                ),
                                                SizedBox(
                                                  width: isTablet ? 20 : 10,
                                                  height: isTablet ? 20 : 10,
                                                  child: Image.asset(
                                                    'assets/lobby/diamond-final.png',
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ]),
                                ],
                              ),
                              ListView(
                                padding: EdgeInsets.zero,
                                children: [
                                  Stack(clipBehavior: Clip.none, children: [
                                    Container(
                                      width: double.infinity,
                                      height: isTablet ? 100 : 300,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 8.0, left: 8.0, right: 8.0),
                                      child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            color: Colors.white),
                                        child: Padding(
                                          padding: EdgeInsets.all(
                                              isTablet ? 16 : 10.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                children: [
                                                  Text(
                                                    'POINTS',
                                                    style: TextStyle(
                                                        color: const Color(
                                                            0xFF60266C),
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize:
                                                            isTablet ? 16 : 12,
                                                        height: 0.5),
                                                  ),
                                                  Text(
                                                    '24,499',
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize:
                                                          isTablet ? 24 : 18,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                  width: isTablet ? 50 : 40),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'LEVEL',
                                                    style: TextStyle(
                                                        color: const Color(
                                                            0xFF60266C),
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize:
                                                            isTablet ? 16 : 12,
                                                        height: 0.5),
                                                  ),
                                                  Row(
                                                    children: [
                                                      Text(
                                                        '140',
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: isTablet
                                                              ? 24
                                                              : 18,
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(6.0),
                                                        child: Container(
                                                          width: 25,
                                                          height: 25,
                                                          child: Image.asset(
                                                            'assets/shop/special.png',
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      top: isTablet ? 100 : 80,
                                      right: 0,
                                      left: 0,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            top: 4.0, left: 8.0, right: 8.0),
                                        child: Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(25),
                                              color: Colors.white),
                                          child: Padding(
                                            padding: EdgeInsets.all(
                                                isTablet ? 16 : 8),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Center(
                                                    child: Text(
                                                      'STATS OVERVIEW',
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize:
                                                            isTablet ? 16 : 14,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.all(
                                                      isTablet ? 16 : 8),
                                                  child: Stack(
                                                    children: [
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceAround,
                                                        children: [
                                                          Expanded(
                                                            child: Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Row(
                                                                  children: [
                                                                    Text(
                                                                      'Vittorie',
                                                                      style: TextStyle(
                                                                          color: const Color(
                                                                              0xFF7D72D9),
                                                                          fontWeight: FontWeight
                                                                              .bold,
                                                                          fontSize: isTablet
                                                                              ? 14
                                                                              : 12),
                                                                    ),
                                                                    SizedBox(
                                                                        width: isTablet
                                                                            ? 60
                                                                            : 40),
                                                                    Text(
                                                                      '24,227',
                                                                      style: TextStyle(
                                                                          color: Colors
                                                                              .black,
                                                                          fontWeight: FontWeight
                                                                              .bold,
                                                                          fontSize: isTablet
                                                                              ? 14
                                                                              : 12),
                                                                    ),
                                                                  ],
                                                                ),
                                                                const SizedBox(
                                                                    height: 8),
                                                                Row(
                                                                  children: [
                                                                    Text(
                                                                      'Sconfitte',
                                                                      style: TextStyle(
                                                                          color: Colors
                                                                              .black,
                                                                          fontWeight: FontWeight
                                                                              .bold,
                                                                          fontSize: isTablet
                                                                              ? 14
                                                                              : 12),
                                                                    ),
                                                                    SizedBox(
                                                                        width: isTablet
                                                                            ? 60
                                                                            : 40),
                                                                    Text(
                                                                      '4,584',
                                                                      style: TextStyle(
                                                                          color: Colors
                                                                              .black,
                                                                          fontWeight: FontWeight
                                                                              .bold,
                                                                          fontSize: isTablet
                                                                              ? 14
                                                                              : 12),
                                                                    ),
                                                                  ],
                                                                ),
                                                                const SizedBox(
                                                                    height: 8),
                                                                Row(
                                                                  children: [
                                                                    Text(
                                                                      'Sconfitte',
                                                                      style: TextStyle(
                                                                          color: Colors
                                                                              .black,
                                                                          fontWeight: FontWeight
                                                                              .bold,
                                                                          fontSize: isTablet
                                                                              ? 14
                                                                              : 12),
                                                                    ),
                                                                    SizedBox(
                                                                        width: isTablet
                                                                            ? 60
                                                                            : 40),
                                                                    Text(
                                                                      '4,584',
                                                                      style: TextStyle(
                                                                          color: Colors
                                                                              .black,
                                                                          fontWeight: FontWeight
                                                                              .bold,
                                                                          fontSize: isTablet
                                                                              ? 14
                                                                              : 12),
                                                                    ),
                                                                  ],
                                                                ),
                                                                const SizedBox(
                                                                    height: 8),
                                                                Row(
                                                                  children: [
                                                                    Text(
                                                                      'Abbandoni',
                                                                      style: TextStyle(
                                                                          color: const Color(
                                                                              0xFF7D72D9),
                                                                          fontWeight: FontWeight
                                                                              .bold,
                                                                          fontSize: isTablet
                                                                              ? 14
                                                                              : 12),
                                                                    ),
                                                                    SizedBox(
                                                                        width: isTablet
                                                                            ? 60
                                                                            : 40),
                                                                    Text(
                                                                      '105',
                                                                      style: TextStyle(
                                                                          color: Colors
                                                                              .black,
                                                                          fontWeight: FontWeight
                                                                              .bold,
                                                                          fontSize: isTablet
                                                                              ? 14
                                                                              : 12),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          SizedBox(
                                                              width: isTablet
                                                                  ? 60
                                                                  : 40),
                                                        ],
                                                      ),
                                                      Positioned(
                                                        right: 10,
                                                        top: isTablet ? 10 : 30,
                                                        child: SizedBox(
                                                          width: isTablet
                                                              ? 80
                                                              : 60,
                                                          height: isTablet
                                                              ? 80
                                                              : 60,
                                                          child:
                                                              const CircularProgressIndicator(
                                                            value: 0.78,
                                                            strokeWidth: 8,
                                                            valueColor:
                                                                AlwaysStoppedAnimation<
                                                                    Color>(
                                                              Color.fromARGB(
                                                                  255,
                                                                  93,
                                                                  54,
                                                                  199),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Positioned(
                                                        right:
                                                            isTablet ? 30 : 20,
                                                        top: isTablet ? 40 : 50,
                                                        child: const Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Text(
                                                              'Win Rate',
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontSize: 10,
                                                                  height: 1),
                                                            ),
                                                            Text(
                                                              '78%',
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontSize: 16,
                                                                  height: 1),
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
                                      ),
                                    ),
                                    Positioned(
                                      top: isTablet ? 80 : 70,
                                      left: 0,
                                      right: 0,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 40),
                                        child: Container(
                                          color: Colors.white,
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 3, vertical: 1),
                                          child: Container(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 8, vertical: 1),
                                            decoration: BoxDecoration(
                                              color: Color(0xFFECF0F3),
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                            ),
                                            child: Row(
                                              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text(
                                                  '1 POINT TO LEVEL 13',
                                                  style: TextStyle(
                                                    fontSize: isTablet ? 12 : 6,
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: isTablet ? 20 : 10,
                                                ),
                                                SizedBox(
                                                  width: isTablet ? 20 : 10,
                                                  height: isTablet ? 20 : 10,
                                                  child: Image.asset(
                                                    'assets/lobby/diamond-final.png',
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ]),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: isTablet ? 80 : 60,
              left: Directionality.of(context) == TextDirection.rtl ? 6 : null,
              right: Directionality.of(context) == TextDirection.rtl ? null : 6,
              child: ClubBadge(
                isTablet: isTablet,
              ),
            ),
          ],
        );
      } else {
        return const SizedBox.shrink();
      }
    });
  }
}

class Btn extends StatelessWidget {
  final String text;
  final Function f;
  final bool enabled;
  final bool isTablet;
  const Btn(this.text, this.f, this.enabled, this.isTablet, {super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: () => f(),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        width: isTablet ? (screenWidth * 0.10) : (screenWidth * 0.13),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            boxShadow: [
              BoxShadow(
                color: Colors.white.withOpacity(0.6),
                offset: const Offset(0, 0),
                blurRadius: 0.3,
                spreadRadius: 0.5,
              ),
            ],
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: const [0, 0.8, 1.0, 1.0],
              colors: [
                enabled == true ? Colors.white : const Color(0xffd3d5e0),
                enabled == true ? Colors.white : const Color(0xffd3d5e0),
                const Color(0xffb7b6b5).withOpacity(0.5),
                const Color(0xffb7b6b5)
              ],
            ),
            border: Border.all(width: 0.8, color: Colors.black)),
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                  fontSize: isTablet ? 14 : 8,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}
