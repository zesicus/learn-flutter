import 'package:flutter/material.dart';

class WidgetLayoutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Layout"),
          bottom: TabBar(
            isScrollable: false,
            tabs: <Widget>[
              Tab(text: "Padding"),
              Tab(text: "Expanded"),
              Tab(text: "AspectRadio"),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            // Padding 块
            Padding(
              padding: EdgeInsets.all(20),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black,
                ),
              ),
            ),

            // Expanded 块
            Row(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Container(
                    decoration: BoxDecoration(color: Colors.red),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    decoration: BoxDecoration(color: Colors.yellow),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Container(
                    decoration: BoxDecoration(color: Colors.green),
                  ),
                ),
              ],
            ),

            // AspectRadio 块
            Center(
              child: Padding(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: AspectRatio(
                  aspectRatio: 1.5, // 宽高比 3:2
                  child: Container(
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

