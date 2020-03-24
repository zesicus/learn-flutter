import 'package:flutter/material.dart';
import 'package:learn_flutter/widgets/customize/inherited/inherited_father_widget.dart';

class ChildWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(InheritedFatherWidget.of(context).data.toString(),
        textAlign: TextAlign.center, style: TextStyle(fontSize: 20.0));
  }
}
