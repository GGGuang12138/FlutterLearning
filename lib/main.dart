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
        // child: IconButton(  
        //   onPressed: (){
        //     print('you clicked me');
        //   },
        //   icon: Icon(Icons.account_circle),
        //   color: Colors.blue,
        //   iconSize: 80.0, //图标按钮
        // ),

        // child: RaisedButton.icon(
        //   onPressed: (){
        //     print("you cliced raisedButton");          
        // }, 
        // icon:Icon(Icons.desktop_windows), 
        // color: Colors.lightBlue, 
        // label: Text("lala"),), //字加图标按钮，立体效果

        // child: FlatButton(
        //   child: Text("cliked flatButton"), 
        //   onPressed: () {
        //     print("you clicked flatButton");
        //   },
        //   color: Colors.lightBlue,
        //   ), //字加按钮，没有立体效果

        // child: RaisedButton(
        //   onPressed: (){
        //     print("clicked RaisedButton");
        //   },
        //   child: Text("click me"),
        //   color: Colors.blue,
        // ),// 字加按钮，立体效果
        child: Icon(
          Icons.airport_shuttle,
          size:100,
          color: Colors.blue
        ),//普通icon




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


