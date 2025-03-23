import 'package:flutter/material.dart';

import 'routes.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (_) {
            return Scaffold(body: Center(child: Text('------')));
          },
        );

      case Routes.homeScreen:
        return MaterialPageRoute(
          builder: (_) {
            return Scaffold(body: Center(child: Text('------')));
          },
        );

      default:
        return MaterialPageRoute(
          builder: (_) {
            return Scaffold(body: Center(child: Text('------')));
          },
        );
    }
  }
}
