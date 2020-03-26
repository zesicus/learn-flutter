import 'package:flutter/material.dart';
import 'package:learn_flutter/stream/bloc/support/count_bloc.dart';

class BLoCScopedUnderPage extends StatelessWidget {
  // 这里可以替换 CountBLoCRx
  final CountBLoC bLoC;
  const BLoCScopedUnderPage(this.bLoC, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Scoped Under Page')),
      body: Center(
        child: StreamBuilder(
          stream: bLoC.stream,
          initialData: bLoC.value,
          builder: (context, snapshot) => Text(
            '你点击了 ${snapshot.data} 次',
            style: Theme.of(context).textTheme.display1,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          bLoC.increase();
        },
      ),
    );
  }
}
