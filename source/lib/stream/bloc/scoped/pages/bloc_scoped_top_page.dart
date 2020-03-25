import 'package:flutter/material.dart';
import 'package:learn_flutter/stream/bloc/scoped/pages/bloc_scoped_under_page.dart';
import 'package:learn_flutter/stream/bloc/support/bloc_provider.dart';

class BLoCScopedTopPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of(context).bLoC;
    return Scaffold(
      appBar: AppBar(title: Text('Scoped Top Page')),
      body: Stack(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(15.0),
            child: Text(
                "当前使用 Scoped Stream Controller 实现，如果使用 Rx 请前往 bloc_provider.dart 文件，根据注释说明更改。",
                style: TextStyle(fontSize: 18)),
          ),
          Center(
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
        ],
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
