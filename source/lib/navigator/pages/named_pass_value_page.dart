import 'package:flutter/material.dart';

class NamedPassValuePage extends StatelessWidget {
  const NamedPassValuePage({Key key, this.argument = ""}) : super(key: key);

  final argument;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("命名传值路由"),
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        child: Stack(
          children: <Widget>[
            Positioned(
              left: 0,
              top: 0,
              child: Text("步骤：\n1. 参考 routes.dart，构建 routes 列表和 onGenerateRoute；\n2. 参考 main.dart 赋值 onGenerateRoute 属性；\n3. 参考 tab_navigator_page.dart 本次跳转。"),
            ),
            Positioned(
              bottom: 10,
              right: 10,
              child: Text("传入值：$argument"),
            ),
          ],
        ),
      ),
    );
  }
}
