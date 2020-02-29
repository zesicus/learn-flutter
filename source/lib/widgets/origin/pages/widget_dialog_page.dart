import 'package:flutter/material.dart';
import '../views/custom_dialog.dart';
import '../views/custom_loading.dart';

class WidgetDialogPage extends StatefulWidget {
  WidgetDialogPage({Key key}) : super(key: key);

  @override
  _WidgetDialogPageState createState() => _WidgetDialogPageState();
}

class _WidgetDialogPageState extends State<WidgetDialogPage> {
  /// 提示框
  _alertDialog() async {
    final result = await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("提示"),
          content: Text("您确定要删除吗？"),
          actions: <Widget>[
            FlatButton(
              child: Text("取消"),
              onPressed: () {
                Navigator.pop(context, "我是取消回执");
              },
            ),
            FlatButton(
              child: Text("确定"),
              onPressed: () {
                Navigator.pop(context, "我是确定回执");
              },
            ),
          ],
        );
      },
    );
    print(result.toString());
  }

  /// 菜单弹窗
  _simpleDialog() async {
    final result = await showDialog(
      context: context,
      builder: (context) {
        return SimpleDialog(
          title: Text("请选择"),
          children: <Widget>[
            SimpleDialogOption(
              child: Text("A. 从前有一只鸡"),
              onPressed: () {
                Navigator.pop(context, 'A');
              },
            ),
            SimpleDialogOption(
              child: Text("B. 从前有一只鸭"),
              onPressed: () {
                Navigator.pop(context, 'B');
              },
            ),
            SimpleDialogOption(
              child: Text("C. 从前有一头牛"),
              onPressed: () {
                Navigator.pop(context, 'C');
              },
            )
          ],
        );
      },
    );
    print(result.toString());
  }

  /// 菜单滑窗
  _bottomSheet() async {
    final result = await showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          height: 180,
          child: Column(
            children: <Widget>[
              ListTile(
                title: Text("分享"),
                onTap: () {
                  Navigator.pop(context, '分享');
                },
              ),
              ListTile(
                title: Text("置顶"),
                onTap: () {
                  Navigator.pop(context, '分享');
                },
              ),
              ListTile(
                title: Text(
                  "删除",
                  style: TextStyle(color: Colors.red),
                ),
                onTap: () {
                  Navigator.pop(context, '删除');
                },
              ),
            ],
          ),
        );
      },
    );
    print(result.toString());
  }

  /// 自定义弹窗
  _customDialog() async {
    final result = await showDialog(
      context: context,
      builder: (context) {
        return CustomDialog(
          "自定义弹窗",
          content: "我是内容。。。",
        );
      },
    );
    print(result.toString());
  }

  /// 自定义加载
  _customLoading() {
    showDialog(
      context: context,
      builder: (context) {
        return CustomLoading();
      },
    );
    Future.delayed(Duration(seconds: 2), () {
      Navigator.pop(context);
    });
  }

  /// 动态数据弹窗
  _showStateDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => StatefulBuilder(
        builder: (context, dialogStateState) => SimpleDialog(
          title: Text("修改值"),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Text("当前值：$_count"),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  RaisedButton(
                    child: Text("增加"),
                    onPressed: () {
                      dialogStateState(() => _count++);
                    },
                  ),
                  RaisedButton(
                    child: Text("减少"),
                    onPressed: () => dialogStateState(() => _count--),
                  ),
                  RaisedButton(
                    child: Text("知了"),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// SnackBar
  _snackBar(BuildContext context) {
    _scaffoldkey.currentState.showSnackBar(
      SnackBar(
        content: Text("我是 Snack Bar"),
        action: SnackBarAction(label: '按钮', onPressed: () {}),
        duration: Duration(milliseconds: 2000),
      ),
    );
  }

  /// 关于
  _about(BuildContext context) {
    showAboutDialog(
      context: context,
      applicationName: 'Learn Flutter',
      applicationVersion: '0.0.1',
      applicationLegalese: 'Copyright © 2020 琳琅与纷飞',
      applicationIcon: Image.asset('res/images/sword.png',
          width: 60, height: 60, fit: BoxFit.contain),
      children: <Widget>[
        Text('知之为知之，不知为不知，是知也。'),
        Text('有朋自远方来，不亦乐乎？'),
      ],
    );
  }

  final _scaffoldkey = GlobalKey<ScaffoldState>();
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldkey,
      appBar: AppBar(
        title: Text("Dialog"),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: Text("提示框"),
            onTap: _alertDialog,
          ),
          Divider(),
          ListTile(
            title: Text("菜单弹窗"),
            onTap: _simpleDialog,
          ),
          Divider(),
          ListTile(
            title: Text("底部菜单滑窗"),
            onTap: _bottomSheet,
          ),
          Divider(),
          ListTile(
            title: Text("自定义弹窗"),
            onTap: _customDialog,
          ),
          Divider(),
          ListTile(
            title: Text("自定义加载"),
            onTap: _customLoading,
          ),
          Divider(),
          ListTile(
            title: Text("动态数据弹窗"),
            onTap: () {
              _showStateDialog(context);
            },
          ),
          Divider(),
          ListTile(
            title: Text("Snack Bar"),
            onTap: () {
              _snackBar(context);
            },
          ),
          Divider(),
          ListTile(
            title: Text("关于"),
            onTap: () {
              _about(context);
            },
          ),
          Divider(),
        ],
      ),
    );
  }
}
