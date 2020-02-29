import 'package:flutter/material.dart';

class WidgetTweenPage extends StatefulWidget {
  WidgetTweenPage({Key key}) : super(key: key);

  @override
  _WidgetTweenPageState createState() => _WidgetTweenPageState();
}

class _WidgetTweenPageState extends State<WidgetTweenPage>
    with TickerProviderStateMixin {
  AnimationController _animationController;
  // 缩放动画
  Animation _scaleAnimation;
  // 颜色动画
  Animation<Color> _colorAnimation;
  // 位置动画
  Animation<Offset> _positionAnimation;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 2000),
    )
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        switch (status) {
          case AnimationStatus.completed:
            _animationController.reverse();
            break;
          case AnimationStatus.dismissed:
            _animationController.forward();
            break;
          default:
        }
      });
    _scaleAnimation = Tween(begin: 35.0, end: 70.0)
        .chain(CurveTween(curve: Curves.decelerate))
        .animate(_animationController);
    _colorAnimation = ColorTween(begin: Colors.red[200], end: Colors.red[900])
        .chain(CurveTween(curve: Curves.linearToEaseOut))
        .animate(_animationController);
    _positionAnimation = Tween(begin: Offset(50, 50), end: Offset(200, 300))
        .chain(CurveTween(curve: Curves.bounceInOut))
        .animate(_animationController);
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Tween')),
      body: Stack(
        children: <Widget>[
          Positioned(
            left: _positionAnimation.value.dx,
            top: _positionAnimation.value.dy,
            child: IconButton(
              iconSize: _scaleAnimation.value,
              icon: Icon(
                Icons.favorite,
                color: _colorAnimation.value is Color ? _colorAnimation.value : Colors.red[200],
              ),
              onPressed: () {
                _animationController.forward();
              },
            ),
          ),
        ],
      ),
    );
  }
}
