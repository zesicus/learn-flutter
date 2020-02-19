import 'package:flutter/material.dart';

class WidgetStackPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Stack"),
          bottom: TabBar(
            tabs: <Widget>[
              Tab(text: "Align"),
              Tab(text: "Position"),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            // Align 块
            Center(
              child: Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  Container(
                    color: Colors.green,
                  ),
                  Align(
                    alignment: Alignment(-0.95, -0.95),
                    child: Icon(
                      Icons.close,
                      size: 35,
                      color: Colors.white,
                    ),
                  ),
                  Align(
                    alignment: Alignment(0.95, 0.95),
                    child: Icon(
                      Icons.send,
                      size: 40,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),

            // Position 块
            Center(
              child: Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  Container(
                    color: Colors.green,
                  ),
                  Positioned(
                    left: 10,
                    top: 10,
                    child: Icon(
                      Icons.close,
                      size: 35,
                      color: Colors.white,
                    ),
                  ),
                  Positioned(
                    right: 10,
                    bottom: 10,
                    child: Icon(
                      Icons.send,
                      size: 40,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
