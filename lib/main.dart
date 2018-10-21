import 'package:flutter/material.dart';
import './ui/main_Screen.dart';

void main() => runApp(MaterialApp(home: MyHomeScreen()));

class MyHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: MainScreeen(),
      // bottomNavigationBar: BottomBar(),
    );
  }
}

class BottomBar extends StatefulWidget {
  @override
  _BottomBarState createState() => new _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  static BottomNavigationBar _bottomNavigationBar;

  _BottomBarState() {
    _bottomNavigationBar = new BottomNavigationBar(
      onTap: (int index) => _onTabTapped(index),
      items: [
        new BottomNavigationBarItem(
            icon: new Icon(Icons.account_balance_wallet),
            title: new Text("Account")),
        new BottomNavigationBarItem(
            icon: new Icon(Icons.pie_chart), title: new Text("BMI")),
        new BottomNavigationBarItem(
            icon: new Icon(Icons.supervisor_account),
            title: new Text("Supervision")),
      ],
    );
  }

  void _onTabTapped(int index) {
    
  }

  @override
  Widget build(BuildContext context) {
    return _bottomNavigationBar;
  }
}
