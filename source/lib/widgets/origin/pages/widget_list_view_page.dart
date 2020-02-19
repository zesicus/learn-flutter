import 'package:flutter/material.dart';

class WidgetListViewPage extends StatelessWidget {
  const WidgetListViewPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List lists = List<Widget>();

    lists.add(
      ListTile(
        leading: Image.network('https://www.itying.com/images/flutter/1.png'),
        title: Text("雨雪降温天气健康八提醒"),
        subtitle: Text("提醒之一：防止意外跌倒，雨雪天气造成路面湿滑。"),
      ),
    );

    lists.add(
      ListTile(
        leading: Image.network('https://www.itying.com/images/flutter/2.png'),
        title: Text("雨雪降温天气健康八提醒"),
        subtitle: Text("提醒之一：防止意外跌倒，雨雪天气造成路面湿滑。"),
      ),
    );

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
        itemCount: lists.length,
        itemBuilder: (context, index) {
          return lists[index];
        },
      ),
    );
  }
}
