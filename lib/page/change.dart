import 'package:flutter/material.dart';

class Change extends StatefulWidget {
  const Change({
    Key key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ChangeState();
}

class _ChangeState extends State<Change> {
  Map data = {};
  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      body: Container(
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/me.jpeg'), fit: BoxFit.cover)),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
            child: Column(
              children: <Widget>[
                FlatButton.icon(
                    onPressed: () {},
                    icon: Stack(
                      children: <Widget>[
                        Positioned(
                          //增加阴影
                          left: 1.0,
                          top: 2.0,
                          child: Icon(
                            Icons.edit_location,
                            color: Colors.white,
                          ),
                        ),
                        Icon(
                          Icons.edit_location,
                          color: Colors.black,
                        )
                      ],
                    ),
                    label: Text(
                      'Edit Location',
                      style: TextStyle(shadows: [
                        Shadow(
                            offset: Offset(2.0, 2.0),
                            blurRadius: 3.0,
                            color: Colors.white)
                      ]),
                    )),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      data['location'],
                      style: TextStyle(
                          fontSize: 28,
                          letterSpacing: 2,
                          shadows: [
                            Shadow(
                                offset: Offset(2.0, 2.0),
                                blurRadius: 3.0,
                                color: Colors.white)
                          ]),
                    )
                  ],
                ),
                SizedBox(height: 20),
                Text(
                  data['time'],
                  style: TextStyle(fontSize: 66, letterSpacing: 2, shadows: [
                    Shadow(
                        offset: Offset(2.0, 2.0),
                        blurRadius: 3.0,
                        color: Colors.white)
                  ]),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }
}
