import 'package:flutter/material.dart';
import 'package:hello_world2/page/doctor.dart';
import 'package:hello_world2/page/patient.dart';
import 'package:hello_world2/page/person.dart';

class BottomNavigation extends StatefulWidget {
  BottomNavigation({Key key}) : super(key: key);

  @override
  _BottomNavigationState createState() => _BottomNavigationState();

  
}




  

class _BottomNavigationState extends State<BottomNavigation> {
  int _currentIndex = 1;
  List<Widget> pages = new List();

  @override
  void initState() {
    pages..add(Patient())..add(Doctor())..add(Person());
    super.initState();
    
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              title: new Text(
                '患者监测',
              )),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.business,
              ),
              title: new Text(
                '远程会诊',
              )),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.mood,
              ),
              title: new Text(
                '个人信息',
              )),
        ],
        currentIndex: _currentIndex,
        onTap: (int i) {
          setState(() {
            _currentIndex = i;
          });
        },
      ),
      body: pages[_currentIndex],
    );
  }
}
