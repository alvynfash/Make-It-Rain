import 'package:flutter/material.dart';
import 'package:make_it_rain/ui/account_multiplier.dart';
import 'package:make_it_rain/ui/bmi_home.dart';
import 'package:make_it_rain/ui/buttomTab_home.dart';
import 'package:make_it_rain/ui/tab_home.dart';
import './userlist_screen.dart';
import './userlist_with_futurebuilder_screen.dart';

class MainScreeen extends StatefulWidget {
  @override
  _MainScreeenState createState() => new _MainScreeenState();
}

class _MainScreeenState extends State<MainScreeen> {
  List<String> _screenNames = [
    "Account Multiplier",
    "BMI",
    "Users http",
    "Users http with Fututre builder",
    "Navigation with passThrough data",
    "Tabbed bar",
    "ButtomTabbed bar",
    "Other Screens"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter mini screens"),
      ),
      backgroundColor: Colors.white,
      body: Container(
        color: Colors.white,
        child: Center(
          child: ListView.separated(
            itemCount: _screenNames.length,
            itemBuilder: (context, index) {
              var item = _screenNames[index];
              return ListTile(
                title: Text("$item"),
                leading: CircleAvatar(
                  maxRadius: 15.0,
                  backgroundColor: Colors.blue.shade100,
                  child: Text(item[0]?.toUpperCase()),
                ),
                onTap: () => handleOptionTapped(context, index),
              );
            },
            separatorBuilder: (BuildContext context, int index) => Divider(
                  color: Colors.black38,
                  height: 0.5,
                ),
          ),
        ),
      ),
    );
  }

  handleOptionTapped(BuildContext context, int index) {
    Widget screen;

    switch (index) {
      case 0:
        screen = new AccountMultiplierScreen();
        break;

      case 1:
        screen = new BmiScreen();
        break;

      case 2:
        screen = new UserListScreen();
        break;

      case 3:
        screen = new UserlistWithFuturebuilderScreen();
        break;

      case 5:
        screen = new TabHome();
        break;

      case 6:
        screen = new ButtomTabHome();
        break;
    }

    if (screen != null) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => screen),
      );
      return;
    }

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
            title: Text("Sorry :("),
            content: Text("Not implemented !"),
            actions: <Widget>[
              RaisedButton(
                child: Text(
                  "ok",
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.lightBlue,
                splashColor: Colors.red,
                onPressed: () => Navigator.of(context).pop(),
              )
            ],
          ),
    );
  }
}
