import 'package:flutter/material.dart';
import '../views/custom_dialog.dart';
import '../views/custom_loading.dart';

class WidgetDialogPage extends StatefulWidget {
  WidgetDialogPage({Key key}) : super(key: key);

  @override
  _WidgetDialogPageState createState() => _WidgetDialogPageState();
}

class _WidgetDialogPageState extends State<WidgetDialogPage> {
  // 提示框
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

  // 菜单弹窗
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

  // 菜单滑窗
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

  // 自定义弹窗
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

  // 自定义加载
  _customLoading() {
    showDialog(
      context: context,
      builder: (context) {
        return CustomLoading();
      },
    );
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pop(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        ],
      ),
    );
  }
}
