import 'package:flutter/material.dart';

import 'package:rockapp/core/navigators/routes.dart';
import 'package:rockapp/features/auth/presentation/pages/login_view.dart';
import 'package:rockapp/features/splash/presentation/pages/splash_view.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case Routes.splashView:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: const SplashView(),
      );

    case Routes.loginView:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: const LoginView(),
      );

    default:
      return MaterialPageRoute(
        builder: (_) => Scaffold(
          body: Center(
            child: Text('No route defined for ${settings.name}'),
          ),
        ),
      );
  }
}

// private function to get route
PageRoute _getPageRoute({var routeName, var viewToShow}) {
  return MaterialPageRoute(
    settings: RouteSettings(
      name: routeName,
    ),
    builder: (_) => viewToShow,
  );
}
