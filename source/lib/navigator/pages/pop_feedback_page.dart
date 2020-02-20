import 'package:flutter/material.dart';

class PopFeedbackPage extends StatelessWidget {
  const PopFeedbackPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        appBar: AppBar(
          title: Text("回传路由"),
        ),
        body: Center(
          child: RaisedButton(
            child: Text("回传：23"),
            onPressed: () {
              Navigator.pop(context, '23');
            },
          ),
        ),
      ),
      // 对返回按钮进行监听
      onWillPop: () async {
        Navigator.pop(context, 'default');
        return false;
      },
    );
  }
}
