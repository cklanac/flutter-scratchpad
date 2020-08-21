import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// WORKS BUT BOTH THE BUTTON AND RESULT CONTAINERS REBUILD
// - Now the UI updtes when clicking "Do something"
// - In most apps your model class will be in its own file and you’ll need to import flutter/foundation.dart in order to use ChangeNotifier. I’m not really a fan of that because that means your business logic now has a dependency on the framework, and the framework is a detail. But I’m willing to live with it for now.
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
                // Consumer
                child: Consumer<MyModel>(
                  builder: (context, myModel, child) {
                    return RaisedButton(
                      child: Text('Do something'),
                      onPressed: () {
                        myModel.doSomething();
                      },
                    );
                  },
                ),
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
