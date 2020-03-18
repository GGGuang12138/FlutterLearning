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
      body: Container(
        color: Colors.grey[400],
        child: Text('hello'),
        //padding: EdgeInsets.all(20),
        //padding: EdgeInsets.fromLTRB(10, 20, 30, 40),
        padding: EdgeInsets.symmetric(horizontal:30, vertical:10)
        //margin: EdgeInsets.all(20),     
        //margin: EdgeInsets.fromLTRB(20, 10, 10, 10),
        //margin: EdgeInsets.symmetric(horizontal:30, vertical:10)   


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


