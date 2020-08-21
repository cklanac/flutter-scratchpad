import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'Rows Basics',
    home: RowsDemo(),
  ));
}

class RowsDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Row Demo"),
      ),
      body: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          // center, end, spaceAround, spaceBetween, spaceEvenly, start, values
          crossAxisAlignment: CrossAxisAlignment.center,
          // baseline, center, end, start, stretch, values

          children: [
            FlatButton(
                onPressed: () {}, child: Text('Row'), color: Colors.amber),
            FlatButton(
                onPressed: () {}, child: Text('with'), color: Colors.amber),
            FlatButton(
                onPressed: () {}, child: Text('Axis'), color: Colors.amber),
            FlatButton(
                onPressed: () {}, child: Text('demo'), color: Colors.amber),
          ]),
    );
  }
}
