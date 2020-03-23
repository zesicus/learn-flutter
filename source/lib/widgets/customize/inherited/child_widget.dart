import 'package:flutter/material.dart';
import 'package:learn_flutter/widgets/customize/inherited/inherited_father_widget.dart';

class ChildWidget extends StatefulWidget {
  ChildWidget({Key key}) : super(key: key);

  @override
  _ChildWidgetState createState() => _ChildWidgetState();
}

class _ChildWidgetState extends State<ChildWidget> {
  @override
  Widget build(BuildContext context) {
    return Text(InheritedFatherWidget.of(context).data.toString(), textAlign: TextAlign.center, style: TextStyle(fontSize: 20.0));
  }

  @override
  void didChangeDependencies() {
    // 父 widget 中 Inherited Widget 改变时会被调用
    print('Did Change Dependencies: ${InheritedFatherWidget.of(context).data}');
    super.didChangeDependencies();
  }
}