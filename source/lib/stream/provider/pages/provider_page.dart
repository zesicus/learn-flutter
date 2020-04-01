import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../vms/provider_vm.dart';

class ProviderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Counter()),
      ],
      child: Consumer<Counter>(
        builder: (context, counter, widget) {
          return Scaffold(
            appBar: AppBar(title: Text('Provider Page')),
            body: _PageContent(),
            floatingActionButton: _PageIncrementButton(),
          );
        },
      ),
    );
  }
}

// - 以下是 Views

// 计数增加悬浮按钮
class _PageIncrementButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => Provider.of<Counter>(context, listen: false).increase(),
      tooltip: '计数增加',
      child: const Icon(Icons.add),
    );
  }
}

// 页面内容
class _PageContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final counter = Provider.of<Counter>(context);
    return Stack(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(15.0),
          child: Text(
              "使用 Provider 相对于 BLoC 的好处是，不需要去关心流的配置以及释放，仅需要简易配置即可实现；界面的响应式刷新有点类似 Stream Builder，但对多 provider 更加友好。",
              style: TextStyle(fontSize: 17)),
        ),
        Center(
          child: Text(
            '${counter.count}',
            style: Theme.of(context).textTheme.display1,
          ),
        ),
      ],
    );
  }
}
