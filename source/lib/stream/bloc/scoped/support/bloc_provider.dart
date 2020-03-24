import 'package:flutter/material.dart';
import 'count_bloc.dart';

class BlocProvider extends InheritedWidget {
  final bLoC = CountBLoC();

  static CountBLoC of(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType(aspect: BlocProvider) as BlocProvider).bLoC;
  }

  @override
  bool updateShouldNotify( BlocProvider oldWidget) {
    return true;
  }
}