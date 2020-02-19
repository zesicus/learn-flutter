import 'package:flutter/material.dart';

class NamedRoutePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("命名路由"),
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        child: Text("步骤: \n1. main.dart 文件添加跳转路由 import\n2. MaterialApp 添加 routes 属性\n3. routes 对应 {\"\/named_route_page\": (context) => NamedRoutepage()}\n4. 跳转使用 Navigator.pushNamed(context, \"\/named_route_page\");"),
      ),
    );
  }
}
