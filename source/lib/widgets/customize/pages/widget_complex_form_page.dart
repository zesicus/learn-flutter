import 'package:flutter/material.dart';

class WidgetComplexFormPage extends StatefulWidget {
  @override
  _WidgetComplexFormPageState createState() => _WidgetComplexFormPageState();
}

class _WidgetComplexFormPageState extends State<WidgetComplexFormPage> {
  final List<Color> colors = [
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.pink,
    Colors.yellow,
    Colors.deepPurple
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("综合表单"),
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: SizedBox(
              height: 10,
            ),
          ),
          SliverGrid(
            delegate: SliverChildBuilderDelegate(
              (_, index) => InkWell(
                child: Container(
                  child: Center(
                    child: Image.asset(
                      "res/icons/$index.png",
                      width: 45,
                      height: 45,
                    ),
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(0xffcecece), width: 0.5),
                  ),
                ),
              ),
              childCount: 8,
            ),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 10.0,
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              child: Image.asset("res/images/lm.jpeg"),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              height: 90,
              child: ListView.builder(
                itemCount: 8,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Container(
                    height: 90,
                    width: 95,
                    child: Row(
                      children: <Widget>[
                        Container(
                          width: 85,
                          child: Center(
                            child: Image.asset(
                              "res/icons/$index.png",
                              width: 45,
                              height: 45,
                            ),
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: Color(0xffcecece), width: 0.5),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
          SliverFixedExtentList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => Container(
                child: ListTile(
                  title: Text(
                    "我是一条记录",
                    style: TextStyle(
                      color: colors[index % colors.length],
                      letterSpacing: 2.0,
                    ),
                  ),
                ),
              ),
              childCount: 20,
            ),
            itemExtent: 60,
          ),
        ],
      ),
    );
  }
}
