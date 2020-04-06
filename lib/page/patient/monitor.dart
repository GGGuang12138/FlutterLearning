import 'package:charts_flutter/flutter.dart';
import 'package:flutter/material.dart';

class Monitor extends StatefulWidget {
  const Monitor({
    Key key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MonitorState();
}

class Datas {
  final int data;
  final int time;
  Datas(this.time, this.data);
}

class _MonitorState extends State<Monitor> {
  @override
  Widget build(BuildContext context) {
    final data1 = [
      new Datas(1, 10),
      new Datas(2, 2),
      new Datas(3, 2),
      new Datas(4, 4),
      new Datas(5, 15),
    ];
    List<Series<Datas, int>> serieslist = [
      new Series<Datas, int>(
          id: null,
          data: data1,
          colorFn: (_, __) => MaterialPalette.blue.shadeDefault,
          domainFn: (Datas sales, _) => sales.time,
          measureFn: (Datas sales, _) => sales.data),
    ];
    var chart = new LineChart(serieslist,animate: true,);

    return Scaffold(body: Container(
      child: chart,
    ));
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
