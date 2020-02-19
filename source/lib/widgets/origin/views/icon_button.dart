import 'package:flutter/material.dart';

class MyIconButton extends StatelessWidget {
  final IconData icon;
  final Color color;
  final double size;
  MyIconButton(this.icon, [this.color = Colors.red, this.size = 28.0]);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: 80,
      color: color,
      child: Center(
        child: Icon(
          this.icon,
          size: this.size,
          color: Colors.white,
        ),
      ),
    );
  }
}