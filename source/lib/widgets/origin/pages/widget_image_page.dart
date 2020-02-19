import 'package:flutter/material.dart';

class WidgetImagePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Image"),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Text(
                "网络图片",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
              ),
              // 1
              Text("1. 在图片不会挡住圆角的情况下"),
              Container(
                width: 300,
                height: 300,
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
                child: Image.network(
                  'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1580460695337&di=2de5864a7f70823f197943595769392d&imgtype=0&src=http%3A%2F%2Fa2.att.hudong.com%2F36%2F48%2F19300001357258133412489354717.jpg',
                  fit: BoxFit.contain,
                  color: Color(0xffefefef),
                  colorBlendMode: BlendMode.darken,
                ),
              ),

              // 2
              Text("2. 如果想要图片可以被裁剪"),
              Container(
                width: 300,
                height: 300,
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
                  image: DecorationImage(
                    image: NetworkImage(
                      'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1580460695337&di=2de5864a7f70823f197943595769392d&imgtype=0&src=http%3A%2F%2Fa2.att.hudong.com%2F36%2F48%2F19300001357258133412489354717.jpg',
                    ),
                    fit: BoxFit.cover,
                    // colorFilter: ColorFilter.mode(
                    //   // 图片渲染
                    //   Color(0xffefefef),
                    //   BlendMode.darken,
                    // ),
                  ),
                ),
              ),

              // 3
              Text("3. 想要相框中圆形图片"),
              Container(
                width: 300,
                height: 300,
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
                child: ClipOval(
                  child: Image.network(
                    'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1580460695337&di=2de5864a7f70823f197943595769392d&imgtype=0&src=http%3A%2F%2Fa2.att.hudong.com%2F36%2F48%2F19300001357258133412489354717.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              Text(
                "本地图片",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
              ),

              Text("本地图片的使用和远程图片是一样的"),
              Container(
                width: 300,
                height: 300,
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
                child: Image.asset('res/images/autoking.jpeg'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
