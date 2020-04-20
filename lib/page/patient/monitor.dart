import 'package:flutter/material.dart';
import 'package:hello_world2/page/patient/ECG_Wight.dart';
//import 'dart:math' as math;

class Monitor extends StatefulWidget {
  const Monitor({
    Key key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MonitorState();
}

class _MonitorState extends State<Monitor> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Container(
              height: 150,
              width: 350,
              child: Card(
                  shape: RoundedRectangleBorder(
                    //形状
                    //修改圆角
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                  //背景颜色
                  color: Colors.grey[50],
                  //阴影高度
                  elevation: 2.0,
                  
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: DemoWidget(),
                    ),
                  )),
            )));
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }
}
