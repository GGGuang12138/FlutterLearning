import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:hello_world2/entity/patient.dart';

Widget patientItem(PatientPagesListResponseEntity item) {
  return Container(
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
            Text(item.patientName +
                ", " +
                (item.patientGender == 0 ? "女" : "男") +
                "  " +
                item.patientWard.toString() +
                "号病房" +
                item.patientBed.toString() +
                "号床"),
            Text(
              formatDate(item.patientDate,[mm,'月',dd,'日',' ',HH,'点'])+"入院",
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
  );
}
