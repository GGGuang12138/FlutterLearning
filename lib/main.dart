import 'package:flutter/material.dart';
import 'package:hello_world2/page/change.dart';
import 'package:hello_world2/page/home.dart';
import 'package:hello_world2/page/loading.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      initialRoute: '/',
      routes: {
        '/':(context) => new Home(),
        '/Change':(context) => new Change(),
        '/Loading':(context) => new Loading(),
      },
    );
  }
}
