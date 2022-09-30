import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class CustomNavigationService {
  GlobalKey<NavigatorState> navigationKey = GlobalKey<NavigatorState>();
  GlobalKey<NavigatorState> homeKey = GlobalKey<NavigatorState>();
  GlobalKey<NavigatorState> searchKey = GlobalKey<NavigatorState>();
  GlobalKey<NavigatorState> libraryKey = GlobalKey<NavigatorState>();

  int currentInUseKey = 0;

  updateCurrentInUseKey(int key) {
    currentInUseKey = key;
  }

  GlobalKey<NavigatorState> getCurrentInUseKey() {
    switch (currentInUseKey) {
      case 0:
        return homeKey;
      case 1:
        return searchKey;
      case 2:
        return libraryKey;
      default:
        return navigationKey;
    }
  }

  navigateTo(String route, {arguments}) {
    if (getCurrentInUseKey().currentState != null) {
      return getCurrentInUseKey()
          .currentState!
          .pushNamed(route, arguments: arguments);
    }
  }

  navigateToWidget(Widget widget, {arguments}) {
    print(getCurrentInUseKey().currentState!.context.hashCode);
    if (getCurrentInUseKey().currentState != null) {
      return getCurrentInUseKey()
          .currentState!
          .push(MaterialPageRoute(builder: (context) => widget));
    }
  }

  replaceWith(String route) {
    if (getCurrentInUseKey().currentState != null) {
      return getCurrentInUseKey().currentState!.pushReplacementNamed(route);
    }
  }

  // set navigatorKey(key) {
  //   navigationKey = key;
  // }

  back() {
    return getCurrentInUseKey().currentState!.pop();
  }
}
