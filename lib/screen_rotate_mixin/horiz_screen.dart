import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HorzScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    return Scaffold(
      appBar: AppBar(
        title: Text("Icons and Buttons Demo"),
      ),
      body: Center(
          child: ListView(children: [
        Icon(Icons.panorama_horizontal, color: Colors.blue, size: 350),
      ])),
    );
  }
}
