import 'package:flutter/material.dart';
import 'count_bloc.dart';
import 'count_bloc_rx.dart';

// Scoped 模式

class BlocProvider extends InheritedWidget {
  // 这里如果需要切换 RxDart 请直接使用 CountBLoCRx
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