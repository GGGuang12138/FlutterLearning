import 'package:flutter/material.dart';

class Change extends StatefulWidget {
  const Change({
    Key key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ChangeState();
}

class _ChangeState extends State<Change> {
  int counter = 0;
  void getData() async {
    String username = await Future.delayed(Duration(seconds:10),(){
      return  'gg';
    });
    print('username = $username');

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: Text("我是页面"),
      ),
      body: Container(
        margin: EdgeInsets.fromLTRB(5, 5, 0, 0),
        child: RaisedButton(
          color: Colors.grey[50],
          onPressed: () {
            counter++;
          },
          child: Text('$counter'),
        ),
      ),
    );
  }

  @override
  void dispose() {
    print("dispose is called");
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    print("inintState is called");
    getData();
    print("叫人去拿名字了");
  }
}
