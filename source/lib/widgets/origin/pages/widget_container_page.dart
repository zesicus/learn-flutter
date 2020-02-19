import 'package:flutter/material.dart';

class WidgetContainerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Container"),
      ),
      body: Center(
        child: Container(
          width: 350,
          height: 350,
          child: Container(
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: Colors.blueGrey,
                width: 1,
              ),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16.0),
                bottomRight: Radius.circular(16.0),
              ),
            ),
          ),
          decoration: BoxDecoration(
            color: Color(0xffefefef),
            border: Border.all(
              color: Colors.blueGrey,
              width: 1.0,
            ),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16.0),
              bottomRight: Radius.circular(16.0),
            ),
          ),
        ),
      ),
    );
  }
}
