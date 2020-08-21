import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// WORKS AND NOW ONLY THE RESULT CONTAINER REBUILDS
// - The Consumer widget rebuilds any widgets below it whenever notifyListeners() gets called. The button doesn’t need to get updated, though, so rather than using a Consumer, you can use Provider.of and set the listener to false. That way the button won’t be rebuilt when there are changes. Here is the button extracted into its own widget:
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ChangeNotifierProvider
    return ChangeNotifierProvider<MyModel>(
      create: (context) => MyModel(),
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(title: Text('Change Notifier Provider')),
          body: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.all(20),
                color: Colors.green[200],
                child: MyButton(),
                // Consumer
                // child: Consumer<MyModel>(
                //   builder: (context, myModel, child) {
                //     return RaisedButton(
                //       child: Text('Do something'),
                //       onPressed: () {
                //         myModel.doSomething();
                //       },
                //     );
                //   },
                // ),
              ),
              Container(
                padding: const EdgeInsets.all(35),
                color: Colors.blue[200],
                // Consumer
                child: Consumer<MyModel>(
                  builder: (context, myModel, child) {
                    return Text(myModel.someValue);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// MyModel
class MyModel with ChangeNotifier {
  String someValue = 'Hello';

  void doSomething() {
    someValue = 'Goodbye';
    print(someValue);
    notifyListeners();
  }
}

class MyButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final myModel = Provider.of<MyModel>(context, listen: false);
    return RaisedButton(
      child: Text('Do something'),
      onPressed: () {
        myModel.doSomething();
      },
    );
  }
}
