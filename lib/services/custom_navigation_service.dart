import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class CustomNavigationService {
  GlobalKey<NavigatorState> navigationKey = GlobalKey<NavigatorState>();

  navigateTo(String route, {arguments}) {
    if (navigationKey.currentState != null) {
      return navigationKey.currentState!.pushNamed(route, arguments: arguments);
    }
  }

  replaceWith(String route) {
    if (navigationKey.currentState != null) {
      return navigationKey.currentState!.pushReplacementNamed(route);
    }
  }

  // set navigatorKey(key) {
  //   navigationKey = key;
  // }

  back() {
    return navigationKey.currentState!.pop();
  }
}
