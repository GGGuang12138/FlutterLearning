import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First Flutter App'),
          centerTitle: true,
        ),
        body: Center(
          child: Text('hello world'),
        ),
        floatingActionButton: FloatingActionButton(
          child: Text('Button'),
          onPressed: (){
            print('test');
          },
        ),
      ),
    );


  }
}

