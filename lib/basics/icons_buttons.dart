import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'Icons and Buttons',
    home: IconButtonDemos(),
  ));
}

class IconButtonDemos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Icons and Buttons Demo"),
      ),
      body: Center(
        child: ListView(
          children: [
            Icon(Icons.face),
            Icon(Icons.face, color: Colors.blue, size: 50),
            IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {
                  print('clicked');
                },
                color: Colors.red),
            RaisedButton(
              onPressed: () {
                print('clicked');
              },
              child: Text('Raised Button'),
              color: Colors.amber,
            ),
            FlatButton(
              onPressed: () {
                print('clicked');
              },
              child: Text('Flat Button'),
              color: Colors.lightBlue,
            ),
            RaisedButton.icon(
              onPressed: () {
                print('clicked');
              },
              icon: Icon(Icons.mail),
              label: Text('Button with icon'),
              color: Colors.lightGreen,
            ),
          ],
        ),
      ),
    );
  }
}
