import 'dart:ffi';

import 'package:flutter/material.dart';
//import 'dart:math' as math;

//存点的列表
class DrawingPoints {
  Paint paint;
  Offset points;
  DrawingPoints({this.points, this.paint});
}

class DemoPainter extends CustomPainter {
  List<DrawingPoints> pointsList;
  List<Offset> offsetPoints = List();
  List<Offset> points = List();



  @override
  void paint(Canvas canvas, Size size) {
    // for(int i = 0;i<10;i++){
    //   pointsList.add(DrawingPoints(
    //     points: Offset(40.0, 40.0),
    //     paint: Paint()
    //       ..style = PaintingStyle.stroke
    //       ..color = Colors.black
    //       ..strokeWidth = (20.0)
    //       ..isAntiAlias = true));
    // }

    var paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..color = Colors.green
      ..strokeWidth = (1.0)
      ..isAntiAlias = true;
    
    
    // canvas.drawLine(
    //     Offset(10.toDouble(),10.toDouble()), Offset(100.toDouble(),100.toDouble()), paint);
    // canvas.drawLine(
    // Offset(100.toDouble(),100.toDouble()), Offset(150.toDouble(),100.toDouble()), paint);

    Path path = Path();
    path.moveTo(100, 100);
    path.lineTo(200, 200);
    path.lineTo(250, 200);
    path.lineTo(200, 250);
    canvas.drawPath(path, paint);


    // var pathMetrics = path.computeMetrics(forceClosed: true);
    // var list = pathMetrics.toList();
    // var length = value * list.length.toInt();
    // Path newPath = new Path();
    // for (int i = 0; i < length; i++) {
    //   var extractPath =list[i].extractPath(0, list[i].length * value, startWithMoveTo: true);
    //   newPath.addPath(extractPath, Offset(0, 0));
    // }
    // canvas.drawPath(newPath, paint);

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
    //绘制Wight
    return CustomPaint(
      painter: DemoPainter(),
    );
  }

  @override
  void dispose() {
    //动画结束
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    //动画启动
    // _controller =
    //     AnimationController(vsync: this, duration: Duration(milliseconds: 2000))
    //       ..repeat()
    //       ..addListener(() {
    //         setState(() {});
    //       });
    _controller = AnimationController(vsync: this, duration: Duration(milliseconds: 2000));
      Tween(begin: 0.0, end: Duration(milliseconds: 2000).inMilliseconds.toDouble())
          .animate(_controller)
            ..addStatusListener((status) {
              if (status == AnimationStatus.completed) {
                print('绘制完成');
              }
            })
            ..addListener(() {
              var value = _controller.value;//当前动画值
              setState(() {});
            });
      _controller.forward();
    super.initState();
  }
}
