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
        child: Image(
          image: AssetImage('assets/anzhuo.png'),)  //本地Image
        // child: Image.network("https://www.baidu.com/img/bd_logo1.png") //网络图片
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


