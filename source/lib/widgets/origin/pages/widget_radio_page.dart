import 'package:flutter/material.dart';
import '../vms/widget_radio_vm.dart';

class WidgetRadioPage extends StatefulWidget {
  WidgetRadioPage({Key key}) : super(key: key);

  @override
  _WidgetRadioPageState createState() => _WidgetRadioPageState();
}

class _WidgetRadioPageState extends State<WidgetRadioPage> {
  final vm = WidgetRadioVM();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Radio"),
      ),
      body: ListView.builder(
        itemCount: 3,
        itemBuilder: (context, index) {
          return Column(
            children: <Widget>[
              RadioListTile(
                value: index,
                groupValue: vm.flag,
                onChanged: (value) {
                  setState(() {
                    vm.flag = value;
                  });
                },
                activeColor: Colors.green,
                title: Text(vm.titles[index]),
                subtitle: Text(vm.titles[index]),
                secondary: Icon(Icons.payment),
                selected: index == vm.flag
              ),
              Divider(),
            ],
          );
        },
      ),
    );
  }
}
