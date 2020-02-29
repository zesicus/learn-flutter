import 'package:flutter/material.dart';

class WidgetHeroPage extends StatefulWidget {
  @override
  _WidgetHeroPageState createState() => _WidgetHeroPageState();
}

class _WidgetHeroPageState extends State<WidgetHeroPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Hero")),
      body: ListView(
        children: <Widget>[
          ListTile(
            leading: Hero(
              tag: 'hero_tag',
              child: CircleAvatar(
                child: Image.asset('res/images/sword.png'),
                backgroundColor: Colors.transparent,
              ),
            ),
            title: Text('Sword'),
            subtitle: Text('点击执行 hero 动画'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => HeroDetailPage()));
            },
          ),
          Divider(height: 0.5),
        ],
      ),
    );
  }
}

class HeroDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('头像')),
      body: Center(
        child: Container(
          width: 350,
          height: 350,
          child:
              Hero(tag: 'hero_tag', child: Image.asset('res/images/sword.png')),
        ),
      ),
    );
  }
}
