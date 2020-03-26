import 'package:flutter/material.dart';
import 'package:learn_flutter/stream/bloc/scoped_mode/pages/bloc_scoped_under_page.dart';
import 'package:learn_flutter/stream/bloc/support/base_bloc_provider.dart';
import 'package:learn_flutter/stream/bloc/support/count_bloc.dart';

// 另一种思路由 Stateful Widget 实现的 Provider，在 page 中就可以纯使用 Stateless Widget 去展示

class BloCBaseTopPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseBLoCProvider(
      bLoC: CountBLoC(),
      child: BlocBaseTopPageContent(),
    );
  }
}

class BlocBaseTopPageContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = BaseBLoCProvider.of<CountBLoC>(context);
    return Scaffold(
      appBar: AppBar(title: Text('Based Top Page')),
      body: Stack(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(15.0),
            child: Text(
                "这是另一种思路，使用 Stateful Widget 去写 BLoC Provider，使用 dispose() 在页面结束的情况下同步释放 Stream，所以和 scoped 相比，这种方法要更加聪明一些，页面只需要专注于显示就好了。",
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
