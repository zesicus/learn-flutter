import 'package:flutter/material.dart';

class NormalPassValuePage extends StatelessWidget {
  const NormalPassValuePage({Key key, this.passValue = ""}) : super(key: key);

  final passValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("普通传值路由"),
      ),
      body: Center(
        child: Text(passValue),
      ),
    );
  }
}
