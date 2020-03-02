import 'package:flutter/material.dart';
import '../vms/tab_vm.dart';

class TabWidgetsPage extends StatefulWidget {
  TabWidgetsPage({Key key}) : super(key: key);

  @override
  _TabWidgetsPageState createState() => _TabWidgetsPageState();
}

class _TabWidgetsPageState extends State<TabWidgetsPage> {
  final vm = TabVM();

  @override
  void dispose() {
    vm.fieldController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: vm.expandChildren(context, vm.widgetListSource, (){setState(() {});}),
    );
  }
}
