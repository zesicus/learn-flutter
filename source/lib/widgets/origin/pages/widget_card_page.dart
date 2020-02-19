import 'package:flutter/material.dart';

class WidgetCardPage extends StatelessWidget {
  const WidgetCardPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Card"),
      ),
      body: ListView(
        children: <Widget>[
          Card(
            margin: EdgeInsets.all(10),
            child: Column(
              children: <Widget>[
                ListTile(
                  title: Text(
                    "张三",
                    style: TextStyle(fontSize: 28),
                  ),
                  subtitle: Text("高级工程师"),
                ),
                ListTile(
                  title: Text("电话：13770688945"),
                ),
                ListTile(
                  title: Text("地址：山东省东营市黄河钻戒"),
                ),
              ],
            ),
          ),
          Card(
            margin: EdgeInsets.all(10),
            child: Column(
              children: <Widget>[
                AspectRatio(
                  aspectRatio: 1.6,
                  child: Image.network(
                    'https://www.itying.com/images/flutter/1.png',
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 15, 15, 15),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(
                          'https://www.itying.com/images/flutter/1.png'),
                      radius: 25,
                    ),
                    title: Text(
                      "Candy Shop",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                    subtitle: Text(
                      "Flutter is Google's mobile UI Framework for crafting hight performance etc...",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
