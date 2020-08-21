// https://medium.com/flutter-community/controlling-screen-orientation-in-flutter-apps-on-a-per-screen-basis-d637702f9368

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NavigatorObserverWithOrientation extends NavigatorObserver {
  @override
  void didPop(Route route, Route previousRoute) {
    if (previousRoute.settings.arguments is ScreenOrientation) {
      _setOrientation(previousRoute.settings.arguments);
    } else {
      // Portrait-only is the default option
      _setOrientation(ScreenOrientation.portraitOnly);
    }
  }

  @override
  void didPush(Route route, Route previousRoute) {
    if (route.settings.arguments is ScreenOrientation) {
      _setOrientation(route.settings.arguments);
    } else {
      _setOrientation(ScreenOrientation.portraitOnly);
    }
  }
}

enum ScreenOrientation {
  portraitOnly,
  landscapeOnly,
  rotating,
}

void _setOrientation(ScreenOrientation orientation) {
  List<DeviceOrientation> orientations;
  switch (orientation) {
    case ScreenOrientation.portraitOnly:
      orientations = [
        DeviceOrientation.portraitUp,
      ];
      break;
    case ScreenOrientation.landscapeOnly:
      orientations = [
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.landscapeRight,
      ];
      break;
    case ScreenOrientation.rotating:
      orientations = [
        DeviceOrientation.portraitUp,
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.landscapeRight,
      ];
      break;
  }
  SystemChrome.setPreferredOrientations(orientations);
}
