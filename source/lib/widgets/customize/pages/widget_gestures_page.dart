import 'package:flutter/material.dart';

class WidgetGesturesPage extends StatefulWidget {
  @override
  _WidgetGesturesPageState createState() => _WidgetGesturesPageState();
}

class _WidgetGesturesPageState extends State<WidgetGesturesPage> {
  String sentence = '我是一个可以单击、双击、长按的容器';
  String _sentence1 = '我是一个可以响应多种手势的方框';

  // 左 上 坐标
  double _left = 0.0;
  double _top = 0.0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('手势'),
          bottom: TabBar(
            tabs: <Widget>[
              Tab(text: 'InkWell'),
              Tab(text: 'GestureDetector'),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            // InkWell
            Stack(
              children: <Widget>[
                Positioned(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 45.0),
                    child:
                        Text('此控件必须有一个 Material Design 的控件作为依托，也必须在此风格下才能使用。'),
                  ),
                ),
                Align(
                  child: InkWell(
                    child: Container(
                      alignment: Alignment.center,
                      width: 200,
                      height: 250,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: Text(
                          sentence,
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      decoration: BoxDecoration(
                        color: Colors.black,
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        sentence = "我被单击了";
                      });
                    },
                    onDoubleTap: () {
                      setState(() {
                        sentence = '我被双击了';
                      });
                    },
                    onLongPress: () {
                      setState(() {
                        sentence = "我被长按了";
                      });
                    },
                    onTapDown: (tapDown) {
                      setState(() {
                        sentence = "当前点击坐标：${tapDown.localPosition}";
                      });
                    },
                    onTapCancel: () {
                      setState(() {
                        sentence = '最终取消了操作';
                      });
                    },
                    onHover: (isHover) {
                      setState(() {
                        sentence = 'Hover 不知道是个什么东西 $isHover';
                      });
                    },
                  ),
                ),
              ],
            ),
            // Gesture Detector
            Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Positioned(
                  left: _left,
                  top: _top,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(_sentence1),
                      SizedBox(height: 10),
                      Container(
                        width: 50,
                        height: 50,
                        color: Colors.red,
                      )
                    ],
                  ),
                ),
                GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  child: Container(
                    color: Colors.transparent,
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                  ),
                  onPanDown: (details) {
                    setState(() {
                      _sentence1 =
                          'On Pan Down 按下坐标：X:${details.localPosition.dx} Y:${details.localPosition.dy}';
                      _left = details.localPosition.dx;
                      _top = details.localPosition.dy;
                    });
                  },
                  onPanUpdate: (details) {
                    setState(() {
                      _sentence1 =
                          'On Pan Update 拖动坐标：X:${details.localPosition.dx} Y:${details.localPosition.dy}';
                      _left = details.localPosition.dx;
                      _top = details.localPosition.dy;
                    });
                  },
                  onPanCancel: () {
                    setState(() {
                      _sentence1 = '取消了拖动操作';
                    });
                  },
                  onPanEnd: (details) {
                    setState(() {
                      _sentence1 = 'On Pan End 结束拖动';
                    });
                  },
                  onTap: () {
                    setState(() {
                      _sentence1 = '点击了整个区域';
                    });
                  },
                  onTapDown: (details) {
                    setState(() {
                      _sentence1 =
                          '按下坐标：X:${details.globalPosition.dx} Y:${details.globalPosition.dy}';
                    });
                  },
                  onTapUp: (details) {
                    setState(() {
                      _sentence1 = '手指抬起';
                    });
                  },
                  onDoubleTap: () {
                    setState(() {
                      _sentence1 = '双击';
                    });
                  },
                  onLongPress: () {
                    setState(() {
                      _sentence1 = '长按';
                    });
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
