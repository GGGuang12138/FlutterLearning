import 'package:flutter/material.dart';
//import 'dart:math' as math;

//存点的列表
// class DrawingPoints {
//   Paint paint;
//   Offset points;
//   DrawingPoints({this.points, this.paint});
// }

//数据
class Point {
  double y;

  Point({@required this.y});
}

class DemoPainter extends CustomPainter {
  List<Offset> offsetPoints = List();
  List<Offset> points = List();

  double startX, endX, startY, endY; //定义绘制区域的边界
  static const double basePadding = 8; //默认的边距
  double fixedHeight, fixedWidth; //去除padding后曲线的真实宽高
  bool isShowXyRuler; //是否显示xy刻度
  List<Point> chatBeans = []; //数据源

  Size size;
  int yNum, length; //数据个数
  List<double> maxMin; // [max, min]
  Path path;//路径
  double value;//动画数值

  DemoPainter({@required this.chatBeans,@required this.value});

  void initBorder(Size size) {
    print('size - - > $size');
    yNum = chatBeans.length;//获取点的个数
    startX = yNum > 0 ? basePadding * 2.5 : basePadding * 2; // 预留出y轴刻度值所占的空间
    endX = size.width - basePadding * 2;
    startY = size.height - (basePadding);//y轴下
    endY = basePadding; //y轴上
    fixedHeight = startY - endY; //高度
    fixedWidth = endX - startX; //宽度
    maxMin = calculateMaxMin(chatBeans);// [max, min]
  }

  //  [max, min]
  List<double> calculateMaxMin(List<Point> chatBeans) {
    if (chatBeans == null || chatBeans.length == 0) return [0, 0];
    double max = 0.0, min = 0.0;
    for (Point bean in chatBeans) {
      if (max < bean.y) {
        max = bean.y;
      }
      if (min > bean.y) {
        min = bean.y;
      }
    }
    return [max, min];
  }

  //画笔
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..color = Colors.green
      ..strokeWidth = (1.0)
      ..isAntiAlias = true;

    //计算坐标
    initBorder(size);

    //画x轴  重构！
    length = chatBeans.length; //长度 可以改成yNum
    print(length.toString());
    double DW = fixedWidth / (length - 1); //两个点之间的x方向距离
    double DH = fixedHeight / (length - 1); //两个点之间的y方向距离
    // for (int i = 0; i < length; i++) {
    //   ///绘制x轴文本
    //   TextPainter(
    //         textAlign: TextAlign.center,
    //         ellipsis: '.',
    //         text: TextSpan(
    //             text: chatBeans[i].x,
    //             style: TextStyle(color: Colors.black, fontSize: 12)),
    //         textDirection: TextDirection.ltr)
    //       ..layout(minWidth: 40, maxWidth: 40)
    //       ..paint(canvas, Offset(startX + DW * i - 20, startY + basePadding));

    //   ///x轴刻度
    //   //canvas.drawLine(Offset(startX + DW * i, startY),Offset(startX + DW * i, startY - rulerWidth), paint);
    // }

    //画y轴
    // int yLength = yNum + 1; //包含原点,所以 +1
    // double dValue = maxMin[0] / yNum; //一段对应的值
    // double dV = fixedHeight / yNum; //一段对应的高度
    // for (int i = 0; i < yLength; i++) {
    //   ///绘制y轴文本，保留1位小数
    //   var yValue = (dValue * i).toStringAsFixed(0);
    //   TextPainter(
    //       textAlign: TextAlign.center,
    //       ellipsis: '.',
    //       maxLines: 1,
    //       text: TextSpan(
    //           text: '$yValue',
    //           style: TextStyle(color: Colors.black, fontSize: 12)),
    //       textDirection: TextDirection.rtl)
    //     ..layout(minWidth: 40, maxWidth: 40)
    //     ..paint(canvas, Offset(startX - 40, startY - dV * i - 12 / 2));

    //   ///y轴刻度
    //   //canvas.drawLine(Offset(startX, startY - dV * (i)),Offset(startX + rulerWidth, startY - dV * (i)), paint);
    // }

    //遍历数组，讲数据填入path
    path = Path();
    double preX, preY, currentX, currentY;
    double DX = 60; //x轴坐标间隔   ！
    double xoffset = value*100;
    print(value);
    for (int i = 0; i < chatBeans.length; i++) {
      if (i == 0) {
        path.moveTo(
            startX-xoffset, (startY - chatBeans[i].y / maxMin[0] * fixedHeight)); //总高度减去 数据在图中对应的长度
      } else {
        currentX = startX + DX * i -xoffset;
        currentY = (startY - chatBeans[i].y / maxMin[0] * fixedHeight);
        path.lineTo(currentX, currentY);
      }

      // currentX = startX + W * i;
      // preX = startX + W * (i - 1);

      // preY = (startY - chatBeans[i - 1].y / maxMin[0] * fixedHeight);
      // currentY = (startY - chatBeans[i].y / maxMin[0] * fixedHeight);

      // path.cubicTo(
      //               (preX + currentX) / 2, preY,
      //               (preX + currentX) / 2, currentY,
      //               currentX, currentY
      //             );
    }

    //对路径进行截取，实现动画
    // var pathMetrics = path.computeMetrics(forceClosed: true);
    // var list = pathMetrics.toList();
    // var lengths = value * list.length.toInt();
    // Path newPath = new Path();
    // for (int i = 0; i < lengths; i++) {
    //     var extractPath =list[i].extractPath(0, list[i].length * value, startWithMoveTo: true);
    //     newPath.addPath(extractPath, Offset(0, 0));
    //   }
    // canvas.drawPath(newPath, paint);

    // for(int i = 0;i<10;i++){
    //   pointsList.add(DrawingPoints(
    //     points: Offset(40.0, 40.0),
    //     paint: Paint()
    //       ..style = PaintingStyle.stroke
    //       ..color = Colors.black
    //       ..strokeWidth = (20.0)
    //       ..isAntiAlias = true));
    // }

    // canvas.drawLine(
    //     Offset(10.toDouble(),10.toDouble()), Offset(100.toDouble(),100.toDouble()), paint);
    // canvas.drawLine(
    // Offset(100.toDouble(),100.toDouble()), Offset(150.toDouble(),100.toDouble()), paint);

    // Path path = Path();
    // path.moveTo(100, 100);
    // path.lineTo(200, 200);
    // path.lineTo(250, 200);
    // path.lineTo(200, 250);
    // canvas.drawPath(path, paint);

    // 视图，（线在图的范围内才可见）
    //canvas.save();
    canvas.clipRect(
      Rect.fromLTWH(
        startX.toDouble(),
        endY.toDouble(),
        fixedWidth,
        fixedHeight,
      ),
    );
    print(startX.toString());
    print(endY.toString());
    print(fixedWidth.toString());
    print(fixedHeight.toString());

    // 将path根据动画进行分段
    var pathMetrics = path.computeMetrics(forceClosed: false);
    var list = pathMetrics.toList();
    var dlength = value * list.length.toInt();
    Path newPath = new Path();
    for (int i = 0; i < dlength; i++) {
      var extractPath =
          list[i].extractPath(0, list[i].length * value, startWithMoveTo: true);
      newPath.addPath(extractPath, Offset(0, 0));
      
    }
    //canvas.save();
    canvas.drawPath(newPath, paint);
    // canvas.clipRect(
    //   Rect.fromLTWH(
    //     startX.toDouble(),
    //     endY.toDouble(),
    //     fixedWidth,
    //     fixedHeight,
    //   ),
    // );
    // canvas.restore();
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
  double value;
  List<Point> dataList;

  @override
  Widget build(BuildContext context) {
    //绘制Wight

    return CustomPaint(
      size: Size(100, 300),
      painter: DemoPainter(
          chatBeans: [Point(y: 50.0), Point(y: 70.0), Point(y: 80.0),Point(y: 40.0),Point(y: 30.0),Point(y: 80.0),Point(y: 20.0),Point(y: 10.0),Point(y: 80.0),Point(y: 40.0),Point(y: 30.0),Point(y: 80.0),Point(y: 20.0),], value: _controller.value),
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
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 4000))
          ..repeat()
          ..addListener(() {
            setState(() {});
          });
    // _controller = AnimationController(
    //     vsync: this, duration: Duration(milliseconds: 2000));
    // Tween(
    //         begin: 0.0,
    //         end: 1.0)
    //     .animate(_controller)
    //       ..addStatusListener((status) {
    //         if (status == AnimationStatus.completed) {
    //           print('绘制完成');
    //         }
    //       })
    //       ..addListener(() {
    //         value = _controller.value; //当前动画值
    //         setState(() {});
    //       });
     _controller.forward();
    super.initState();
  }
}
