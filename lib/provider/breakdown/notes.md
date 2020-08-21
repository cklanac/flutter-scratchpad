# Making sense of all those Flutter Providers

[Making sense of all those Flutter Providers](https://medium.com/flutter-community/making-sense-all-of-those-flutter-providers-e842e18f45dd)


## Provider & Consumer

### Provider
Makes a data model object or value available to the widget tree. BUT it won’t help you update the widget tree when that value changes.

## ChangeNotifierProvider
Unlike the basic Provider widget, ChangeNotifierProvider listens for changes in the model object. When there are changes, it will rebuild any widgets under the Consumer.

### Consumer 
The Consumer widget rebuilds any widgets below it whenever `notifyListeners()` gets called

## FutureProvider
FutureProvider is basically just a wrapper around the FutureBuilder widget.
- A FutureBuilder is assigned a local reference to a future. 
- A FutureProvider gets its future from a Provider.

FutureProvider does not listen for any changes within the model itself. The FutureProvider tells the Consumer to rebuild after Future<MyModel> completes.

## StreamProvider
StreamProvider is basically a wrapper around a StreamBuilder
- Values emitted from the stream are immutable

## ValueListenableProvider
- If you have a ValueNotifier you can simply listen to any changes in it with ValueListenableProvider.
- But if you need to call a method on the model you will also need a Provider to provide the model :(

#### Update
- I’m starting to have a change of heart about ValueListenableProvider. You can use it with an immutable state model object, and immutability has some advantages. See this video also about ValueNotifier.


## ListenableProvider
- You would only use this if you need to build your own special provider. Even the documentation says that you probably want a ChangeNotifierProvider instead

## MultiProvider
- Use it when you need to provide multiple model objects.
- You could nest the providers (similarly to what I did in the ValueListenableProvider example above). However, all that nesting is messy. A neater way to do it is to use a MultiProvider.

## ProxyProvider
- A ProxyProvider takes the value from one provider and lets it be injected into another provider.

## ChangeNotifierProxyProvider
- Not covered in the article


## Other Notes
Most (if not all) of the Provider widgets have two kinds of constructors (create and value)
- The basic constructor takes a create function in which you create your model object. We did that in most of the examples above.

```
Provider<MyModel>(
  create: (context) => MyModel(),
  child: ...
)
```

You can see that the MyModel object was created in the create function.
If your object has already been created and you just want to provide a reference to it, then you can use the named constructor called value:

```
final myModel = MyModel();
...
Provider<MyModel>.value(
    value: myModel, 
    child: ...
)
```

Here MyModel was previously created and was just passed in as a reference. You would do this if you had initialized your model in the initState() method so that you could call a method on the model to load data from the network.
