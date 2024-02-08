import 'package:flutter/material.dart';

class CreateTableSP extends StatefulWidget {
  const CreateTableSP({super.key});

  @override
  State<CreateTableSP> createState() => _CreateTableSPState();
}

class _CreateTableSPState extends State<CreateTableSP> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/BG_LogIn.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              top: 10.0,
              right: 70.0,
              child: Container(
                width: 160,
                height: 55,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Stack(
        children: [
          Positioned(
            width: 70,
            bottom: 0.0,
            left: 150.0,
            child: FloatingActionButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              backgroundColor: Colors.transparent,
              splashColor: Colors.transparent,
              elevation: 0.0,
              child: Row(
                  children: [
                    Transform.rotate(
                      angle: 1.6,
                      child: Image.asset(
                        'assets/simple_arrow_down.png',
                        width: 30,
                        height: 30,
                      ),
                    ),
                    const Text('BACK', style: TextStyle(color: Colors.white)),
                  ]
              ),
            ),
          ),
          Positioned(
            width: 70,
            top: 50.0,
            right: 80.0,
            child: FloatingActionButton(
              onPressed: () {
                //exit(0);
              },
              backgroundColor: Colors.transparent,
              splashColor: Colors.transparent,
              elevation: 0.0,
              child: Column(
                  children: [
                    Image.asset(
                      'assets/ic_settings.png',
                      width: 30,
                      height: 30,
                    ),
                    const Text('OPTIONS', style: TextStyle(color: Colors.white)),
                  ]
              ),
            ),
          ),
          Positioned(
            width: 70,
            top: 50.0,
            right: 0.0,
            child: FloatingActionButton(
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
                      height: 30,
                    ),
                    const Text('RANKING', style: TextStyle(color: Colors.white)),
                  ]
              ),
            ),
          ),
        ],
      ),
    );
  }
}