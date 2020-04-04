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
    return patientPagesList == null? Container(
            height: 700,
          ):Column(
            children:patientPagesList.map((item) {
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
                buildPatientList()
              ],
            ),
          ),
        ));
  }
}
