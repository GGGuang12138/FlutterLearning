import 'package:flutter/material.dart';

class Person extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return new PersonState();
  }
}

class PersonState extends State<Person>{
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('个人'),
      ),
      body: new Center(
        child: Icon(Icons.mood,size: 130.0,color: Colors.blue,),
      ),
    );
  }
}