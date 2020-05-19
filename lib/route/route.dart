import 'dart:io';

import 'package:flutter/material.dart';
import 'package:health_care/route/route_list.dart';
import 'package:health_care/src/home/home_screen.dart';
import 'package:health_care/src/splash_screen/splash_screen.dart';

class RouteGenerator {
  static Route buildRoutes(RouteSettings settings) {
    switch (settings.name) {
      case RouteList.initial:
        return buildRoute(
          SplashScreen(),
          settings: settings,
        );
      case RouteList.dashBoardRoute:
        return buildRoute(
          HomeScreen(),
          settings: settings,
        );
      default:
        return buildRoute(
          const SizedBox(),
          settings: settings,
        );
    }
  }
}

Route buildRoute(Widget screen, {RouteSettings settings}) {
  if (Platform.isIOS) {
    return MaterialPageRoute(builder: (context) => screen, settings: settings);
  } else {
    return SlideLeftRoute(enterWidget: screen);
  }
}

class SlideLeftRoute extends PageRouteBuilder {
  final Widget enterWidget;
  SlideLeftRoute({this.enterWidget})
      : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) {
            return enterWidget;
          },
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(1.5, 0.0),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            );
          },
        );
}
