import 'package:flutter/material.dart';

class RootNextPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("注册成功"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("删除之前的路由并跳转"),
            RaisedButton(
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
            RaisedButton(
              child: Text("push until"),
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  "/widget_image",
                  ModalRoute.withName("/navigator_root"),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
