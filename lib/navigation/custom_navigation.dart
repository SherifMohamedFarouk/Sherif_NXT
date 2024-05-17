import 'package:flutter/material.dart';
import 'package:sherif_nxt_assessment/presentation/start_view/start_view.dart';
import '../main.dart';
import 'routes.dart';

abstract class CustomNavigator {
  static final GlobalKey<NavigatorState> navigatorState = GlobalKey<
      NavigatorState>(); // set the navigator state so we won't use any context //
  static final RouteObserver<PageRoute> routeObserver = RouteObserver<
      PageRoute>(); // observe our routes (know where i'm standing in the app) //

  static Route<dynamic> onCreateRoute(RouteSettings settings) {
    var arguments = settings.arguments;
    switch (settings.name) {
      case Routes.main:
        return MaterialPageRoute(builder: (_) => const MyApp());
      case Routes.start:
        return MaterialPageRoute(builder: (_) => const StartView());
      default:
        return MaterialPageRoute(builder: (_) => const StartView());
    }
  }

  static void pop({dynamic result}) {
    if (navigatorState.currentState!.canPop()) {
      navigatorState.currentState!.pop(result);
    }
  }

  static Future push(String routeName,
      {arguments,
        bool replace = false,
        bool removeUntil = false,
        bool isFirst = false}) {
    if (removeUntil) {
      return navigatorState.currentState!.pushNamedAndRemoveUntil(routeName,
          isFirst ? (Route<dynamic> route) => route.isFirst : (_) => false,
          arguments: arguments);
    } else if (replace) {
      return navigatorState.currentState!
          .pushReplacementNamed(routeName, arguments: arguments);
    } else {
      return navigatorState.currentState!
          .pushNamed(routeName, arguments: arguments);
    }
  }
}
