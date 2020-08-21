import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'Columns Basics',
    home: ColsDemo(),
  ));
}

class ColsDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Column Demo"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        // center, end, spaceAround, spaceBetween, spaceEvenly, start, values
        crossAxisAlignment: CrossAxisAlignment.center,
        // baseline, center, end, start, stretch, values

        children: [
          FlatButton(
              onPressed: () {}, child: Text('Column'), color: Colors.amber),
          FlatButton(
              onPressed: () {}, child: Text('with'), color: Colors.amber),
          FlatButton(
              onPressed: () {}, child: Text('Axis'), color: Colors.amber),
          FlatButton(
              onPressed: () {}, child: Text('demo'), color: Colors.amber),
        ],
      ),
    );
  }
}
