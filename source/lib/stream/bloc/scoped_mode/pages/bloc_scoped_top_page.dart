import 'package:flutter/material.dart';
import 'package:learn_flutter/stream/bloc/scoped_mode/pages/bloc_scoped_under_page.dart';
import 'package:learn_flutter/stream/bloc/support/bloc_provider.dart';
import 'package:learn_flutter/stream/bloc/support/count_bloc.dart';

// 使用继承 Inherited Widget 的 BLoC Provider 完成的交互，page 使用 Stateful Widget 对 provider 进行释放。

// 外壳
class BLoCScopedTopPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(child: BLoCScopedTopPageContent());
  }
}

// 内容
class BLoCScopedTopPageContent extends StatefulWidget {
  @override
  _BLoCScopedTopPageContentState createState() =>
      _BLoCScopedTopPageContentState();
}

class _BLoCScopedTopPageContentState extends State<BLoCScopedTopPageContent> {
  CountBLoC bloc;

  @override
  void dispose() {
    // 释放 Stream
    bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bloc = BlocProvider.of(context).bLoC;
    return Scaffold(
      appBar: AppBar(title: Text('Scoped Top Page')),
      body: Stack(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(15.0),
            child: Text(
                "当前使用普通 Stream Controller 实现，如果使用 Rx 请前往 bloc_provider.dart 和 bloc_scoped_under_page.dart 文件，根据注释说明更改。\n\n虽然很多博文都在极力避免使用 Stateful Widget，但是没有 dispose 就无法释放 Stream Controller，所以仍然不可避免使用到。",
                style: TextStyle(fontSize: 17)),
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
            return BLoCScopedUnderPage(bloc);
          }));
        },
      ),
    );
  }
}
