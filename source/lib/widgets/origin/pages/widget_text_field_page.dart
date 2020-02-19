import 'package:flutter/material.dart';

class WidgetTextFieldPage extends StatelessWidget {
  const WidgetTextFieldPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController usernameController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text("Text Field"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    controller: usernameController,
                    onChanged: (value) {
                      print("当前：$value");
                    },
                  ),
                ),
                SizedBox(width: 15),
                RaisedButton(
                  child: Text("获取值"),
                  onPressed: () {
                    print("当前值：${usernameController.text}");
                  },
                ),
              ],
            ),
            SizedBox(height: 10),
            TextField(
              style: TextStyle(fontSize: 13),
              decoration: InputDecoration(hintText: "我是带提示的文本框"),
            ),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                hintText: "我是带边框的文本框",
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              maxLines: 3,
              decoration: InputDecoration(
                hintMaxLines: 3,
                hintText: "我是多行第 1 条提示\n我是多行第 2 条提示\n我是多行第 3 条提示",
              ),
            ),
            SizedBox(height: 10),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                hintText: "密码框",
              ),
            ),
            SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(labelText: "提示上移的文本框"),
            ),
            SizedBox(height: 10),
            TextField(
              decoration:
                  InputDecoration(icon: Icon(Icons.people), hintText: "请输入用户名"),
            ),
          ],
        ),
      ),
    );
  }
}
