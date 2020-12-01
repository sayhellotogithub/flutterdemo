import 'package:flutter/material.dart';
import 'package:flutterdemo/layout/drawer_layout.dart';

class ScaffLayout extends StatefulWidget {
  @override
  ScaffLayoutState createState() => ScaffLayoutState();
}

class ScaffLayoutState extends State<ScaffLayout> {
  int _selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("iblogstreet  flutter demo"),
        actions: [IconButton(icon: Icon(Icons.share), onPressed: () {})],
      ),
      drawer: DrawerLayout(),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "home"),
          BottomNavigationBarItem(icon: Icon(Icons.hail), label: "basic"),
          BottomNavigationBarItem(icon: Icon(Icons.hail), label: "advance")
        ],
        currentIndex: _selectedIndex,
        fixedColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }

  void _onItemTapped(int value) {
    setState(() {
      _selectedIndex = value;
    });
  }
}
