import 'dart:async';
import 'package:flutter/material.dart';
import '../vms/stream_vm.dart';

class StreamPage extends StatefulWidget {
  StreamPage({Key key}) : super(key: key);

  @override
  _StreamPageState createState() => _StreamPageState();
}

class _StreamPageState extends State<StreamPage> {
  String text = '单播区域\n';
  String text1 = '广播区域 1\n';
  String text2 = '广播区域 2\n';
  final vm = StreamVM();
  var _sub;
  var _sub1;
  var _sub2;

  _StreamPageState() {
    Future.delayed(Duration(seconds: 2), () {
      _sub = vm.streamController.stream
      ..where((value) => value is String) // 只接收 String 类型的数据
      ..take(50) // 只接收 50 个数据
      ..listen((data) {
        setState(() {
          text += data;
        });
      });
    });
    _sub1 = vm.bs.listen((data) {
      setState(() {
        text1 += data + '\n';
      });
    });
    _sub2 = vm.bs.listen((data) {
      setState(() {
        text2 += data + '\n';
      });
    });
  }

  @override
  void dispose() {
    vm.streamController.close();
    vm.bsController.close();
    _sub.cancel();
    _sub1.cancel();
    _sub2.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Stream')),
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Text(text),
            ),
          ),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                  child: Padding(
                padding: EdgeInsets.all(10),
                child: Text(text1),
              )),
              Expanded(
                  child: Padding(
                padding: EdgeInsets.all(10),
                child: Text(text2),
              )),
            ],
          ))
        ],
      ),
    );
  }
}
