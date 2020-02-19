import 'package:flutter/material.dart';
import 'root_next_page.dart';

class RooteRoutePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("注册"),
      ),
      body: Center(
        child: RaisedButton(
          child: Text("注册"),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => RootNextPage(),
              ),
            );
          },
        ),
      ),
    );
  }
}
