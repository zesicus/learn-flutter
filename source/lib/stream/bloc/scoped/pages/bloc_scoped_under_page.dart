import 'package:flutter/material.dart';
import 'package:learn_flutter/stream/bloc/support/bloc_provider.dart';

class BLoCScopedUnderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of(context).bLoC;
    return Scaffold(
      appBar: AppBar(title: Text('Scoped Under Page')),
      body: Center(
        child: StreamBuilder(
          stream: bloc.stream,
          initialData: bloc.value,
          builder: (context, snapshot) => Text(
            '你点击了 ${snapshot.data} 次',
            style: Theme.of(context).textTheme.display1,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          bloc.increase();
        },
      ),
    );
  }
}
