import 'package:flutter/material.dart';

class VerticalTabBarExample extends StatefulWidget {
  const VerticalTabBarExample({super.key});

  @override
  _VerticalTabBarExampleState createState() => _VerticalTabBarExampleState();
}

class _VerticalTabBarExampleState extends State<VerticalTabBarExample> {
  int _selectedIndex = 0;
  final List<String> _tabs = ["Tab 1", "Tab 2", "Tab 3"];
  final List<Widget> _tabContents = [
    const Center(child: Text("Content for Tab 1")),
    const Center(child: Text("Content for Tab 2")),
    const Center(child: Text("Content for Tab 3")),
  ];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 800,
        height: 500,
        color: Colors.transparent,
        child: Scaffold(
          appBar: AppBar(
            title: const Text("Vertical TabBar Example"),
          ),
          body: Row(
            children: [
              Column(
                children: List.generate(_tabs.length, (index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedIndex = index;
                      });
                    },
                    child: Container(
                      width: 300,
                      height: 120,
                      padding: const EdgeInsets.all(16.0),
                      color:
                          _selectedIndex == index ? Colors.blue : Colors.purple,
                      child: Text(
                        _tabs[index],
                        style: TextStyle(
                          color: _selectedIndex == index
                              ? Colors.white
                              : Colors.black,
                        ),
                      ),
                    ),
                  );
                }),
              ),
              Expanded(
                child: _tabContents[_selectedIndex],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
