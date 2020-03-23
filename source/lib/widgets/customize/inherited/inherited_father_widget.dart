import 'package:flutter/material.dart';

class InheritedFatherWidget extends InheritedWidget {
  InheritedFatherWidget({Key key, this.child, @required this.data}) : super(key: key, child: child);

  final Widget child;
  final int data;

  static InheritedFatherWidget of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType(aspect: InheritedFatherWidget);
  }

  @override
  bool updateShouldNotify( InheritedFatherWidget oldWidget) {
    return oldWidget.data != data;
  }
}