
import 'package:flutter/material.dart';
import 'package:hello_world2/service/time.dart';

class Change extends StatefulWidget {
  const Change({
    Key key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ChangeState();
}

class _ChangeState extends State<Change> {
  String timeString = 'Loading...';
  void getData() async {
    Time time = Time(location:"Shanghai",url:'Asia/Shanghai',flag:'');
    await time.getData();
    setState(() {
      timeString = time.time;
    });
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
            getData();
          },
          child: Text('$timeString'),
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
    
  }
}
