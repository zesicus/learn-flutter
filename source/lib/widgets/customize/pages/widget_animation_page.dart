import 'package:flutter/material.dart';

class WidgetAnimationpage extends StatefulWidget {
  @override
  _WidgetAnimationpageState createState() => _WidgetAnimationpageState();
}

class _WidgetAnimationpageState extends State<WidgetAnimationpage>
    with TickerProviderStateMixin {
  bool _isAutoAnimating = false;
  AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000),
      lowerBound: 50.0,
      upperBound: 100.0,
    )..addListener(() {
        setState(() {
          if (_isAutoAnimating) {
            switch (_animationController.status) {
              case AnimationStatus.completed:
                _animationController.reverse();
                break;
              case AnimationStatus.dismissed:
                _animationController.forward();
                break;
              default:
                break;
            }
          } else {
            _animationController.stop();
          }
        });
      });
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
      appBar: AppBar(title: Text('Animation Controller')),
      body: Center(
        child: IconButton(
          iconSize: _animationController.value,
          icon: Icon(
            Icons.android,
            color: Colors.green[500],
          ),
          onPressed: () {
            if (_isAutoAnimating) {
              _isAutoAnimating = false;
            } else {
              _isAutoAnimating = true;
              switch (_animationController.status) {
                case AnimationStatus.completed:
                  _animationController.reverse();
                  break;
                default:
                  _animationController.forward();
                  break;
              }
            }
          },
        ),
      ),
    );
  }
}
