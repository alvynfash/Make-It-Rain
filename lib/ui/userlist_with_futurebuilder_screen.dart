import 'dart:async';

import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:make_it_rain/models/user_model.dart';

class UserlistWithFuturebuilderScreen extends StatefulWidget {
  @override
  UserlistWithFuturebuilderScreenState createState() =>
      new UserlistWithFuturebuilderScreenState();
}

class UserlistWithFuturebuilderScreenState
    extends State<UserlistWithFuturebuilderScreen> {
  List<User> users = new List<User>();

  Future<List> getUsers() async {
    var list = new List();

    try {
      await Future.delayed(Duration(
          days: 0,
          hours: 0,
          microseconds: 0,
          milliseconds: 0,
          minutes: 0,
          seconds: 2));
      var apiUrl = "https://jsonplaceholder.typicode.com/users";
      var result = await http.get(apiUrl);
      list = List.from(json.decode(result.body));
    } catch (ex) {
      //
      list = new List();
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("Users with future builder"),
      ),
      body: Container(
        child: FutureBuilder(
          future: getUsers(),
          builder:
              (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
            if (!snapshot.hasData || snapshot.data.length == 0) {
              return Center(
                child: CircularProgressIndicator(
                  backgroundColor: Colors.red,
                ),
              );
            } else {
              snapshot.data.forEach((item) {
                var x = User.fromJson(item);
                users.add(x);
              });
              return ListView.builder(
                itemCount: users.length,
                itemBuilder: (context, index) {
                  var data = users[index];
                  return ListTile(
                    title: Text(data.name),
                    subtitle: Text(data.phone),
                    leading: CircleAvatar(
                      maxRadius: 15.0,
                      backgroundColor: Colors.blue.shade100,
                      child: Text(data.name[0]?.toUpperCase()),
                    ),
                    onTap: () => handleListTap(context, data),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }

  void handleListTap(BuildContext context, User data) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text(data.name),
              content: Text(data.email),
              actions: <Widget>[
                FlatButton(
                  child: Text("Ok"),
                  onPressed: () => Navigator.pop(context),
                )
              ],
            ));
  }
}
