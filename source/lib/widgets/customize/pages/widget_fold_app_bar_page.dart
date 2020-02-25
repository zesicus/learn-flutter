import 'dart:ui';
import 'package:flutter/material.dart';

class WidgetFoldAppBarPage extends StatefulWidget {
  @override
  _WidgetFoldAppBarPageState createState() => _WidgetFoldAppBarPageState();
}

class _WidgetFoldAppBarPageState extends State<WidgetFoldAppBarPage> {
  final List<Color> colors = [
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.pink,
    Colors.yellow,
    Colors.deepPurple
  ];

  @override
  Widget build(BuildContext context) {
    // 屏幕宽度
    var _screenWidth = MediaQuery.of(context).size.width;
    // 状态栏高度
    var _statusBarHeight = MediaQueryData.fromWindow(window).padding.top;

    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            title: Text("折叠填充"),
            centerTitle: true,
            expandedHeight: _screenWidth * 533 / 800 - _statusBarHeight, // 展开高度
            forceElevated: true, // 强制显示阴影
            floating: false, // 浮动 bar
            snap: false, // 搭配 floating 使用，下滑一定比例自动展开 bar
            pinned: true, // 设置该属性使 bar 折叠后不消失
            flexibleSpace: FlexibleSpaceBar(
              collapseMode: CollapseMode.parallax, //图片位置
              background:
                  Image.asset('res/images/sliver_bar.jpg', fit: BoxFit.cover),
            ),
          ),
          SliverFillRemaining(
            child: Center(
              child: Text(
                "我是满屏填充",
                style: TextStyle(fontSize: 30),
              ),
            ),
          ),
          SliverFillViewport(
            viewportFraction: 0.4,
            delegate: SliverChildBuilderDelegate(
              (_, index) => Container(
                child: Text(
                  '比例填充 $index',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                alignment: Alignment.center,
                color: colors[index % 4],
              ),
              childCount: 10,
            ),
          ),
          // 不明白为什么会有那么大的空隙
          SliverPadding(
            padding: EdgeInsets.all(10),
            sliver: SliverToBoxAdapter(
              child: Container(
                height: 100,
                color: Colors.teal,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
