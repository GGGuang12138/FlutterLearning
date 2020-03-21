import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class Loading extends StatefulWidget {
  const Loading({
    Key key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  int counter = 0;
  void getData() async {
    Response response = await get('https://jsonplaceholder.typicode.com/todos/1');
    Map data = jsonDecode(response.body);
    print(data);
    print(data['title']);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
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
    getData();
   
  }
}
