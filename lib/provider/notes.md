# Pragmatic State Management in Flutter (Google I/O'19)

https://www.youtube.com/watch?v=d_m5csmrf7I

1. State Management: When we want to change the state of a widget from outside the widget, i.e. from another widget, network, or system call.

## Example
2. In the example the outside entity is: another widget.
3. Making a global state is not a good idea as: 
  a. It Increases Coupling,
  b. Not scalable as there may be more than one implementation of the widget,
  c. Calling set state from outside the widget is bad as we'll have difficulty figuring out who changed the state of the widget in case of multiple callers.
4. Let the framework help you instead of fighting it.
5. UI is a function of state in declarative frameworks: UI = f(state)  ...(f = build methods that declare what the screen should look like at any given time)
    Hence only the state should mutate the UI and not the other UI elements themselves.
6. In order to deal with our previous problem we lift the state up, i.e. make a model at the level that is accessible to both the widgets.
7. When the value of MySlider changes, it notifies MySchedule. MySchedule in turn notifies all its listeners in this case, just MyChart and then notifies MySlider that the update was successful.
8. History of flutter state management:
  a. Scoped model: Implementation of #7
  b. BLoC: Used for large scale applications. Difficult to understand, implement and a lot of boilerplate code, requires knowledge of Rx and Streams.
9. Currently used: Scoped Model: features a lot of ad-on features to the scoped model.
10. Mixins: https://medium.com/flutter-community/dart-what-are-mixins-3a72344011f3
11. ChangeNotifier: adds listening capabilities to MySchedule: addListener, removeListener, dispose...
12. Lift the state up. Use the ChangeNotifierProvider widget in MyApp as the parent of MyChart and MySlider.
13. Use the builder in the widget to build the MySchedule model.
14. Get reference of the model from the Widgets can be done by: 
  a. Consumer<MySchedule>,  ...(a widget that contains a builder that provides the reference to the model)
  b. Provider.of<MySchedule>(context)
15. Update the model from it's reference inside the widget. For the listeners, update the listeners by the model reference.


## State "Management"
16. Disposables: Cleaning up when the widget is getting disposed of done with dispose callback of Provider. ChangeNotifierProvider does the dispose part for you.
17. Break your state up into different components and classes to keep it simple. Use MultiProviders when needed. 
18. Use anything with the provider, streams, data, whatever