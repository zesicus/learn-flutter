import 'package:flutter/material.dart';
import 'package:learn_flutter/storage/sqflite/sqflite_vm.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

class SqflitePage extends StatefulWidget {
  @override
  _SqflitePageState createState() => _SqflitePageState();
}

class _SqflitePageState extends State<SqflitePage> {
  final vm = SqfliteVM();
  String displayText = "";

  @override
  void initState() {
    super.initState();
    _initDB();
  }

  @override
  void dispose() {
    vm.dispose();
    super.dispose();
  }

  Future<void> _initDB() async {
    displayText += await vm.openDB();
    displayText += await vm.createTable();
    setState(() {});
  }

  RaisedButton getButtonItem(int index) {
    String btnTitle;
    Function btnFunc;
    switch (index) {
      case 0:
        btnTitle = '增';
        btnFunc = () async {
          displayText += await vm.addData(int.parse(vm.idFieldController.text),
              vm.nameFieldController.text);
          setState(() {});
        };
        break;
      case 1:
        btnTitle = '删';
        btnFunc = () async {
          displayText += await vm.delData(int.parse(vm.idFieldController.text));
          setState(() {});
        };
        break;
      case 2:
        btnTitle = '改';
        btnFunc = () async {
          displayText += await vm.modifyData(
              int.parse(vm.idFieldController.text),
              vm.nameFieldController.text);
          setState(() {});
        };
        break;
      case 3:
        btnTitle = '查单条';
        btnFunc = () async {
          displayText +=
              await vm.queryOne(int.parse(vm.idFieldController.text));
          setState(() {});
        };
        break;
      case 4:
        btnTitle = '查所有';
        btnFunc = () async {
          displayText += await vm.queryMore();
          setState(() {});
        };
        break;
      case 5:
        btnTitle = '重建库';
        btnFunc = () async {
          displayText += await vm.recreateDB();
          setState(() {});
        };
        break;
      default:
        break;
    }
    RaisedButton btn = RaisedButton(child: Text(btnTitle), onPressed: btnFunc);
    return btn;
  }

  @override
  Widget build(BuildContext context) {
    return KeyboardDismisser(
      gestures: [
        GestureType.onTap,
        GestureType.onPanUpdateDownDirection,
      ],
      child: Scaffold(
        appBar: AppBar(
          title: Text('数据库'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CustomScrollView(
            slivers: <Widget>[
              SliverToBoxAdapter(
                child: Text(
                  '数据库操作示例',
                ),
              ),
              SliverToBoxAdapter(
                child: TextField(
                  style: TextStyle(fontSize: 14),
                  decoration: InputDecoration(labelText: '用户ID'),
                  controller: vm.idFieldController,
                ),
              ),
              SliverToBoxAdapter(
                child: TextField(
                  style: TextStyle(fontSize: 14),
                  // obscureText: true,
                  decoration: InputDecoration(labelText: '用户昵称'),
                  controller: vm.nameFieldController,
                ),
              ),
              SliverToBoxAdapter(
                child: SizedBox(height: 20),
              ),
              SliverGrid(
                delegate: SliverChildBuilderDelegate(
                  (_, index) => getButtonItem(index),
                  childCount: 6,
                ),
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 100.0, // 子控件最大宽度
                  mainAxisSpacing: 0.0, // 主轴之间的间距
                  crossAxisSpacing: 0.0, // 交叉轴间距
                  childAspectRatio: 2.2, // 子控件的宽高比
                ),
              ),
              SliverToBoxAdapter(
                child: SizedBox(height: 20),
              ),
              SliverToBoxAdapter(
                child: Text(displayText),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
