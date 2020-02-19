import 'package:flutter/material.dart';

class WidgetWrapPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Wrap"),
      ),
      body: // Wrap 块
          Padding(
        padding: EdgeInsets.all(10),
        child: Wrap(
          direction: Axis.horizontal,
          alignment: WrapAlignment.start,
          spacing: 10.0,
          // runSpacing: 10.0, // 行间距
          children: <Widget>[
            _MyButton("第一季"),
            _MyButton("第阿斯顿发季"),
            _MyButton("第是否季"),
            _MyButton("第我噶发生的季"),
            _MyButton("第史蒂夫季"),
            _MyButton("第谷歌季"),
            _MyButton("第该好好过季"),
            _MyButton("第试试季"),
            _MyButton("第一季"),
            _MyButton("第阿斯顿个季"),
          ],
        ),
      ),
    );
  }
}

// 无污染 test Button
class _MyButton extends StatelessWidget {
  final String title;

  const _MyButton(this.title, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Text(this.title),
      textColor: Theme.of(context).accentColor,
      onPressed: () {},
    );
  }
}
