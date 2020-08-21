import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'Containers',
    home: ContainerDemos(),
  ));
}

class ContainerDemos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Container, Padding, Center Demo"),
      ),
      body: Center(
        child: ListView(
          children: [
            Container(
              child: Text('Container Padding: EdgeInsets.all'),
              padding: EdgeInsets.all(10),
              color: Colors.red[100],
            ),
            Container(
              child: Text('Container Padding: EdgeInsets.symmetric'),
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 40),
              color: Colors.green[100],
            ),
            Container(
              child: Text('Container Padding: EdgeInsets.symmetric.fromLTRB'),
              padding: EdgeInsets.fromLTRB(10, 20, 30, 40),
              color: Colors.blue[100],
            ),
            Container(
              child: Text('Container Padding & Margin: EdgeInsets.symmetric'),
              margin: EdgeInsets.symmetric(horizontal: 30.0, vertical: 20),
              padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 20),
              color: Colors.green[100],
            ),
            Padding(
              child: Text('Padding Widget EdgeInsets.symmetric'),
              // No margin or color
              padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 20),
            ),
            Center(
              child: Text('Padding Widget EdgeInsets.symmetric'),
            ),
          ],
        ),
      ),
    );
  }
}
