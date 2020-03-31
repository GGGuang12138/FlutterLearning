import 'package:flutter/material.dart';

class Patient extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new PatientState();
  }
}

class PatientState extends State<Patient> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('患者检测'),
        ),
        body: 
        SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(18.0, 8.0, 18.0, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  child: Text(
                    "住院病人",
                    style: TextStyle(
                        color: Colors.grey[500],
                        fontSize: 15,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                
                Container(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                  child: Column(
                    children: <Widget>[
                      Container(),
                      Container(
                        child: Divider(
                          height: 10,
                          color: Colors.grey[500],
                          thickness: 2,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text("张小三" + ", " + "男" + "   xx病房xx号床"),
                          Text(
                            "2020年3月2号入院",
                            style: TextStyle(color: Colors.grey),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 28, 10),
                              child: IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  IconData(0xe606, fontFamily: 'iconfont'),
                                  size: 40,
                                  color: Colors.blue,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 28, 10),
                              child: IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  IconData(0xe603, fontFamily: 'iconfont'),
                                  size: 40,
                                  color: Colors.blue,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 28, 10),
                              child: IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  IconData(0xe605, fontFamily: 'iconfont'),
                                  size: 40,
                                  color: Colors.blue,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 28, 10),
                              child: IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  IconData(0xe604, fontFamily: 'iconfont'),
                                  size: 40,
                                  color: Colors.blue,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(15, 0, 27, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              "患者病历",
                              style: TextStyle(color: Colors.grey),
                            ),
                            Text(
                              "检查结果",
                              style: TextStyle(color: Colors.grey),
                            ),
                            Text(
                              "体征监测",
                              style: TextStyle(color: Colors.grey),
                            ),
                            Text(
                              "会诊情况",
                              style: TextStyle(color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                  child: Column(
                    children: <Widget>[
                      Container(),
                      Container(
                        child: Divider(
                          height: 10,
                          color: Colors.grey[500],
                          thickness: 2,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text("张小三" + ", " + "男" + "   xx病房xx号床"),
                          Text(
                            "2020年3月2号入院",
                            style: TextStyle(color: Colors.grey),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 28, 10),
                              child: IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  IconData(0xe606, fontFamily: 'iconfont'),
                                  size: 40,
                                  color: Colors.blue,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 28, 10),
                              child: IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  IconData(0xe603, fontFamily: 'iconfont'),
                                  size: 40,
                                  color: Colors.blue,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 28, 10),
                              child: IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  IconData(0xe605, fontFamily: 'iconfont'),
                                  size: 40,
                                  color: Colors.blue,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 28, 10),
                              child: IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  IconData(0xe604, fontFamily: 'iconfont'),
                                  size: 40,
                                  color: Colors.blue,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(15, 0, 27, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              "患者病历",
                              style: TextStyle(color: Colors.grey),
                            ),
                            Text(
                              "检查结果",
                              style: TextStyle(color: Colors.grey),
                            ),
                            Text(
                              "体征监测",
                              style: TextStyle(color: Colors.grey),
                            ),
                            Text(
                              "会诊情况",
                              style: TextStyle(color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                  child: Column(
                    children: <Widget>[
                      Container(),
                      Container(
                        child: Divider(
                          height: 10,
                          color: Colors.grey[500],
                          thickness: 2,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text("张小三" + ", " + "男" + "   xx病房xx号床"),
                          Text(
                            "2020年3月2号入院",
                            style: TextStyle(color: Colors.grey),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 28, 10),
                              child: IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  IconData(0xe606, fontFamily: 'iconfont'),
                                  size: 40,
                                  color: Colors.blue,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 28, 10),
                              child: IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  IconData(0xe603, fontFamily: 'iconfont'),
                                  size: 40,
                                  color: Colors.blue,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 28, 10),
                              child: IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  IconData(0xe605, fontFamily: 'iconfont'),
                                  size: 40,
                                  color: Colors.blue,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 28, 10),
                              child: IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  IconData(0xe604, fontFamily: 'iconfont'),
                                  size: 40,
                                  color: Colors.blue,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(15, 0, 27, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              "患者病历",
                              style: TextStyle(color: Colors.grey),
                            ),
                            Text(
                              "检查结果",
                              style: TextStyle(color: Colors.grey),
                            ),
                            Text(
                              "体征监测",
                              style: TextStyle(color: Colors.grey),
                            ),
                            Text(
                              "会诊情况",
                              style: TextStyle(color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                  child: Column(
                    children: <Widget>[
                      Container(),
                      Container(
                        child: Divider(
                          height: 10,
                          color: Colors.grey[500],
                          thickness: 2,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text("张小三" + ", " + "男" + "   xx病房xx号床"),
                          Text(
                            "2020年3月2号入院",
                            style: TextStyle(color: Colors.grey),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 28, 10),
                              child: IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  IconData(0xe606, fontFamily: 'iconfont'),
                                  size: 40,
                                  color: Colors.blue,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 28, 10),
                              child: IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  IconData(0xe603, fontFamily: 'iconfont'),
                                  size: 40,
                                  color: Colors.blue,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 28, 10),
                              child: IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  IconData(0xe605, fontFamily: 'iconfont'),
                                  size: 40,
                                  color: Colors.blue,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 28, 10),
                              child: IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  IconData(0xe604, fontFamily: 'iconfont'),
                                  size: 40,
                                  color: Colors.blue,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(15, 0, 27, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              "患者病历",
                              style: TextStyle(color: Colors.grey),
                            ),
                            Text(
                              "检查结果",
                              style: TextStyle(color: Colors.grey),
                            ),
                            Text(
                              "体征监测",
                              style: TextStyle(color: Colors.grey),
                            ),
                            Text(
                              "会诊情况",
                              style: TextStyle(color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
