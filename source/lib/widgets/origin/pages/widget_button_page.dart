import '../../../utils/styles.dart';
import 'package:flutter/material.dart';

class WidgetButtonPage extends StatefulWidget {
  @override
  _WidgetButtonPageState createState() => _WidgetButtonPageState();
}

class _WidgetButtonPageState extends State<WidgetButtonPage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  bool _isShowFloatingButton = false;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 6);
    _tabController.addListener(() {
      setState(() {
        _isShowFloatingButton = (_tabController.index == 5);
      });
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Buttons"),
        bottom: TabBar(
          controller: _tabController,
          isScrollable: true,
          tabs: <Widget>[
            Tab(text: "RaisedButton"),
            Tab(text: "FlatButton"),
            Tab(text: "OutlineButton"),
            Tab(text: "IconButton"),
            Tab(text: "ButtonBar"),
            Tab(text: "FloatingActionButton"),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          // 凸起按钮
          ListView(
            children: <Widget>[
              Center(
                child: RaisedButton(
                  child: Text("普通按钮"),
                  onPressed: () {},
                ),
              ),
              Center(
                child: RaisedButton(
                  child: Text("颜色按钮"),
                  color: Colors.blue,
                  textColor: Colors.white,
                  onPressed: () {},
                ),
              ),
              Center(
                child: RaisedButton(
                  child: Text("阴影按钮"),
                  elevation: 10,
                  onPressed: () {},
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  // 在外层设置 Container 就能改变宽高
                  child: Container(
                    width: 200,
                    height: 50,
                    child: RaisedButton(
                      child: Text("自定义宽高按钮"),
                      onPressed: () {},
                    ),
                  ),
                ),
              ),
              Center(
                child: RaisedButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.search, size: 15),
                  label: Text("图标按钮"),
                ),
              ),
              Center(
                child: RaisedButton(
                  onPressed: () {},
                  child: Text("圆角按钮"),
                  color: Colors.green,
                  textColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              Center(
                child: Container(
                  width: 75,
                  height: 75,
                  child: RaisedButton(
                    onPressed: () {},
                    child: Text("圆按钮"),
                    color: Colors.orange,
                    textColor: Colors.white,
                    shape: CircleBorder(side: BorderSide(color: Colors.orange)),
                  ),
                ),
              ),
              Center(
                child: RaisedButton(
                  child: Text("紫水波纹按钮"),
                  splashColor: Colors.purple,
                  onPressed: () {},
                ),
              ),
            ],
          ),

          // 扁平化按钮
          ListView(
            children: <Widget>[
              Center(
                child: FlatButton(
                  child: Text("扁平按钮"),
                  onPressed: () {},
                ),
              ),
              Center(
                child: FlatButton(
                  child: Text("有颜色扁平按钮"),
                  color: Colors.blue,
                  textColor: Colors.white,
                  onPressed: () {},
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: 250,
                    height: 50,
                    child: FlatButton(
                      child: Text("其他和RaiseButton一样使用"),
                      color: Colors.green,
                      textColor: Colors.white,
                      onPressed: () {},
                    ),
                  ),
                ),
              ),
            ],
          ),

          // 线框按钮
          Column(
            children: <Widget>[
              OutlineButton(
                child: Text("普通线框按钮"),
                onPressed: () {},
              ),
              Container(
                width: 200,
                height: 50,
                child: OutlineButton(
                  child: Text("自定义线框按钮"),
                  highlightedBorderColor: Colors.greenAccent,
                  // 总感觉不太好用的样子
                  textColor: Colors.grey,
                  onPressed: () {},
                ),
              ),
            ],
          ),
          // 图标按钮
          Column(
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.security),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(
                  Icons.send,
                  size: 50,
                  color: Colors.red,
                ),
                color: Colors.blue,
                highlightColor: Colors.green,
                onPressed: () {},
              ),
            ],
          ),
          // 按钮组
          ButtonBar(
            alignment: MainAxisAlignment.center,
            buttonMinWidth: 80,
            buttonPadding: EdgeInsets.all(10),
            children: <Widget>[
              RaisedButton(
                child: Text("登录"),
                onPressed: () {},
              ),
              FlatButton(
                child: Text("注册"),
                color: Colors.green,
                textColor: Colors.white,
                onPressed: () {},
              ),
            ],
          ),

          // 浮动按钮
          Container(),
        ],
      ),
      floatingActionButton: _isShowFloatingButton
          ? Container(
              width: 56,
              height: 56,
              padding: EdgeInsets.all(3),
              margin: EdgeInsets.only(top: 10),
              decoration: BoxDecoration(
                boxShadow: [BoxShadow(
                  color: Color(0xffefefef),
                  offset: Offset(0.5, 1.5),
                )],
                borderRadius: BorderRadius.circular(28),
                color: Colors.white,
                border: Border.all(
                  color: Color(0xffefefef),
                  width: 0.5,
                ),
              ),
              child: FloatingActionButton(
                elevation: 0,
                child: Icon(
                  Icons.add,
                  color: Colors.black,
                  size: 40,
                ),
                backgroundColor: Colors.yellow,
                onPressed: () {},
              ),
            )
          : null,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: _isShowFloatingButton
          ? BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              items: [
                BottomNavigationBarItem(
                    icon: Icon(Icons.home), title: tabText("咸鱼")),
                BottomNavigationBarItem(
                    icon: Icon(Icons.vpn_key), title: tabText("鱼塘")),
                BottomNavigationBarItem(
                    icon: Icon(Icons.home, color: Colors.white),
                    title: tabText("卖闲置")),
                BottomNavigationBarItem(
                    icon: Icon(Icons.message), title: tabText("消息")),
                BottomNavigationBarItem(
                    icon: Icon(Icons.person), title: tabText("我的")),
              ],
            )
          : null,
    );
  }
}
