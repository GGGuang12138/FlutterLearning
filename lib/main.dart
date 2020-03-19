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
      body: Row(children: <Widget>[
        Expanded(
          flex: 1,
          child: Container(
            child: Image.asset('assets/anzhuo.png'),
            color: Colors.red[50],
          ),
        ),
        Expanded(
          flex: 2,
          child: Container(
            child: Text("one"),
            padding: EdgeInsets.all(30),
            color: Colors.red[100],
          ),
        ),
        Container(
          child: Text("two"),
          padding: EdgeInsets.all(40),
          color: Colors.red[200],
        )
      ]),
      floatingActionButton: FloatingActionButton(
        child: Text('Button'),
        onPressed: () {
          print('test');
        },
      ),
    );
  }
}
