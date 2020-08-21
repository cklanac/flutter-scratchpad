import 'package:flutter/material.dart';
import 'quote_card_class.dart';
import 'quote_class.dart';

void main() => runApp(
      MaterialApp(
        title: 'Quote Card List',
        home: QuoteCardClassList(),
      ),
    );

class QuoteCardClassList extends StatefulWidget {
  @override
  _QuoteCardClassListState createState() => _QuoteCardClassListState();
}

class _QuoteCardClassListState extends State<QuoteCardClassList> {
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
        children: quotes
            .map(
              (quote) => QuoteCard(
                  quote: quote,
                  delete: () {
                    setState(() {
                      quotes.remove(quote);
                    });
                  }),
            )
            .toList(),
      ),
    );
  }
}
