import 'package:flutter/material.dart';

class WidgetStaggeredpage extends StatefulWidget {
  @override
  _WidgetStaggeredpageState createState() => _WidgetStaggeredpageState();
}

class _WidgetStaggeredpageState extends State<WidgetStaggeredpage>
    with TickerProviderStateMixin {
  AnimationController controller;

  @override
  void initState() {
    controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: 5000));
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Future<void> _playAnimation() async {
    try {
      await controller.forward().orCancel;
      await controller.reverse().orCancel;
    } on TickerCanceled {
      print('动画取消');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Staggered Animation"),
      ),
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: _playAnimation,
        child: Center(
          child: Container(
            width: 300,
            height: 300,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.1),
              border: Border.all(color: Colors.black.withOpacity(0.5)),
              borderRadius: BorderRadius.circular(5),
            ),
            child: _StAnimView(controller: controller),
          ),
        ),
      ),
    );
  }
}

class _StAnimView extends StatelessWidget {
  final AnimationController controller;
  final Animation<double> opacity;
  final Animation<double> width;
  final Animation<double> height;
  final Animation<EdgeInsets> padding;
  final Animation<BorderRadius> border;
  final Animation<Color> color;
  final Animation<double> rotate;

  _StAnimView({Key key, this.controller})
      : opacity = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
            curve: Interval(0, 0.1, curve: Curves.ease), parent: controller)),
        width = Tween(begin: 50.0, end: 150.0).animate(CurvedAnimation(
            parent: controller,
            curve: Interval(0.1, 0.25, curve: Curves.ease))),
        height = Tween(begin: 50.0, end: 150.0).animate(CurvedAnimation(
            parent: controller,
            curve: Interval(0.25, 0.375, curve: Curves.ease))),
        padding = EdgeInsetsTween(
                begin: EdgeInsets.only(top: 150.0),
                end: EdgeInsets.only(top: 0.0))
            .animate(CurvedAnimation(
                parent: controller,
                curve: Interval(0.25, 0.375, curve: Curves.ease))),
        rotate = Tween(begin: 0.0, end: 0.25).animate(CurvedAnimation(
            parent: controller,
            curve: Interval(0.375, 0.5, curve: Curves.ease))),
        border = BorderRadiusTween(
                begin: BorderRadius.circular(5.0),
                end: BorderRadius.circular(75.0))
            .animate(CurvedAnimation(
                parent: controller,
                curve: Interval(0.5, 0.75, curve: Curves.ease))),
        color = ColorTween(begin: Colors.blue, end: Colors.orange).animate(
            CurvedAnimation(
                parent: controller,
                curve: Interval(0.75, 1.0, curve: Curves.ease))),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: controller,
        builder: (context, widget) {
          return Container(
            padding: padding.value,
            alignment: Alignment.center,
            child: RotationTransition(
              turns: rotate,
              child: Opacity(
                opacity: opacity.value,
                child: Container(
                  width: width.value,
                  height: height.value,
                  decoration: BoxDecoration(
                    color: color.value,
                    border: Border.all(color: Colors.indigo[300], width: 3.0),
                    borderRadius: border.value,
                  ),
                ),
              ),
            ),
          );
        });
  }
}
