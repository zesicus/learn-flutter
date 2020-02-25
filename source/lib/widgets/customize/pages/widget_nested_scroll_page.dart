import 'dart:ui';
import 'package:flutter/material.dart';

class WidgetNestedScrollPage extends StatefulWidget {
  WidgetNestedScrollPage({Key key}) : super(key: key);

  @override
  _WidgetNestedScrollPageState createState() => _WidgetNestedScrollPageState();
}

class _WidgetNestedScrollPageState extends State<WidgetNestedScrollPage> {
  final _tabs = <String>['TabA', 'TabB'];

  @override
  Widget build(BuildContext context) {
    // 屏幕宽度
    var _screenWidth = MediaQuery.of(context).size.width;
    // 状态栏高度
    var _statusBarHeight = MediaQueryData.fromWindow(window).padding.top;

    return Scaffold(
      body: DefaultTabController(
        length: _tabs.length,
        child: NestedScrollView(
          headerSliverBuilder: (context, innerScrolled) => <Widget>[
            SliverOverlapAbsorber(
              handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
              child: SliverAppBar(
                title: Text("嵌套连结"),
                centerTitle: true,
                expandedHeight:
                    _screenWidth * 533 / 800 - _statusBarHeight, // 展开高度
                forceElevated: true, // 强制显示阴影
                floating: false, // 浮动 bar
                snap: false, // 搭配 floating 使用，下滑一定比例自动展开 bar
                pinned: true, // 设置该属性使 bar 折叠后不消失
                flexibleSpace: FlexibleSpaceBar(
                  collapseMode: CollapseMode.parallax, //图片位置
                  background: Image.asset('res/images/sliver_bar.jpg',
                      fit: BoxFit.cover),
                ),
                bottom: TabBar(
                  tabs: _tabs
                      .map((name) => Tab(text: name))
                      .toList(),
                ),
              ),
            )
          ],
          body: TabBarView(
            children: <Widget>[
              Center(child: Text('页面 1', style: TextStyle(fontSize: 30)),),
              Center(child: Text('页面 2', style: TextStyle(fontSize: 30)),),
            ],
          ),
        ),
      ),
    );
  }
}
