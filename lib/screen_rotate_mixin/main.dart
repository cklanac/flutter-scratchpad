import 'package:flutter/material.dart';

import 'horiz_screen.dart';
import 'rotate_mixin.dart';

void main() {
  runApp(MaterialApp(
    title: 'Navigation Basics',
    home: Home(),
  ));
}

class Home extends StatelessWidget with PortraitModeMixin {
  const Home();

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
        appBar: AppBar(
          title: Text('Home'),
        ),
        body: ListView(
          padding: const EdgeInsets.all(8),
          children: [
            ListTile(
              title: Text('Icons and Buttons'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HorzScreen()),
                );
              },
            ),
          ],
        ));
  }
}
