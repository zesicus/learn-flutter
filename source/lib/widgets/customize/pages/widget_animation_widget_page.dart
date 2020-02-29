import 'package:flutter/material.dart';

class WidgetAnimationWidgetpage extends StatefulWidget {
  WidgetAnimationWidgetpage({Key key}) : super(key: key);

  @override
  _WidgetAnimationWidgetpageState createState() =>
      _WidgetAnimationWidgetpageState();
}

class _WidgetAnimationWidgetpageState extends State<WidgetAnimationWidgetpage>
    with TickerProviderStateMixin {
  AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 2000),
    )..addStatusListener((status) {
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
    _animationController.forward();
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
      appBar: AppBar(
        title: Text("Animation Widget"),
      ),
      body: Stack(
        children: <Widget>[
          RunningHeart(
            animations: [
              ColorTween(begin: Colors.red[200], end: Colors.red[800])
                  .chain(CurveTween(curve: Curves.linear))
                  .animate(_animationController),
              Tween(begin: 35.0, end: 70.0)
                  .chain(CurveTween(curve: Curves.easeIn))
                  .animate(_animationController),
              Tween(begin: Offset(50, 50), end: Offset(250, 450))
                  .chain(CurveTween(curve: Curves.easeInOut))
                  .animate(_animationController),
            ],
            animationController: _animationController,
          ),
          RunningHeart(
            animations: [
              ColorTween(begin: Colors.yellow[200], end: Colors.yellow[800])
                  .chain(CurveTween(curve: Curves.linear))
                  .animate(_animationController),
              Tween(begin: 35.0, end: 70.0)
                  .chain(CurveTween(curve: Curves.easeIn))
                  .animate(_animationController),
              Tween(begin: Offset(250, 50), end: Offset(50, 450))
                  .chain(CurveTween(curve: Curves.easeInOut))
                  .animate(_animationController),
            ],
            animationController: _animationController,
          ),
          RunningHeart(
            animations: [
              ColorTween(begin: Colors.blue[200], end: Colors.blue[800])
                  .chain(CurveTween(curve: Curves.linear))
                  .animate(_animationController),
              Tween(begin: 35.0, end: 70.0)
                  .chain(CurveTween(curve: Curves.easeIn))
                  .animate(_animationController),
              Tween(begin: Offset(50, 450), end: Offset(250, 50))
                  .chain(CurveTween(curve: Curves.easeInOut))
                  .animate(_animationController),
            ],
            animationController: _animationController,
          ),
          RunningHeart(
            animations: [
              ColorTween(begin: Colors.green[200], end: Colors.green[800])
                  .chain(CurveTween(curve: Curves.linear))
                  .animate(_animationController),
              Tween(begin: 35.0, end: 70.0)
                  .chain(CurveTween(curve: Curves.easeIn))
                  .animate(_animationController),
              Tween(begin: Offset(250, 450), end: Offset(50, 50))
                  .chain(CurveTween(curve: Curves.easeInOut))
                  .animate(_animationController),
            ],
            animationController: _animationController,
          ),
        ],
      ),
    );
  }
}

class RunningHeart extends AnimatedWidget {
  final List<Animation> animations; // 动画
  final AnimationController animationController; // 控制

  RunningHeart({this.animations, this.animationController})
      : assert(animations.length == 3),
        assert(animations[0] is Animation<Color>),
        assert(animations[1] is Animation<double>),
        assert(animations[2] is Animation<Offset>),
        super(listenable: animationController);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
          left: animations[2].value.dx,
          top: animations[2].value.dy,
          child: Icon(
            Icons.favorite,
            color: animations[0].value,
            size: animations[1].value,
          ),
        ),
      ],
    );
  }
}
