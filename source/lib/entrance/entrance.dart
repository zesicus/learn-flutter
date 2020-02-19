import '../utils/styles.dart';
import 'package:flutter/material.dart';
import 'pages/tab_navigator_page.dart';
import 'pages/tab_widgets_page.dart';
import 'pages/tab_network_page.dart';

class Entrance extends StatefulWidget {
  Entrance({Key key, this.currentTabIndex = 0}) : super(key: key);

  final int currentTabIndex;

  @override
  _EntranceState createState() => _EntranceState(currentTabIndex);
}

class _EntranceState extends State<Entrance> {
  
  int currentTabIndex;
  _EntranceState(this.currentTabIndex);
  // 所有 tab 页
  final pages = [TabWidgetsPage(), TabNavigatorPage(), TabNetworkPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Learn Flutter"),
      ),
      body: pages[currentTabIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        iconSize: 23,
        currentIndex: currentTabIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.layers),
            title: tabText("控件"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.code),
            title: tabText("导航"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.wifi),
            title: tabText("网络"),
          ),
        ],
        onTap: (index) {
          setState(() {
            currentTabIndex = index;
          });
        },
      ),
    );
  }
}
