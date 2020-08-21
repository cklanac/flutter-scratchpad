// https://api.flutter.dev/flutter/widgets/Navigator-class.html
// https://itnext.io/flutter-navigation-routing-made-easy-816ddf9e2857
// https://api.flutter.dev/flutter/material/MaterialApp/onUnknownRoute.html
// https://stackoverflow.com/questions/60723270/what-is-onunknownroute-in-flutter
// https://www.filledstacks.com/snippet/clean-navigation-in-flutter-using-generated-routes/

import 'package:flutter/material.dart';

class Routes {
  // The app's 'home' page route is named '/' by default.
  static const String Home = '/';
  static const String Page = '/foobar';

  static Map<String, WidgetBuilder> get table {
    return {
      // If the home property is specified, the routes table cannot include an entry for "/", since it would be redundant.
      // '/': (BuildContext context) => HomePage(), // <<== D/N do this

      // Use constants for routes to enable static analysis and prevents typo errors
      Routes.Page: (BuildContext context) => MyPage(title: 'Hello FooBar!'),

      // Deep Linking with backbutton support requires intermediate routes to be defined.
      // This seems like a good job for `onGenerateRoute`??
      '/foo': (BuildContext context) => MyPage(title: 'Foo Deep Link'),
      '/foo/bar': (BuildContext context) => MyPage(title: 'Bar Deep Link'),
      '/foo/bar/baz': (BuildContext context) => MyPage(title: 'Baz Deep Link'),
    };
  }

  static Route<dynamic> generate(RouteSettings settings) {
    print('Route name: ${settings.name}, arguments: ${settings.arguments}');
    return MaterialPageRoute(builder: (_) => MyPage(title: 'Generated'));
  }
}

class MyNavigatorObserver extends NavigatorObserver {
  /// `didPush`
  /// The route immediately below that one, and thus the previously active route, is `previousRoute`.
  @override
  void didPush(Route route, Route previousRoute) {
    print('PUSHED ${route.settings.name}');
    // print(previousRoute.settings.arguments);
    // print(route.settings.arguments);
  }

  /// `didPop`
  /// The route immediately below that one, and thus the newly active route, is `previousRoute`.
  @override
  void didPop(Route route, Route previousRoute) {
    print('POPPED ${route.settings.name}');
    // print(previousRoute.settings.arguments);
    // print(route.settings.arguments);
  }
}

// `MaterialApp` creates a Router which in-turn creates a Navigator
// `home:`
//    If `home` is defined then routes table cannot include an entry for "/"
// `initialPage`
//    overrides `home`. Throws error if not found and uses `home` instead
// `onGenerateRoute`
//    The following is from documenations but doesn't seem to be true.
//    "To use [pushNamed], an [Navigator.onGenerateRoute] callback must be provided,""
// 'onUnknownRoute'
// This callback is typically used for error handling. For example, this callback might always generate a "not found" page that describes the route that wasn't found.
/// At least one of [home], [routes], [onGenerateRoute], or [builder] must be
/// non-null. If only [routes] is given, it must include an entry for the
/// [Navigator.defaultRouteName] (`/`), since that is the route used when the
/// application is launched with an intent that specifies an otherwise
/// unsupported route.
void main() {
  runApp(MaterialApp(
    title: 'Navigation app',
    routes: Routes.table,
    home: HomePage(),
    // initialRoute: '/foo/bar/baz',
    onGenerateRoute: Routes.generate,
    onUnknownRoute: (RouteSettings settings) {
      return MaterialPageRoute<void>(
        settings: settings,
        builder: (BuildContext context) => Scaffold(
          body: Center(
            child: Text('No route defined for ${settings.name}'),
          ),
        ),
      );
    },
    navigatorObservers: [MyNavigatorObserver()],
  ));
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text('Go to Page - Navigator push'),
              onPressed: () {
                // Navigate to the route using Navigator.push()
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyPage(title: 'Navigator push'),
                  ),
                );
              },
            ),
            RaisedButton(
              child: Text('Go to Page - Named Route'),
              onPressed: () {
                // Navigate to the second screen using a named route (defined in MaterialApp `routes` )
                Navigator.pushNamed(context, Routes.Page);
              },
            ),
            RaisedButton(
              child: Text('Go to Page - Named Route w/ Args'),
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  Routes.Page,
                  arguments: 123,
                );
              },
            ),
            RaisedButton(
              child: Text('Go to Page - Generated'),
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  '/qux',
                  arguments: 123,
                );
              },
            ),
            RaisedButton(
              child: Text('Details screen'),
              onPressed: () async {
                final data = await Navigator.pushNamed(
                  context,
                  Routes.Page,
                  arguments: 789,
                );
                print(data);
              },
            )
          ],
        ),
      ),
    );
  }
}

// My Page simply displays the title passed to it.
// It does not use Navigator.pop(), instead it relies on the 'back' button in the AppBar
class MyPage extends StatelessWidget {
  final String title;
  MyPage({this.title});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context).settings.arguments;

    print('data $args');
    print('title $title');

    return Scaffold(
      appBar: AppBar(title: Text('My Page: $title')),
      body: Center(
        child: RaisedButton(
          child: Text('Send $args back'),
          onPressed: () {
            Navigator.pop(context, args);
          },
        ),
      ),
    );
  }
}
