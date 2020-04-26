import 'package:flutter/material.dart';
import 'package:learn_flutter/async/compute/async_compute_vm.dart';

class AsyncComputePage extends StatefulWidget {
  AsyncComputePage({Key key}) : super(key: key);

  @override
  _AsyncComputePageState createState() => _AsyncComputePageState();
}

class _AsyncComputePageState extends State<AsyncComputePage> {
  AsyncComputeVM vm = AsyncComputeVM();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Compute')),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
                'compute 是异步的轻量封装，使用需要注意两点：\n1. 我们 compute 中运行的函数必须是顶级函数或者是 static 函数；\n2. compute 传参，只能传一个参数，返回值也只有一个；'),
          ),
          Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 100,
                  height: 100,
                  child: CircularProgressIndicator(),
                ),
                SizedBox(height: 10),
                FlatButton(
                  onPressed: () async {
                    await vm.computeEvent(1000000000);
                    setState(() {});
                  },
                  child: Text(vm.count.toString()),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
