import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// RESULT CONTAINER UPDATES UPON EACH NEW STREAM VALUE (BUTTON DOES NOTHING)
// - The StreamProvider tells the Consumer to rebuild after when there is a new stream event.
// - Press hot restart to rebuild the app with initial values.
// - Note that pressing the “Do something” button does not update the UI. If you want that kind of functionality, then just use a ChangeNotifierProvider. In fact, you could have a stream in your model object and just call notifyListeners(). You wouldn’t need a StreamProvider at all in that case.
// - You could use a StreamProvider to implement the BLoC pattern.
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // StreamProvider
    return StreamProvider<MyModel>(
      initialData: MyModel(someValue: 'default value'),
      create: (context) => getStreamOfMyModel(),
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(title: Text('Stream Provider')),
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

// Stream
Stream<MyModel> getStreamOfMyModel() {
  return Stream<MyModel>.periodic(
      Duration(seconds: 1), (x) => MyModel(someValue: '$x')).take(10);
}

class MyModel {
  MyModel({this.someValue});
  String someValue = 'Hello';
  void doSomething() {
    someValue = 'Goodbye';
    print(someValue);
  }
}
