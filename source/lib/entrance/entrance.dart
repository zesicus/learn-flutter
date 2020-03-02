import '../utils/styles.dart';
import 'package:flutter/material.dart';
import 'pages/tab_widgets_page.dart';
import 'pages/tab_more_page.dart';

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
  final pages = [TabWidgetsPage(), TabMorePage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Learn Flutter"),
        automaticallyImplyLeading: false, // 把 leading 的空间留给 title
        flexibleSpace: Image.asset('res/images/sea_navi.jpg', fit: BoxFit.cover,),
      ),
      body: pages[currentTabIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        iconSize: 23,
        currentIndex: currentTabIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.layers),
            title: tabText("界面"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.filter_vintage),
            title: tabText("万花筒"),
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
