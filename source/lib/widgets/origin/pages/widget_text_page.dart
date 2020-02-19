import 'package:flutter/material.dart';

class WidgetTextPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Text"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'There are moments in life when you miss someone so much that you just want to pick them from your dreams and hug them for real! Dream what you want to dream;go where you want to go;be what you want to be,because you have only one life and one chance to do all the things you want to do.',
            textAlign:
                TextAlign.center, // center 居中，left 左对齐，right 右对齐，justfy 两端对齐
            textDirection: TextDirection.rtl, //文本方向从右至左怎么只有标点符号反过来了？
            overflow: TextOverflow.ellipsis, // clip 裁剪，fade 渐隐，ellipsis 省略号
            textScaleFactor: 1.0, // 字体倍率
            maxLines: 3, // 文字显示最大行数
            softWrap: true, // 这玩意儿目前看起来没啥用处
            style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                color: Colors.blueGrey,
                fontStyle: FontStyle.italic,
                letterSpacing: 0.5, // 字母间隙
                wordSpacing: 5.0, // 词间隙
                decoration: TextDecoration.underline,
                decorationColor: Colors.blueAccent,
                decorationStyle: TextDecorationStyle.wavy),
          ),
          SizedBox(height: 50),
          Text.rich(
            // 富文本
            TextSpan(
              text: "Rich text: ",
              children: <TextSpan>[
                TextSpan(
                    text: "color", style: TextStyle(color: Colors.pinkAccent)),
                TextSpan(text: "fontSize", style: TextStyle(fontSize: 28)),
                TextSpan(
                    text: "decoration",
                    style: TextStyle(decoration: TextDecoration.lineThrough)),
                TextSpan(
                  text: "shadow",
                  style: TextStyle(shadows: [
                    Shadow(color: Colors.pink, offset: Offset(1, 2)),
                  ]),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
