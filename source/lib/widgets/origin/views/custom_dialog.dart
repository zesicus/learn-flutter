import 'package:flutter/material.dart';

class CustomDialog extends Dialog {

  final String title;
  final String content;

  CustomDialog(this.title, {this.content});

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Center(
        child: Container(
          width: 280,
          height: 200,
          color: Colors.white,
          child: Column(
            children: <Widget>[
              // 顶部
              Stack(
                children: <Widget>[
                  Container(
                    width: 280,
                    height: 40,
                    padding: EdgeInsets.only(top: 8),
                    child: Center(child: Text(title)),
                  ),
                  Positioned(
                    right: 5,
                    child: IconButton(
                      icon: Icon(Icons.close),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ],
              ),
              Divider(),
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(bottom: 15),
                  padding: EdgeInsets.all(15),
                  child: Center(
                    child: Text(content),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
