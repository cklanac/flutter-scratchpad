import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// If you have a ValueNotifier you can simply listen to any changes in it with ValueListenableProvider.
// BUT, if you want to call a method on the model from the UI, then you also need to provide the model.
// Thus, in the following code you can see a Provider provides MyModel to a Consumer that gives the ValueNotifier in MyModel to the ValueListenableProvider. YIKES!
//
// - Pressing the “Do something” button makes “Hello” change to “Goodbye” because of the ValueListenableProvider.
// - It would probably be better to use Provider.of<MyModel>(context, listen: false) rather than a Consumer at the top of the widget tree. Otherwise we are rebuilding the whole tree every time.
// - Provider<MyModel> gives myModel to both the ValueListenableProvider and to the “Do something” button closure.
// - The Consumer<String> for the Text widget knew to get its value from the ValueListenableProvider<String> because the String types matched.
// - Seriously, making this example was a pain, especially trying to insert a Consumer at the top of the widget tree and getting all the brackets and parentheses mixed up. Using a MultiProvider (see below) would have improved it, though. Or just save yourself some pain and use a ChangeNotifierProvider.

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Provider
    return Provider<MyModel>(
      create: (context) => MyModel(),
      // MyModel Consumer
      child: Consumer<MyModel>(
        builder: (context, myModel, child) {
          // ValueListenableProvider
          return ValueListenableProvider<String>.value(
            value: myModel.someValue,
            child: MaterialApp(
              home: Scaffold(
                appBar: AppBar(
                  title: Text('Value Listenable Provider'),
                ),
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
                      // String Consumer
                      child: Consumer<String>(
                        builder: (context, myValue, child) {
                          return Text(myValue);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class MyModel {
  // ValueNotifier
  ValueNotifier<String> someValue = ValueNotifier('Hello');
  void doSomething() {
    someValue.value = 'Goodbye';
    print(someValue.value);
  }
}
