import 'package:flutter/material.dart';
import '../vms/tab_network_vm.dart';

class TabNetworkPage extends StatefulWidget {
  @override
  _TabNetworkPageState createState() => _TabNetworkPageState();
}

class _TabNetworkPageState extends State<TabNetworkPage> {
  final vm = TabNetworkVM();
  List<ListTile> _listChildren;

  _TabNetworkPageState() {
    _listChildren = vm.list.map((value) {
      return ListTile(
        leading: value.icon,
        title: value.text,
        onTap: () async {
          // 页面跳转
          switch (value.text.data) {
            case "Http":
              Navigator.pushNamed(context, "/network_http");
              break;
            case "Json":
              Navigator.pushNamed(context, "/network_json");
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
}
