import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:make_it_rain/models/user_model.dart';

class UserListScreen extends StatefulWidget {
  @override
  _UserListScreenState createState() => new _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
  List<User> users = new List<User>();

  @override
  void initState() {
    super.initState();
    getUsers();
  }

  void getUsers() async {
    var apiUrl = "https://jsonplaceholder.typicode.com/users";
    await http.get(apiUrl).then((result) {
      List res = new List.from(json.decode(result.body));
      setState(() {
        res.forEach((item) {
          var x = User.fromJson(item);
          users.add(x);
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("Users"),
      ),
      body: Container(
        child: users.length > 0
            ? ListView.builder(
                itemCount: users?.length ?? 0,
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
              )
            : Center(
                child: CircularProgressIndicator(
                  backgroundColor: Colors.red,
                ),
              ),
      ),
    );
  }

  void handleListTap(BuildContext context, User data){
    showDialog(context: context, builder: (context)=> AlertDialog(
      title: Text(data.name),
      content: Text(data.email),
      actions: <Widget>[
        FlatButton(child: Text("Ok"),
        onPressed: ()=> Navigator.pop(context),)
      ],
    ));

  }
}
