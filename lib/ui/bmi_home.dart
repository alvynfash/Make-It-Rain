import 'package:flutter/material.dart';
import 'package:make_it_rain/utils/bloc.dart';

class BmiScreen extends StatefulWidget {
  @override
  _BmiScreenState createState() => new _BmiScreenState();
}

class _BmiScreenState extends State<BmiScreen> {
  @override
  Widget build(BuildContext context) {
    var bloc = new Bloc();

    var tc = new TextEditingController(text: "19");
    tc.addListener(() {
      bloc.changeAge(tc.text);
    });

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
                        StreamBuilder(
                          stream: bloc.age,
                          builder: (context, snapshot) => TextField(
                                controller: tc,
                                keyboardType: TextInputType.numberWithOptions(
                                    decimal: false),
                                decoration: InputDecoration(
                                  hintText: "Age",
                                  hintStyle: TextStyle(fontSize: 15),
                                  icon: Icon(Icons.person),
                                  labelText: "Age",
                                  labelStyle: TextStyle(fontSize: 24.0),
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(5))),
                                  errorText: snapshot.error,
                                ),
                              ),
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
                            onPressed: () {
                              // tc.addListener(listener)
                            },
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
