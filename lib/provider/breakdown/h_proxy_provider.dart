import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// -The text starts of saying “Hello”.
// -When you press the “Do something” button, this has MyModel change the text to “Goodbye”. MyModel notifies its listener (ChangeNotifierProvider) and the UI gets rebuilt with the new text.
// -When you press the “Do something else” button, AnotherModel takes MyModel (that was injected by the ProxyProvider) and changes its text to “See you later”. Because MyModel notifies its listeners of changes, the UI again gets updated. If AnotherModel had its own data that got changed, the UI would not be updated because ProxyProvider does not listen for changes. You would need a ChangeNotifierProxyProvider for that.
// -ProxyProvider was sufficiently confusing for me. ChangeNotifierProxyProvider has even more special caveats and warnings. For that reason I am not going to add an example for it at this time. You can check out the documentation, though.
// -I am in agreement with FilledStacks that the GetIt package is an easier way to handle dependency injection than ProxyProvider.
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // MultiProvider
    return MultiProvider(
      providers: [
        // ChangeNotifierProvider
        ChangeNotifierProvider<MyModel>(
          create: (context) => MyModel(),
        ),
        // ProxyProvider
        ProxyProvider<MyModel, AnotherModel>(
          update: (context, myModel, anotherModel) => AnotherModel(myModel),
        ),
      ],
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(title: Text('Proxy Provider')),
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
                              myModel.doSomething('Goodbye');
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
              Container(
                  padding: const EdgeInsets.all(20),
                  color: Colors.red[200],
                  // AnotherModel Consumer
                  child: Consumer<AnotherModel>(
                    builder: (context, anotherModel, child) {
                      return RaisedButton(
                        child: Text('Do something else'),
                        onPressed: () {
                          anotherModel.doSomethingElse();
                        },
                      );
                    },
                  )),
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
  void doSomething(String value) {
    someValue = value;
    print(someValue);
    notifyListeners();
  }
}

// AnotherModel
class AnotherModel {
  MyModel _myModel;
  AnotherModel(this._myModel);
  void doSomethingElse() {
    _myModel.doSomething('See you later');
    print('doing something else');
  }
}
