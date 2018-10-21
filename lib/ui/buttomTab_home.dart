import 'package:flutter/material.dart';

class ButtomTabHome extends StatefulWidget {
  @override
  ButtomTabHomeView createState() => new ButtomTabHomeView();
}

class ButtomTabHomeView extends ButtomTabHomeState {

  @override
    void initState() {
      // TODO: implement initState
      tabController = new TabController(length: tabItems.length, vsync: this);
      super.initState();
    }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Buttom Tabbed View"),
      ),
      body: Padding(
        padding: EdgeInsets.all(5.0),
        child: TabBarView(
          controller: tabController,
          // Placeholders for content of the tabs:
          children: [
            Center(child: Icon(Icons.restaurant)),
            Center(child: Icon(Icons.local_drink)),
            Center(child: Icon(Icons.favorite)),
            Center(child: Icon(Icons.settings)),
            Center(child: Icon(Icons.settings)),
          ],
        ),
      ),
      bottomNavigationBar: new Theme(
        data: Theme.of(context).copyWith(
          // sets the background color of the `BottomNavigationBar`
          canvasColor: Colors.blue,
          // sets the active color of the `BottomNavigationBar` if `Brightness` is light
          primaryColor: Colors.white,
          textTheme: Theme.of(context).textTheme.copyWith(
                caption: new TextStyle(
                  color: Colors.grey,
                ),
              ),
        ), // sets the inactive color of the `BottomNavigationBar`
        child: BottomNavigationBar(
          currentIndex: tabbIndex,
          items: _getBarItems(),
          type: BottomNavigationBarType.shifting,
          onTap: (int index) => _switchTab(index),
        ),
      ),
    );
  }

  List<BottomNavigationBarItem> _getBarItems() {
    return tabItems
        .map((item) =>
            BottomNavigationBarItem(title: Text(item.text), icon: item.icon, activeIcon: item.icon ))
        .toList();
  }
}

 abstract class ButtomTabHomeState extends State<ButtomTabHome> with TickerProviderStateMixin{
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
  ];

  @protected
  TabController tabController;

  @protected
  int tabbIndex=0;

  @protected
  void _switchTab(int index) {
    setState(() {
      tabbIndex = index;
      // tabController?.index = index;
      tabController?.animateTo(index, curve: Curves.decelerate);
    });
  }

}
