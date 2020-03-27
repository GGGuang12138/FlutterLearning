import 'package:flutter/material.dart';

class Doctor extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return new DoctorState();
  }
}

class DoctorState extends State<Doctor>{
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('远程会诊'),
      ),
      body: new Center(
        child: Icon(Icons.mood,size: 130.0,color: Colors.blue,),
      ),
    );
  }
}