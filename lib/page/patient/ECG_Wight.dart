import 'package:flutter/material.dart';
import 'dart:math' as math;

class DemoPainter extends CustomPainter {
  final double _arcStart;
  final double _arcSweep;

  DemoPainter(this._arcStart, this._arcSweep);

  @override
  void paint(Canvas canvas, Size size) {
    double side = math.min(size.width, size.height);
    Paint paint = Paint()
      ..color = Colors.blue
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 4.0
      ..style = PaintingStyle.stroke;
      canvas.drawArc(
        Offset.zero & Size(side, side), _arcStart, _arcSweep, false, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}


class DemoWidget extends StatefulWidget {
  @override
  _DemoWidgetState createState() => _DemoWidgetState();
}

class _DemoWidgetState extends State<DemoWidget>
    with SingleTickerProviderStateMixin {
      AnimationController _controller;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: DemoPainter(0.0, _controller.value * math.pi * 2),
    );    
  }
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 1500))
          ..repeat()
          ..addListener(() {
            setState(() {});
          });
    super.initState();
  }

}