import 'package:flutter/widgets.dart';

class AppNavigation {
  static GlobalKey<NavigatorState> navigationKey = GlobalKey<NavigatorState>();

  static Future<dynamic> toNamed(
    String route, {
    Object? arguments,
  }) async {
    return await Navigator.pushNamed(navigationKey.currentContext!, route,
        arguments: arguments);
  }

  static Future<dynamic> toNamedOff(
    String route, {
    Object? arguments,
  }) async {
    return await Navigator.pushReplacementNamed(
        navigationKey.currentContext!, route,
        arguments: arguments);
  }

  static Future<dynamic> toNamedOffAll(
    String route, {
    Object? arguments,
  }) async {
    return await Navigator.pushNamedAndRemoveUntil(
        navigationKey.currentContext!, route, (route) => false,
        arguments: arguments);
  }

  static dynamic goBack([Object? result]) {
    return Navigator.pop(navigationKey.currentContext!, result);
  }
}
