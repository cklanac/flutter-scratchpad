// https://coflutter.com/flutter-how-to-show-dialog/
// https://stackoverflow.com/questions/51219330/flutter-run-function-after-showdialog-is-dismissed/51220117

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Coflutter'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ShowAlertDialog(),
          ],
        ),
      ),
    );
  }
}

class ShowAlertDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: () async {
        final result = await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Are you sure?'),
            content: Text('Do you want to remove item?'),
            actions: <Widget>[
              FlatButton(
                onPressed: () => Navigator.of(context).pop('NO'),
                child: Text('NO'),
              ),
              FlatButton(
                onPressed: () => Navigator.of(context).pop('YES'),
                child: Text('YES'),
              )
            ],
          ),
        );
        print('Result: ' + result.toString());
        Scaffold.of(context)
          ..removeCurrentSnackBar()
          ..showSnackBar(SnackBar(content: Text("$result")));
      },
      child: Text('Show Alert Dialog'),
    );
  }
}
