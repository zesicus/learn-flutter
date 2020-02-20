import 'package:flutter/material.dart';
import '../vms/widget_switch_vm.dart';

class WidgetSwitchPage extends StatefulWidget {
  @override
  _WidgetSwitchPageState createState() => _WidgetSwitchPageState();
}

class _WidgetSwitchPageState extends State<WidgetSwitchPage> {
  final vm = WidgetSwitchVM();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Switch"),
      ),
      body: ListView(
        children: <Widget>[
          Center(
            child: Switch(
              value: vm.flag,
              onChanged: (value) {
                setState(() {
                  vm.flag = value;
                });
              },
            ),
          ),
          Divider(),
          SwitchListTile(
            value: vm.flag,
            onChanged: (value) {
              setState(() {
                vm.flag = value;
              });
            },
            secondary: Icon(Icons.flag),
            title: Text("标题"),
            subtitle: Text("实现方式"),
          ),
        ],
      ),
    );
  }
}
