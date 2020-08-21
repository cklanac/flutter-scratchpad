import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// DOES NOT WORK
// - The UI was built with the “Hello” text that came from the model.
// - Pressing the “Do something” button will cause an event to happen on the model. However, even though the model’s data got changed, the UI wasn’t rebuilt because the Provider widget doesn’t listen for changes in the values it provides.
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Provider
    return Provider<MyModel>(
      create: (context) => MyModel(),
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(title: Text('Provider Consumer')),
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
                          // We have access to the model.
                          myModel.doSomething();
                        },
                      );
                    },
                  )),
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
class MyModel {
  String someValue = 'Hello';
  void doSomething() {
    someValue = 'Goodbye';
    print(someValue);
  }
}
