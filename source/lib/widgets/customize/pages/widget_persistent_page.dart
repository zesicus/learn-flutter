import 'package:flutter/material.dart';

class WidgetPersistentPage extends StatefulWidget {
  WidgetPersistentPage({Key key}) : super(key: key);

  @override
  _WidgetPersistentPageState createState() => _WidgetPersistentPageState();
}

class _WidgetPersistentPageState extends State<WidgetPersistentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("缩进格"),
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverPersistentHeader(
            delegate: _ExtendHeaderDelegate(Colors.orange),
            pinned: false,
          ),
          SliverFillRemaining(
            child: Center(
              child: Text(
                "我是填充",
                style: TextStyle(fontSize: 30),
              ),
            ),
          ),
          SliverPersistentHeader(
            delegate: _ExtendHeaderDelegate(Colors.green),
            pinned: false,
          ),
          SliverFillRemaining(
            child: Center(
              child: Text(
                "我是填充",
                style: TextStyle(fontSize: 30),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ExtendHeaderDelegate extends SliverPersistentHeaderDelegate {
  final Color color;
  _ExtendHeaderDelegate(this.color);
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: color,
      alignment: Alignment.center,
      child: Text(
        "我是头部控件",
        style: TextStyle(color: Colors.white, fontSize: 30),
      ),
    );
  }

  @override
  // 最大高度
  double get maxExtent => 300;

  @override
  // 最小高度
  double get minExtent => 50;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    // 是否需要更新 (固定内容不需要更新)
    return false;
  }
}
