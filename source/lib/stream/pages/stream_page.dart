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

  _StreamPageState() {
    Future.delayed(Duration(seconds: 2), () {
      vm.streamController.stream.listen((data) {
        setState(() {
          text += data;
        });
      });
    });
    vm.bs.listen((data) {
      setState(() {
        text1 += data + '\n';
      });
    });
    vm.bs.listen((data) {
      setState(() {
        text2 += data + '\n';
      });
    });
  }

  @override
  void dispose() {
    vm.streamController.close();
    vm.bsController.close();
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
