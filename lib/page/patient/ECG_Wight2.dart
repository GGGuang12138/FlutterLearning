import 'dart:ui';
import 'package:flutter/material.dart';

// 绘画 LineChartWidget
class DemoPainter extends CustomPainter {
    //折线图的背景颜色
    Color bgColor;
    //x轴与y轴的颜色
    Color xyColor;
    //是否显示x轴与y轴的基准线
    bool showBaseline;
    //实际的数据
    List<ChartData> dataList;
    //x轴之间的间隔
    double columnSpace;
    //表格距离左边的距离
    int paddingLeft;
    //表格距离顶部的距离
    int paddingTop;
    //表格距离底部的距离
    int paddingBottom;
    //绘制x轴、y轴、标记文字的画笔
    Paint linePaint;
    //标记线的长度
    int markLineLength;
    //y轴数据最大值
    int maxYValue;
    //y轴分多少行
    int yCount;
    //折线的颜色
    Color polygonalLineColor;
    //x轴所有内容的偏移量，用来在滑动的时候改变内容的位置
    double xOffset;
    //该值保证最后一条数据的底部文字能正常显示出来
    int paddingRight = 30;
    //内部折线图的实际宽度
    double realChartRectWidth;
    Function xOffsetSet = (double xOffset) {};

    DemoPainter({
     @required this.dataList,
     @required this.maxYValue,
     @required this.yCount,
     @required this.xOffsetSet,
     this.bgColor = Colors.white,
     this.xyColor = Colors.black,
     this.showBaseline = false,
     this.columnSpace,
     this.paddingLeft,
     this.paddingTop,
     this.paddingBottom,
     this.markLineLength,
     this.polygonalLineColor = Colors.blue,
     this.xOffset,
   }) {
     linePaint = Paint()..color = xyColor;
     realChartRectWidth = (dataList.length - 1) * columnSpace;
   }


  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }

  @override
  void paint(Canvas canvas, Size size) {
    //画背景颜色
     canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), Paint()..color = bgColor);
     //创建一个矩形，方便后续绘制
     Rect innerRect = Rect.fromPoints(
       Offset(paddingLeft.toDouble(), paddingTop.toDouble()),
       Offset(size.width, size.height - paddingBottom),
     );
     //画y轴
     canvas.drawLine(innerRect.topLeft, innerRect.bottomLeft.translate(0, markLineLength.toDouble()), linePaint);
     //画x轴
     canvas.drawLine(innerRect.bottomLeft, innerRect.bottomRight, linePaint);
     //画y轴标记
     double ySpace = innerRect.height / yCount;
     double startX = innerRect.topLeft.dx - markLineLength;
     double startY;
     for (int i = 0; i < yCount + 1; i++) {
       startY = innerRect.topLeft.dy + i * ySpace;
       if (showBaseline) {
         canvas.drawLine(
           Offset(innerRect.topLeft.dx - markLineLength, startY),
           Offset(innerRect.topLeft.dx + innerRect.width, startY),
           linePaint,
         );
       } else {
         canvas.drawLine(
           Offset(innerRect.topLeft.dx - markLineLength, startY),
           Offset(innerRect.topLeft.dx, startY),
           linePaint,
         );
       }
       drawYText(
         (i * maxYValue ~/ yCount).toString(),
         Offset(innerRect.topLeft.dx - markLineLength, innerRect.bottomLeft.dy - i * ySpace),
         canvas,
       );
     }
     //保存每个实际数据的值在屏幕中的x、y坐标值
     List<Pair> pointList = [];
     //画x轴标记
     int xCount = dataList.length;
     startY = innerRect.bottom + markLineLength;
     for (int i = 0; i < xCount; i++) {
       startX = innerRect.bottomLeft.dx + i * columnSpace + xOffset;
       if (innerRect.bottomLeft.dx + xOffset < innerRect.left) {
         canvas.save();
         canvas.clipRect(
           Rect.fromLTWH(
             innerRect.left,
             innerRect.top,
             innerRect.width,
             innerRect.height,
           ),
         );
       }
       //保证向右拖动的时候第一个数据保持在起始位置
       if (i == 0 && startX > paddingLeft) {
         startX = innerRect.bottomLeft.dx;
         // 在这里将LineChart的xOffset置为0，否则LineChart向右滑到第一个值的时候继续向右滑动会导致xOffset累加向右拖动的值，
         // 然后会导致向左拖动的时候只能等xOffset等于0的时候UI才会变化，这样看起来就是向左拖动但是UI没有变化
         // 所以这里加此判断
         xOffset = 0;
         xOffsetSet(0.toDouble());
       }
       pointList.add(
         Pair(
           startX,
           //内矩形高度减去数据实际值的实际像素大小，再加上顶部空白的距离
           innerRect.height - dataList[i].value / maxYValue * innerRect.height + paddingTop,
         ),
       );
       if (showBaseline) {
         canvas.drawLine(
           Offset(startX, innerRect.top),
           Offset(startX, startY),
           linePaint,
         );
       } else {
         canvas.drawLine(
           Offset(startX, innerRect.bottom),
           Offset(startX, startY),
           linePaint,
         );
       }
       if (innerRect.bottomLeft.dx + xOffset < innerRect.left) {
         canvas.restore();
       }
       drawXText(
         dataList[i].type,
         Offset(innerRect.bottomLeft.dx + i * columnSpace + xOffset, startY),
         canvas,
       );
     }
     //画折线
     canvas.save();
     canvas.clipRect(
       Rect.fromLTWH(
         paddingLeft.toDouble(),
         paddingTop.toDouble(),
         innerRect.width,
         innerRect.height,
       ),
     );
     canvas.drawPoints(
       ///PointMode的枚举类型有三个，points（点），lines（线，隔点连接），polygon（线，相邻连接）
       PointMode.polygon,
       pointList.map((pair) => Offset(pair.first, pair.last)).toList(),
       Paint()
         ..color = polygonalLineColor
         ..strokeWidth = 2,
     );
     canvas.restore();
   }
   List getTextPainterAndSize(String text) {
     TextPainter textPainter = TextPainter(
       textDirection: TextDirection.ltr,
       text: TextSpan(
         text: text,
         style: TextStyle(color: Colors.black),
       ),
     );
     textPainter.layout();
     Size size = textPainter.size;
     return [textPainter, size];
   }
   void drawYText(String text, Offset topLeftOffset, Canvas canvas) {
     List list = getTextPainterAndSize(text);
     list[0].paint(canvas, topLeftOffset.translate(-list[1].width, -list[1].height / 2));
   }
   void drawXText(String text, Offset topLeftOffset, Canvas canvas) {
     List list = getTextPainterAndSize(text);
     list[0].paint(canvas, topLeftOffset.translate(-list[1].width / 2, 0));
   }

}
class ChartData {
   String type;
   double value;
 
   ChartData(this.type, this.value);
 }
class Pair{
  double first;
  double last;
  Pair(this.first, this.last);
}



//界面
class DemoWidget extends StatefulWidget {
  final double width;
   final double height;
   //柱状图的背景颜色
   final Color bgColor;
   //x轴与y轴的颜色
   final Color xyColor;
   //柱状图的颜色
   final Color columnarColor;
   //是否显示x轴与y轴的基准线
   final bool showBaseline;
   //实际的数据
   final List<ChartData> dataList;
   //每列之间的间隔
   final double columnSpace;
   //控件距离左边的距离
   final int paddingLeft;
   //控件距离顶部的距离
   final int paddingTop;
   //控件距离底部的距离
   final int paddingBottom;
   //标记线的长度
   final int markLineLength;
   //y轴最大值
   final int maxYValue;
   //y轴分多少行
   final int yCount;
   //折线的颜色
   final Color polygonalLineColor;
   //x轴所有内容的偏移量
   final double xOffset;
 
   DemoWidget(
     this.width,
     this.height, {
     @required this.dataList,
     @required this.maxYValue,
     @required this.yCount,
     this.bgColor = Colors.white,
     this.xyColor = Colors.black,
     this.columnarColor = Colors.blue,
     this.showBaseline = false,
     this.columnSpace = 60,
     this.paddingLeft = 40,
     this.paddingTop = 30,
     this.paddingBottom = 30,
     this.markLineLength = 10,
     this.polygonalLineColor = Colors.blue,
     this.xOffset = 0,
   });

  @override
  _DemoWidgetState createState() => _DemoWidgetState();
}

class _DemoWidgetState extends State<DemoWidget>
    with SingleTickerProviderStateMixin {
      double xOffset;
  

  @override
  Widget build(BuildContext context) {
    //绘制Wight
    return GestureDetector(
       onHorizontalDragUpdate: (DragUpdateDetails details) {
 //        print("DragUpdateDetails");
         setState(() {
           xOffset += details.primaryDelta;
         });
       },
       onHorizontalDragDown: (DragDownDetails details){
         print("onHorizontalDragDown");
       },
       onHorizontalDragCancel: (){
         print("onHorizontalDragCancel");
       },
       onHorizontalDragEnd: (DragEndDetails details){
         print("onHorizontalDragEnd");
       },
       onHorizontalDragStart: (DragStartDetails details){
         print("onHorizontalDragStart");
       },
       child: CustomPaint(
         size: Size(widget.width, widget.height),
         painter: DemoPainter(
           bgColor: widget.bgColor,
           xyColor: widget.xyColor,
           showBaseline: widget.showBaseline,
           dataList: widget.dataList,
           maxYValue: widget.maxYValue,
           yCount: widget.yCount,
           columnSpace: widget.columnSpace,
           paddingLeft: widget.paddingLeft,
           paddingTop: widget.paddingTop,
           paddingBottom: widget.paddingBottom,
           markLineLength: widget.markLineLength,
           polygonalLineColor: Colors.blue,
           xOffset: xOffset,
           xOffsetSet: (double xOffset) {
             this.xOffset = xOffset;
           },
         ),
       ),
     );

  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    xOffset = widget.xOffset;
    super.initState();
  }
}
class Test extends StatelessWidget {
   @override
   Widget build(BuildContext context) {
     Size size = MediaQuery.of(context).size;
     return Scaffold(
       appBar: AppBar(
         title: Text("自定义折线图"),
       ),
       body: Container(
         child: DemoWidget(
           size.width,
           300,
 //          bgColor: Colors.red,
           xOffset: 10,
           showBaseline: true,
           maxYValue: 600,
           yCount: 6,
           dataList: [
             ChartData("Data A", 100),
             ChartData("Data B", 300),
             ChartData("Data C", 200),
             ChartData("Data D", 500),
             ChartData("Data E", 450),
             ChartData("Data F", 230),
             ChartData("Data G", 270),
             ChartData("Data H", 170),
           ],
         ),
       ),
     );
   }
 }

