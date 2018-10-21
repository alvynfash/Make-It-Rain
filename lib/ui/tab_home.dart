import 'package:flutter/material.dart';

class TabHome extends StatefulWidget {
  @override
  TabbHomeView createState() => new TabbHomeView();
}

class TabbHomeView extends TabHomeState {
  @override
  Widget build(BuildContext context) {

    return DefaultTabController(
      length: tabItems.length,
      initialIndex: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).backgroundColor,
          elevation: 2.0,
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(50.0),
            child: TabBar(
              unselectedLabelColor: Colors.grey,
              isScrollable: true,
              labelColor: Theme.of(context).primaryTextTheme.title.color,
              indicatorColor: Colors.red,
              tabs: tabItems,
            ),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(5.0),
          child: TabBarView(
            // Placeholders for content of the tabs:
            children: [
              Center(child: Icon(Icons.restaurant)),
              Center(child: Icon(Icons.local_drink)),
              Center(child: Icon(Icons.favorite)),
              Center(child: Icon(Icons.settings)),
            ],
          ),
        ),
      ),
    );
  }
}

abstract class TabHomeState extends State<TabHome> {
  @protected
  List<Tab> tabItems = [
    Tab(
      icon: Icon(Icons.restaurant),
      text: "Menu",
    ),
    Tab(
      icon: Icon(Icons.local_drink),
      text: "Reviews",
    ),
    Tab(
      icon: Icon(Icons.favorite),
      text: "Favourites",
    ),
    Tab(
      icon: Icon(Icons.settings),
      text: "Settings",
    ),
    Tab(
      icon: Icon(Icons.settings),
      text: "Settings",
    ),
    Tab(
      icon: Icon(Icons.settings),
      text: "Settings",
    ),
  ];
}
