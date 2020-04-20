import 'package:flutter/material.dart';
//import 'package:hello_world2/page/BottomNavigation.dart';
import 'package:hello_world2/page/global.dart';
import 'package:hello_world2/page/patient/ECG_Wight.dart';
//import 'package:hello_world2/page/home.dart';
//import 'package:hello_world2/page/loading.dart';
import 'package:hello_world2/page/patient/monitor.dart';
import 'package:jpush_flutter/jpush_flutter.dart';

import 'page/patient/ECG_Wight2.dart';
//先初始化全局配置
void main() => Global.init().then((e)=> runApp(MyApp()));

class MyApp extends StatelessWidget {
  final JPush jPush = JPush();

  Future<void> initPlatformState() async {
    jPush.setup(
      appKey: "2e654225e8e90a9cfba2c663",
      channel: "developer-default",
      production: false,
      debug: true,
    );  
  }


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    initPlatformState();
    return new MaterialApp(
      home: Test(),
      initialRoute: '/Monitor',
      routes: {
        //'/':(context) => new Home(),
        //'/Change':(context) => new BottomNavigation(),
        //'/Loading':(context) => new Loading(),
        '/Monitor':(context) => new Monitor(),
      },
    );
  }
}
