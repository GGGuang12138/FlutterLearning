import 'package:flutter/material.dart';
import 'package:hello_world2/service/time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({
    Key key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void getData() async {
    Time time = Time(location:"Shanghai",url:'Asia/Shanghai',flag:'');
    await time.getData();
    Navigator.pushReplacementNamed(context, '/Change',arguments: {
      'location':time.location,
      'time':time.time,
      'flag':time.flag
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitFoldingCube(
          color: Colors.blue,
          size: 50.0,
        )
      )
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
