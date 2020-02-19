import 'package:flutter/material.dart';
import 'replaced_next_page.dart';

class ReplacedRoutePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("替换路由"),
      ),
      body: Center(
        child: RaisedButton(
          child: Text("跳转"),
          onPressed: () {
            // 替换跳转
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => ReplacedNextPage(),
              ),
            );
          },
        ),
      ),
    );
  }
}
