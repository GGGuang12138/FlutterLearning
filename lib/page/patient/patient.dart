import 'package:flutter/material.dart';
import 'package:hello_world2/entity/entitys.dart';
import 'package:hello_world2/page/patient/patientItem_Wight.dart';
import 'package:hello_world2/service/patient.dart';

class Patient extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new PatientState();
  }
}

class PatientState extends State<Patient> {
  // 病人列表数据
  PatientPagesListResponseEntity patientPagesListResponseEntity;
  List<PatientPagesListResponseEntity> patientPagesList;

  @override
  void initState() {
    super.initState();
    loadAllData();
  }

  // 读取所有数据
  loadAllData() async {
    patientPagesList = await PatientAPI.list();

    if (mounted) {
      setState(() {});
    }
  }

  // 画patient列表
  Widget buildPatientList() {
    return patientPagesList == null
        ? Container(
            height: 700,
          )
        : Column(
            children: patientPagesList.map((item) {
              return Column(
                children: <Widget>[
                  patientItem(item),
                ],
              );
            }).toList(),
          );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('患者检测'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10.0, 8.0, 10.0, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Card(
                  shape: RoundedRectangleBorder(
                    //形状
                    //修改圆角
                    borderRadius: BorderRadius.all(Radius.circular(3)),
                  ),
                  //阴影颜色
                  color: Colors.white,
                  //阴影高度
                  elevation: 4.0,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(5.0, 0, 5.0, 0),
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                          child: Row(
                            children: <Widget>[
                              Container(
                                child: Text(
                                  "新增病人  ",
                                  style: TextStyle(
                                      color: Colors.grey[500],
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                              Text("张小三，65岁，男")
                            ],
                          ),
                        ),
                        Container(
                            padding: EdgeInsets.fromLTRB(2, 0, 2, 0),
                            child: Divider(
                              height: 0,
                              color: Colors.grey[400],
                              thickness: 1.5,
                            )),
                        Row(
                          children: <Widget>[
                            Container(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(8, 0, 28, 5),
                                    child: IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        IconData(0xe606,
                                            fontFamily: 'iconfont'),
                                        size: 40,
                                        color: Colors.blue,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(5, 0, 12, 0),
                                    child: Text(
                                      "查看详情",
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: 80,
                              width: 230,
                              alignment: Alignment.topLeft,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Text("病情描述：",style: TextStyle(color: Colors.grey),),
                                  Text("咳嗽")
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(8, 5, 0, 0),
                  child: Text(
                    "住院病人",
                    style: TextStyle(
                        color: Colors.grey[500],
                        fontSize: 15,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                // 画patient列表
                buildPatientList()
              ],
            ),
          ),
        ));
  }
}
