import 'package:flutter/material.dart';
import 'package:learn_flutter/stream/bloc/scoped/pages/bloc_scoped_under_page.dart';
import 'package:learn_flutter/stream/bloc/scoped/support/bloc_provider.dart';

class BLoCScopedTopPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of(context).bLoC;
    return Scaffold(
      appBar: AppBar(title: Text('Scoped Top Page')),
      body: Center(
        child: StreamBuilder(
          stream: bloc.stream,
          initialData: bloc.value,
          builder: (context, snapshot) {
            return Text(
              '下一页中点击了 ${snapshot.data} 次',
              style: Theme.of(context).textTheme.display1,
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.keyboard_arrow_right),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return BLoCScopedUnderPage();
          }));
        },
      ),
    );
  }
}
