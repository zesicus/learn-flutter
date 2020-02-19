import 'package:flutter/material.dart';

class WidgetGridViewPage extends StatelessWidget {
  const WidgetGridViewPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List list = List<Widget>();
    for (var i = 1; i < 8; i++) {
      list.add(Container(
        child: Column(
          children: <Widget>[
            Image.network('https://www.itying.com/images/flutter/$i.png'),
            SizedBox(
              height: 12,
            ),
            Text(
              "我是描述文字",
              style: TextStyle(
                fontSize: 13,
                color: Color(0xff555555),
              ),
            ),
          ],
        ),
        decoration: BoxDecoration(
          border: Border.all(
            color: Color.fromRGBO(233, 233, 233, 0.9),
            width: 1.0,
          ),
        ),
      ));
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Grid View"),
      ),
      /*
      body: GridView.count(
        crossAxisCount: 2, //2 列
        crossAxisSpacing: 10, // 左右间距
        mainAxisSpacing: 10, // 上下间距
        padding: EdgeInsets.all(10), // gride view 内边距
        // childAspectRatio: 0.75, // 宽高比
        children: list,
      ),
      */
      // 另一种方法
      body: GridView.builder(
        itemCount: list.length,
        padding: EdgeInsets.all(10),
        itemBuilder: (context, index) {
          return list[index];
        },
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // 两列
          crossAxisSpacing: 10, // 左右间距
          mainAxisSpacing: 10, // 上下间距
        ),
      ),
    );
  }
}
