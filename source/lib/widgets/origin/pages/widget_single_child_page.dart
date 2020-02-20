import 'package:flutter/material.dart';

class WidgetSingleChildPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SingleChildScollView"),
      ),
      body: SingleChildScrollView(
        child: Text(
          "是一段非常有意思的文字" * 1000,
          softWrap: true,
        ),
      ),
    );
  }
}
