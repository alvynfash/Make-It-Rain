import 'package:flutter/material.dart';

class BmiScreen extends StatefulWidget {
  @override
  _BmiScreenState createState() => new _BmiScreenState();
}

class _BmiScreenState extends State<BmiScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("BMI")),
        body: Container(
          color: Colors.white,
          child: ListView(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Image.asset(
                      'images/logo.png',
                      height: 60.0,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(10.0),
                    // color: Colors.grey,
                    child: Column(
                      children: <Widget>[
                        TextField(
                          decoration: InputDecoration(
                              // hintText: "Age",
                              icon: Icon(Icons.person),
                              labelText: "Age",
                              labelStyle: TextStyle(fontSize: 20.0)),
                        ),
                        TextField(
                          decoration: InputDecoration(
                              // hintText: "Age",
                              icon: Icon(Icons.store_mall_directory),
                              labelText: "Height in feet",
                              labelStyle: TextStyle(fontSize: 20.0)),
                        ),
                        TextField(
                          decoration: InputDecoration(
                              // hintText: "Age",
                              icon: Icon(Icons.person),
                              labelText: "Weight in lb",
                              labelStyle: TextStyle(fontSize: 20.0)),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: RaisedButton(
                            color: Colors.pinkAccent,
                            child: Text(
                              "Calculate !",
                              style: TextStyle(color: Colors.white),
                            ),
                            onPressed: () {},
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
