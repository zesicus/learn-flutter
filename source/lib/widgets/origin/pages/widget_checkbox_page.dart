import 'package:flutter/material.dart';
import '../vms/widget_checkbox_vm.dart';

class WidgetCheckboxPage extends StatefulWidget {
  WidgetCheckboxPage({Key key}) : super(key: key);

  @override
  _WidgetCheckboxPageState createState() => _WidgetCheckboxPageState();
}

class _WidgetCheckboxPageState extends State<WidgetCheckboxPage> {
  final vm = WidgetCheckboxVM();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Check Box"),
      ),
      body: ListView(
        children: <Widget>[
          Checkbox(
            activeColor: Colors.green,
            onChanged: (bool value) {
              setState(() {
                vm.flag = value;
              });
            },
            value: vm.flag,
          ),
          Divider(),
          CheckboxListTile(
            value: vm.flag,
            onChanged: (value) {
              setState(() {
                vm.flag = value;
              });
            },
            title: Text("标题"),
            subtitle: Text("此处有描述"),
          ),
          Divider(),
          CheckboxListTile(
            value: vm.flag,
            onChanged: (value) {
              setState(() {
                vm.flag = value;
              });
            },
            title: Text("标题"),
            subtitle: Text("此处有描述"),
            secondary: Icon(Icons.flag),
          ),
        ],
      ),
    );
  }
}
