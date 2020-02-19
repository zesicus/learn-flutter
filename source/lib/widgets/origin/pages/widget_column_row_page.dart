import 'package:flutter/material.dart';
import '../views/icon_button.dart';

class WidgetColumnRowPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Column & Row"),
          bottom: TabBar(
            tabs: <Widget>[
              Tab(text: "Column"),
              Tab(text: "Row"),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            // Column 块
            Container(
              color: Colors.pink,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  MyIconButton(Icons.home, Colors.red),
                  SizedBox(height: 30),
                  MyIconButton(Icons.search, Colors.blue),
                  SizedBox(height: 30),
                  MyIconButton(Icons.send, Colors.purple),
                ],
              ),
            ),
            // Row 块
            Container(
              color: Colors.pink,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  MyIconButton(Icons.home, Colors.red),
                  SizedBox(width: 30),
                  MyIconButton(Icons.search, Colors.blue),
                  SizedBox(width: 30),
                  MyIconButton(Icons.send, Colors.purple),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
