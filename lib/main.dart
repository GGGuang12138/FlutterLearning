import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Home(),
    );


  }
}

class Home extends StatelessWidget {
  const Home({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My First Flutter App'),
        centerTitle: true,
        backgroundColor: Colors.red[300],
      ),
      body: Center(
        child: Text('hello world',
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.w500,//字体粗细
            letterSpacing: 3,
          ),
        ),
        
      ),
      floatingActionButton: FloatingActionButton(
        child: Text('Button'),
        onPressed: (){
          print('test');
        },
      ),
    );
  }
}


