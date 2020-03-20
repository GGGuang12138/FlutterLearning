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
      backgroundColor: Colors.grey[200],
      // appBar: AppBar(
      //   title: Text(
      //     'My First Flutter App',
      //     style: TextStyle(color: Colors.grey[900]),
      //   ),
      //   centerTitle: true,
      //   backgroundColor: Colors.grey[200],
      // ),
      body: Container(
        padding: EdgeInsets.fromLTRB(30, 80, 30, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/anzhuo.png'),
                radius: 70,
                backgroundColor: Colors.grey[300],
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
              height: 10,
            ),
            Text(
              'favorite',
              style: TextStyle(color: Colors.grey, letterSpacing: 2),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Coding',
              style: TextStyle(
                  color: Colors.black, letterSpacing: 2, fontSize: 28),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Icon(Icons.email, color: Colors.green[600]),
                SizedBox(width: 5),
                Text(
                  'ggguang12138@icloud.com',
                  style: TextStyle(
                      color: Colors.grey[700], fontSize: 18, letterSpacing: 0.5),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
