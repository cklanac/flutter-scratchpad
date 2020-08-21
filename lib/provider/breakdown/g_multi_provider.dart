import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// - Pressing the first “Do something” button will change the “Hello” to “Goodbye”. Pressing the second “Do something” button will change the “0” to “5”.
// - There isn’t much different between this and the single ChangeNotifierProvider. The way that the different Consumers get the right model is by the type they indicate. That is, Consumer<MyModel> gets MyModel, and Consumer<AnotherModel> gets AnotherModel.
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // MultiProvider
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<MyModel>(create: (context) => MyModel()),
        ChangeNotifierProvider<AnotherModel>(
            create: (context) => AnotherModel()),
      ],
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(title: Text('Multi-Provider')),
          body: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                      padding: const EdgeInsets.all(20),
                      color: Colors.green[200],
                      // MyModel Consumer
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
                    // MyModel Consumer
                    child: Consumer<MyModel>(
                      builder: (context, myModel, child) {
                        return Text(myModel.someValue);
                      },
                    ),
                  ),
                ],
              ),

              // SizedBox(height: 5),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                      padding: const EdgeInsets.all(20),
                      color: Colors.red[200],
                      // AnotherModel Consumer
                      child: Consumer<AnotherModel>(
                        builder: (context, myModel, child) {
                          return RaisedButton(
                            child: Text('Do something'),
                            onPressed: () {
                              myModel.doSomething();
                            },
                          );
                        },
                      )),
                  Container(
                    padding: const EdgeInsets.all(35),
                    color: Colors.yellow[200],
                    // AnotherModel Consumer
                    child: Consumer<AnotherModel>(
                      builder: (context, anotherModel, child) {
                        return Text('${anotherModel.someValue}');
                      },
                    ),
                  ),
                ],
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

// AnotherModel
class AnotherModel with ChangeNotifier {
  int someValue = 0;
  void doSomething() {
    someValue = 5;
    print(someValue);
    notifyListeners();
  }
}
