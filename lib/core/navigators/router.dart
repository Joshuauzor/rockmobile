import 'package:flutter/material.dart';

import 'package:rockapp/core/navigators/routes.dart';
import 'package:rockapp/features/auth/auth.dart';
import 'package:rockapp/features/home/home.dart';
import 'package:rockapp/features/media/media.dart';

import '../../features/splash/splash.dart';

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

    case Routes.forgotView:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: const ForgotView(),
      );

    case Routes.resetView:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: const ResetView(),
      );

    case Routes.homeView:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: const HomeView(),
      );

    case Routes.videoView:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: const VideoView(),
      );

    case Routes.appTabView:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: const AppTabView(),
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
