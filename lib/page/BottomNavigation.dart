import 'package:flutter/material.dart';
import 'package:hello_world2/page/doctor/doctor.dart';
import 'package:hello_world2/page/patient/patient.dart';
import 'package:hello_world2/page/person/person.dart';

class BottomNavigation extends StatefulWidget {
  BottomNavigation({Key key}) : super(key: key);

  @override
  _BottomNavigationState createState() => _BottomNavigationState();

  
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _currentIndex = 1;
  List<Widget> pages = new List();
  //初始化时将图标形成
  @override
  void initState() {
    pages..add(Patient())..add(Doctor())..add(Person());
    super.initState();
    
  }
  //界面代码
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                  IconData(0xe603,fontFamily: 'iconfont'),size:20,
                ),
              title: new Text(
                '患者监测',
              )),
          BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 4, 0),
                child: Icon(
                  IconData(0xe601,fontFamily: 'iconfont'),size:20,
                ),
              ),
              title: new Text(
                '远程会诊',
              )),
          BottomNavigationBarItem(
              icon: Icon(
                  IconData(0xe602,fontFamily: 'iconfont'),size:20,
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
