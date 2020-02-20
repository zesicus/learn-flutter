import 'package:flutter/material.dart';
import '../vms/tab_navigator_vm.dart';
import '../../navigator/pages/normal_route_page.dart';
import '../../navigator/pages/normal_pass_value_page.dart';

class TabNavigatorPage extends StatefulWidget {
  TabNavigatorPage({Key key}) : super(key: key);

  @override
  _TabNavigatorPageState createState() => _TabNavigatorPageState();
}

class _TabNavigatorPageState extends State<TabNavigatorPage> {
  final vm = TabNavigatorVM();
  List<ListTile> _listChildren;

  Future<String> _showFieldDialog() async {
    String result = await showDialog(
      context: context,
      child: AlertDialog(
        title: Text("传值"),
        content: TextField(
          controller: vm.fieldController,
          decoration: InputDecoration(hintText: "请输入要传的内容"),
        ),
        actions: <Widget>[
          FlatButton(
            child: Text("取消"),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          FlatButton(
            child: Text(
              "确定",
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            onPressed: () {
              Navigator.pop(context, vm.fieldController.text);
            },
          )
        ],
      ),
    );
    return result;
  }

  _TabNavigatorPageState() {
    _listChildren = vm.list.map((value) {
      return ListTile(
        leading: value.icon,
        title: value.text,
        onTap: () async {
          // 页面跳转
          switch (value.text.data) {
            case "普通路由":
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => NormalRoutePage(),
                ),
              );
              break;
            case "普通传值路由":
              String result = await _showFieldDialog();
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => NormalPassValuePage(
                      passValue: result == null ? "" : result),
                ),
              );
              break;
            case '命名路由':
              Navigator.pushNamed(context, "/navigator_named");
              break;
            case '命名传值路由':
              String result = await _showFieldDialog();
              Navigator.pushNamed(context, "/navigator_pass_value",
                  arguments: result == null ? "" : result);
              break;
            case '替换路由':
              Navigator.pushNamed(context, "/navigator_replaced");
              break;
            case '移除路由':
              Navigator.pushNamed(context, "/navigator_root");
              break;
            case '回传路由':
              Navigator.pushNamed(context, "/navigator_pop").then((onValue) {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text("返回值"),
                      content: Text("$onValue"),
                      actions: <Widget>[
                        FlatButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text("确定"),
                        ),
                      ],
                    );
                  },
                );
              });
              break;
            default:
              print("Others");
              break;
          }
        },
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: _listChildren,
    );
  }

  @override
  void dispose() {
    vm.fieldController.dispose();
    super.dispose();
  }
}
