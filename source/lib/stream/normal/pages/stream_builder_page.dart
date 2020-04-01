import 'package:flutter/material.dart';
import '../vms/stream_builder_vm.dart';

// 使用 StreamBuilder 专门监听 stream 变化，然后自动刷新重建。

class StreamBuilderPage extends StatefulWidget {
  StreamBuilderPage({Key key}) : super(key: key);

  @override
  _StreamBuilderPageState createState() => _StreamBuilderPageState();
}

class _StreamBuilderPageState extends State<StreamBuilderPage> {
  final vm = StreamBuilderVM();

  @override
  void dispose() {
    vm.sink.close();
    vm.controller.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Stream Builder')),
      body: SafeArea(
          child: Container(
        alignment: Alignment.center,
        child: StreamBuilder(
          builder: (context, snapshot) => Text(
            '当前值：${snapshot.data}',
            style: TextStyle(fontSize: 24.0),
          ),
          stream: vm.controller.stream,
          initialData: vm.count,
        ),
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () => vm.sink.add(++vm.count),
        child: Icon(Icons.add),
      ),
    );
  }
}
