import 'package:flutter/material.dart';
import 'shared_preferences_vm.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SharedPreferencesPage extends StatefulWidget {
  @override
  _SharedPreferencesPageState createState() => _SharedPreferencesPageState();
}

class _SharedPreferencesPageState extends State<SharedPreferencesPage> {
  final vm = SharedPreferencesVM();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Shared Preferences')),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(20.0),
            child: Text(
              'Shared Preferences',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Theme.of(context).primaryColor, fontSize: 20.0),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.0),
            child: TextField(
              controller: vm.keyTC,
              decoration: InputDecoration(
                  icon: Icon(Icons.lock_outline), labelText: 'Key'),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(12.0),
            child: TextField(
              controller: vm.valueTC,
              decoration: InputDecoration(
                  icon: Icon(Icons.text_fields), labelText: 'Value'),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.0),
            child: RaisedButton(
              onPressed: () async {
                var result = await vm.writeToShare();
                switch (result) {
                  case SPResult.noKey:
                    Fluttertoast.showToast(
                      msg: '请输入 Key',
                      backgroundColor: Colors.red,
                    );
                    break;
                  case SPResult.noValue:
                    Fluttertoast.showToast(
                      msg: '请输入 Value',
                      backgroundColor: Colors.red,
                    );
                    break;
                  case SPResult.success:
                    Fluttertoast.showToast(
                      msg: '写入成功',
                      backgroundColor: Colors.green,
                    );
                    break;
                  default:
                    break;
                }
              },
              child: Text('写入 Share'),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(12.0),
            child:
                Text('Key: ${vm.shareKey} | 存储 Value：${vm.sharedReadContent}'),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.0),
            child: RaisedButton(
              onPressed: () async {
                var result = await vm.readFromShare();
                switch (result) {
                  case SPResult.noKey:
                    Fluttertoast.showToast(
                      msg: '请输入 Key',
                      backgroundColor: Colors.red,
                    );
                    break;
                  default:
                    setState(() {});
                    break;
                }
              },
              child: Text('读取 Share'),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(12.0),
            child: RaisedButton(
              onPressed: () async {
                var result = await vm.delFromShare();
                switch (result) {
                  case SPResult.noKey:
                    Fluttertoast.showToast(
                      msg: '请输入 Key',
                      backgroundColor: Colors.red,
                    );
                    break;
                  default:
                    setState(() {});
                    break;
                }
              },
              child: Text('删除 Key Value'),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.0),
            child: Text(
              '使用了 shared_preferences 这个库，在 android 上应该就叫这个名，在 iOS 上实际用的是 NSUserDefaults 去存储，这种存储方法应该是最普遍和广泛的了。',
              style: TextStyle(color: Colors.blueGrey),
            ),
          )
        ],
      ),
    );
  }
}
