import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hello_world2/model/Quote.dart';

class QuoteCard extends StatelessWidget {
  const QuoteCard({
    Key key,
    @required this.quot,
  }) : super(key: key);

  final Quote quot;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.fromLTRB(16, 16, 16, 0),
      child: Container(
        padding: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              quot.text,
              style:TextStyle(
                fontSize:20,
                color:Colors.grey[900]
              )
            ),
            SizedBox(height:6.0),
            Text(
              quot.author,
              style: TextStyle(
                fontSize: 15,
                color: Colors.grey[600]
              ),
            )
          ],
        ),
      ),
    );
  }
}
