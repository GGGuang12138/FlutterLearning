import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hello_world2/model/Quote.dart';

class QuoteCard extends StatelessWidget {
  const QuoteCard({this.quot, this.delete});
  final Quote quot;
  final Function delete;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.fromLTRB(16, 16, 16, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Text(quot.text,
                      style: TextStyle(fontSize: 20, color: Colors.grey[900])),
                  SizedBox(height: 10.0),
                  Text(
                    quot.author,
                    style: TextStyle(fontSize: 15, color: Colors.grey[600]),
                  )
                ],
              ),
            ),
          ),
          
          Expanded(
            flex: 1,
            child: FlatButton.icon(
                onPressed: delete,
                icon: Icon(Icons.delete),
                label: Text('Delete')),
          ),
        ],
      ),
    );
  }
}
