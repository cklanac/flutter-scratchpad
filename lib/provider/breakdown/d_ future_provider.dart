import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// RESULT CONTAINER UPDATES AFTER FUTURE COMPLETES (BUTTON DOES NOTHING)
// - The FutureProvider tells the Consumer to rebuild after Future<MyModel> completes.
// - Press hot restart to rebuild the app with initial values.
// - Note that pressing the “Do something” button does not update the UI, even after the Future completes. If you want that kind of functionality, then just use the ChangeNotifierProvider from the last section.
// - Your use case for FutureProvider might be to read some data from a file or the network. But you could also do that with a FutureBuilder. In my unexpert opinion, FutureProvider is not significantly more useful than a FutureBuilder. If I need a provider then I would probably use a ChangeNotifierProvider, and if I don’t need a provider then I would probably use a FutureBuilder. I’m happy to update this if you would like to add a comment, though.
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
// FutureProvider
    return FutureProvider<MyModel>(
      initialData: MyModel(someValue: 'default value'),
      create: (context) => someAsyncFunctionToGetMyModel(),
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(title: Text('Future Provider')),
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
                  )),
              Container(
                padding: const EdgeInsets.all(35),
                color: Colors.blue[200],
                //  Consumer
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

Future<MyModel> someAsyncFunctionToGetMyModel() async {
  await Future.delayed(Duration(seconds: 3));
  print('new data');
  return MyModel(someValue: 'new data');
}

class MyModel {
  MyModel({this.someValue});
  String someValue = 'Hello';
  Future<void> doSomething() async {
    await Future.delayed(Duration(seconds: 2));
    someValue = 'Goodbye';
    print(someValue);
  }
}
