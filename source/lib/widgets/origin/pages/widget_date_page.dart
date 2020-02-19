import 'package:flutter/material.dart';
import 'package:date_format/date_format.dart' as DateFormat;
import '../vms/widget_date_vm.dart';

class WidgetDatePage extends StatefulWidget {
  WidgetDatePage({Key key}) : super(key: key);

  @override
  _WidgetDatePageState createState() => _WidgetDatePageState();
}

class _WidgetDatePageState extends State<WidgetDatePage> {
  final vm = WidgetDateVM();

  _showDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1970),
      lastDate: DateTime(2100),
      locale: Locale('zh'),
    ).then((result) {
      if (result != null) {
        setState(() {
          vm.dateTime = result;
        });
      }
    });
  }

  _showTimePicker() async {
    final clockTime = await showTimePicker(
      context: context,
      initialTime: vm.clockTime,
    );
    if (clockTime != null) {
      setState(() {
        vm.clockTime = clockTime;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Date"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              InkWell(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(DateFormat.formatDate(vm.dateTime, [DateFormat.yyyy, '-', DateFormat.mm, '-', DateFormat.dd])),
                    Icon(Icons.keyboard_arrow_down)
                  ],
                ),
                onTap: _showDatePicker,
              ),
              SizedBox(width: 10),
              InkWell(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(vm.clockTime.format(context)),
                    Icon(Icons.keyboard_arrow_down)
                  ],
                ),
                onTap: _showTimePicker,
              ),
            ],
          )
        ],
      ),
    );
  }
}
