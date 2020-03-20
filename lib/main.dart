import 'package:flutter/material.dart';
import 'package:hello_world2/model/Quote.dart';
import 'package:hello_world2/widget/QuoteCard.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({
    Key key,
  }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Quote> quotes = [
    Quote(text: 'quote1', author: 'author1'),
    Quote(text: 'quote2', author: 'author2'),
    Quote(text: 'quote3', author: 'author3'),
    Quote(text: 'quote4', author: 'author4'),
    Quote(text: 'quote5', author: 'author5'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("app"),
      ),
      body: Container(
        child: Column(
        children: quotes.map((quote){
          return QuoteCard(quot: quote,delete: (){
            setState(() {
              quotes.remove(quote);
            });
          },);
        }).toList(),
    ),
      ),
    );
  }
}

