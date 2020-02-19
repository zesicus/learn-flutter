import 'package:flutter/material.dart';

class ReplacedNextPage extends StatelessWidget {
  const ReplacedNextPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("替换路由下级页面"),
      ),
      body: Center(
        child: RaisedButton(
          child: Text("完成"),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
