import 'package:flutter/material.dart';

class Patient extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return new PatientState();
  }
}

class PatientState extends State<Patient>{
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('患者检测'),
      ),
      body: new Center(
        child: Icon(Icons.mood,size: 130.0,color: Colors.blue,),
      ),
    );
  }
}