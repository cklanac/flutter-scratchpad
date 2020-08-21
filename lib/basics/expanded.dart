import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'Expanded',
    home: ExpandedDemo(),
  ));
}

class ExpandedDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Expanded Demo"),
      ),
      body: Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(
                padding: EdgeInsets.all(30),
                child: Text('1'),
                color: Colors.cyan),
          ),
          Expanded(
            flex: 2,
            child: Container(
                // padding: EdgeInsets.all(30),
                child: Image.asset('assets/firegiphy.gif'),
                color: Colors.blue),
          ),
          Expanded(
            flex: 3,
            child: Container(
                padding: EdgeInsets.all(30),
                child: Text('3'),
                color: Colors.amber),
          ),
        ],
      ),
    );
  }
}
