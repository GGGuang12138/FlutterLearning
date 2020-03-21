import 'dart:convert';

import 'package:date_format/date_format.dart';
import 'package:http/http.dart';

class Time{
  String location;
  String time;
  String flag;
  String url;
  Time({this.location,this.flag,this.url});

  Future<void> getData() async{

    try {
    Response response = await get('http://worldtimeapi.org/api/timezone/$url');
    Map data = jsonDecode(response.body);
    String datetime = data['datetime'];
    String offset = data['utc_offset'];
    DateTime now = DateTime.parse(datetime);//获取时间需加上offset
    int hour = int.parse(offset.substring(0,3));
    now = now.add(Duration(hours:hour));
    time = formatDate(now, [hh,':',mm,' ',am]);
    } catch (e) {
      print("Caught error:$e");
      time="Could not get time!";
    }
    

  }

}