import 'package:flutter/material.dart';
import 'package:hello_world2/page/patient/ECG_Wight.dart';
import 'dart:math' as math;

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
        body: Container(
      child: DemoWidget(),
      height: 200.0,
      width: 200.0,
      color: Colors.deepOrange,
      padding: EdgeInsets.all(30.0),
    ));
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
