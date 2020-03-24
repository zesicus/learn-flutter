import 'package:flutter/material.dart';
import 'count_bloc.dart';

class BlocProvider extends InheritedWidget {
  final bLoC = CountBLoC();

  BlocProvider({Key key, Widget child}) : super(key: key, child: child);

  static BlocProvider of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<BlocProvider>();
  }

  @override
  bool updateShouldNotify(BlocProvider oldWidget) {
    return true;
  }
}