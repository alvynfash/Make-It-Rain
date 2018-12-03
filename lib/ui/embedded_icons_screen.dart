import 'package:flutter/material.dart';

class EmbeddedIconsScreen extends StatefulWidget {
  @override
  _EmbeddedIconsScreenState createState() => new _EmbeddedIconsScreenState();
}

class _EmbeddedIconsScreenState extends State<EmbeddedIconsScreen> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("Embbedded Icons Lists"),
      ),
      // body: Container(
      //     child: ListView.builder(
      //   itemCount: users?.length ?? 0,
      //   itemBuilder: (context, index) {
      //     var data = users[index];
      //     return ListTile(
      //       title: Text(data.name),
      //       subtitle: Text(data.phone),
      //       leading: CircleAvatar(
      //         maxRadius: 15.0,
      //         backgroundColor: Colors.blue.shade100,
      //         child: Text(data.name[0]?.toUpperCase()),
      //       ),
      //       onTap: () => handleListTap(context, data),
      //     );
      //   },
      // )
      // ),
    );
  }
}
