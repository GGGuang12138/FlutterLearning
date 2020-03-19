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
      // body: Row(
      //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //   crossAxisAlignment: CrossAxisAlignment.center,
      //   children: <Widget>[
      //     Text("hello world"),
      //     FlatButton(
      //       onPressed: (){},
      //       color: Colors.amber,
      //       child: Text("click me"),
      //     ),
      //     Container(
      //       color: Colors.amber,
      //       child: Text("box"),
      //       padding: EdgeInsets.all(30),
      //     )
      //   ],
      // ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text('hello')
            ],
          ),
          Container(
            color: Colors.amber,
            padding: EdgeInsets.all(20),
            child: Text("one"),
          ),
          Container(
            color: Colors.cyan,
            padding: EdgeInsets.all(30),
            child: Text("two"),
          )
        ],
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


