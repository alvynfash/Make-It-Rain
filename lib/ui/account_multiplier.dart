import 'package:flutter/material.dart';

class AccountMultiplierScreen extends StatefulWidget {
  @override
  _AccountMultiplierState createState() => new _AccountMultiplierState();
}

class _AccountMultiplierState extends State<AccountMultiplierScreen> {
  int balance = -400;

  @override
  Widget build(BuildContext context) {
    var balanceText = Text(
      '$balance\$',
      style: TextStyle(
          fontSize: 35.0, color: balance >= 0 ? Colors.green : Colors.red),
    );
    return Scaffold(
        appBar: AppBar(title: Text("Account Multiplier")),
        body: Container(
          color: Colors.white,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                new Column(
                  children: <Widget>[
                    Text(
                      "Account Balances :",
                      style: TextStyle(fontSize: 15.0),
                    ),
                    balanceText,
                  ],
                ),
                GestureDetector(
                  onLongPress: () {
                    setState(() {
                      balance += 250;
                    });
                  },
                  child: FloatingActionButton(
                    onPressed: () {
                      setState(() {
                        balance += 100;
                        // print(balance);
                      });
                    },
                    child: Icon(Icons.add),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
