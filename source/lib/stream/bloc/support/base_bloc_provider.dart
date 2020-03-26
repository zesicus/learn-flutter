import 'package:flutter/material.dart';

// 另一种思路

abstract class BaseBloC {
  dispose();
}

class BaseBLoCProvider<T extends BaseBloC> extends StatefulWidget {
  final Widget child;
  final T bLoC;
  BaseBLoCProvider({Key key, @required this.bLoC, @required this.child}) : super(key: key);

  @override
  _BaseBLoCProviderState createState() => _BaseBLoCProviderState();

  static T of<T extends BaseBloC>(BuildContext context) {
    BaseBLoCProvider<T> provider = context.findAncestorWidgetOfExactType();
    return provider.bLoC;
  }
}

class _BaseBLoCProviderState extends State<BaseBLoCProvider<BaseBloC>> {
  @override
  void dispose() {
    widget.bLoC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}