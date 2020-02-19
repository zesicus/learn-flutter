import 'package:flutter/material.dart';

class RootNextPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("注册成功"),
      ),
      body: Center(
        child: RaisedButton(
          child: Text("完成"),
          onPressed: () {
            Navigator.pushNamedAndRemoveUntil(
              context,
              "/",
              (route) => route == null,
              arguments: 1,
            );
          },
        ),
      ),
    );
  }
}
