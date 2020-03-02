import 'package:flutter/material.dart';
import '../vms/tab_vm.dart';

class TabMorePage extends StatefulWidget {
  @override
  _TabMorePageState createState() => _TabMorePageState();
}

class _TabMorePageState extends State<TabMorePage> {
  final vm = TabVM();

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: vm.expandChildren(context, vm.moreListSource, (){setState(() {});}),
    );
  }
}
