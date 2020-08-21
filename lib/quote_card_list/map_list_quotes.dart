import 'package:flutter/material.dart';
import 'quote_class.dart';

void main() => runApp(
      MaterialApp(
        title: 'Quote List',
        home: QuoteList(),
      ),
    );

class QuoteList extends StatefulWidget {
  @override
  _QuoteListState createState() => _QuoteListState();
}

class _QuoteListState extends State<QuoteList> {
  //  List<String> quotes = [
  //    'Be yourself; everyone else is already taken',
  //    'I have nothing to declare except my genius',
  //    'The truth is rarely pure and never simple'
  //  ];

  List<Quote> quotes = [
    Quote(
        author: 'Oscar Wilde',
        text: 'Be yourself; everyone else is already taken'),
    Quote(
        author: 'Oscar Wilde',
        text: 'I have nothing to declare except my genius'),
    Quote(
        author: 'Oscar Wilde',
        text: 'The truth is rarely pure and never simple')
  ];

  String myVar = 'FooBar';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text('Awesome Quotes'),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
      ),
      body: Column(
        // Not the difference between variable and object properties
        children: quotes
            .map(
              (quote) => Text('$myVar: ${quote.text} - ${quote.author}'),
            )
            .toList(),
      ),
    );
  }
}
