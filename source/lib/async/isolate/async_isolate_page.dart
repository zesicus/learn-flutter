import 'package:flutter/material.dart';
import 'package:learn_flutter/async/isolate/async_isolate_vm.dart';

class AsyncIsolatePage extends StatefulWidget {
  AsyncIsolatePage({Key key}) : super(key: key);

  @override
  _AsyncIsolatePageState createState() => _AsyncIsolatePageState();
}

class _AsyncIsolatePageState extends State<AsyncIsolatePage> {
  AsyncIsolateVM vm = AsyncIsolateVM();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('isolate')),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('isolate 可以解决 compute 不能多次返回结果，没办法持续性传值计算等限制，但是使用起来非常笨重，也不好理解。'),
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
                    await vm.isolateCount(1000000000);
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
