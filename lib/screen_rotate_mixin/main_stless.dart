import 'package:flutter/material.dart';

import 'rotate_mixin.dart';

void main() {
  runApp(MaterialApp(
    title: 'Navigation Basics',
    home: Home(),
  ));
}

class Home extends StatelessWidget with HorizontalModeMixin {
  const Home();

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return MaterialApp(
      title: 'Flutter Demo',
      home: Text("Block screen rotation example"),
    );
  }
}
