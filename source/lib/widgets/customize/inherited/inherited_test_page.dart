import 'package:flutter/material.dart';
import 'package:learn_flutter/widgets/customize/inherited/child_widget.dart';
import 'package:learn_flutter/widgets/customize/inherited/inherited_father_widget.dart';

class InheritedTestPage extends StatefulWidget {
  @override
  _InheritedTestPageState createState() => _InheritedTestPageState();
}

class _InheritedTestPageState extends State<InheritedTestPage> {
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Inherited Widget')),
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Text(
                '使用 继承组件 可以使得子组件得状态随父组件的状态改变，但是是通过父组件 InheritedFatherWidget.of(context).data 拿值，静态调用这个有点让人困惑，毕竟静态的数据是共享的；\n网上很多帖子都教了怎么调用，都是 father widget 套了个 child widget，我也是学习 BLoC 才过来看看还有个 Inherited Widget 这么个玩意儿，回头再理理清楚。'),
          ),
          SizedBox(height: 30),
          InheritedFatherWidget(
            data: _count,
            child: Center(
              child: ChildWidget(),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          setState(() {
            ++_count;
          });
        },
      ),
    );
  }
}
