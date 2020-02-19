import 'package:flutter/material.dart';

class CustomLoading extends Dialog {
  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Center(
        child: Container(
          width: 120,
          height: 135,
          child: Column(
            children: <Widget>[
              Container(
                width: 120,
                height: 100,
                child: Center(
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation(Colors.teal),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(bottom: 8),
                  child: Text("请稍后"),
                ),
              ),
            ],
          ),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(10)),
        ),
      ),
    );
  }
}
