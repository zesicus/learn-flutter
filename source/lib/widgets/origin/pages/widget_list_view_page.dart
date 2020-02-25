import 'package:flutter/material.dart';

class WidgetListViewPage extends StatefulWidget {
  WidgetListViewPage({Key key}) : super(key: key);

  @override
  _WidgetListViewPageState createState() => _WidgetListViewPageState();
}

class _WidgetListViewPageState extends State<WidgetListViewPage> {
  var _scrollController = ScrollController();
  var _showBackTop = false;

  @override
  void initState() {
    _scrollController.addListener(() {
      setState(() {
        _showBackTop = (_scrollController.position.pixels >= 800);
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List lists = List<Widget>();

    for (var i = 0; i < 20; i++) {
      lists.add(
        ListTile(
          leading: Image.asset(
            'res/icons/${(i + 1) % 7}.png',
            width: 40,
            height: 40,
          ),
          title: Text("美味的快餐"),
          subtitle: Text("快餐虽然美味但是也很长胖。"),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("List View"),
      ),
      /* 简单实现方式
      body: ListView(
        children: lists,
      ),
      */
      // builder 实现方式
      body: ListView.builder(
        controller: _scrollController,
        itemCount: lists.length,
        itemBuilder: (context, index) {
          return lists[index];
        },
      ),

      floatingActionButton: _showBackTop
          ? FloatingActionButton(
              child: Icon(Icons.keyboard_arrow_up),
              onPressed: () {
                _scrollController.animateTo(0.0, duration: Duration(milliseconds: 500), curve: Curves.decelerate);
              },
            )
          : null,
    );
  }
}
