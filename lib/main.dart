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

class Home extends StatefulWidget {
  const Home({
    Key key,
  }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int level = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {//刷新界面
            level += 1;
          });
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.grey[500],
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(40, 80, 40, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/anzhuo.png'),
                radius: 40,
                backgroundColor: Colors.grey[200],
              ),
            ),
            Divider(
              height: 60,
              color: Colors.grey[600],
              thickness: 2,
            ),
            Text(
              'NAME',
              style: TextStyle(color: Colors.grey, letterSpacing: 2),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'GG Chen',
              style: TextStyle(
                color: Colors.black,
                letterSpacing: 2,
                fontSize: 28,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'level',
              style: TextStyle(color: Colors.grey, letterSpacing: 2),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              '$level',
              style: TextStyle(
                  color: Colors.black, letterSpacing: 2, fontSize: 28),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Icon(Icons.email, color: Colors.green[600]),
                SizedBox(width: 5),
                Text(
                  'ggguang12138@icloud.com',
                  style: TextStyle(
                      color: Colors.grey[700],
                      fontSize: 18,
                      letterSpacing: 0.5),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
