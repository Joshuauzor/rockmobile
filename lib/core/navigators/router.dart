import 'package:flutter/material.dart';

import 'package:rockapp/core/navigators/routes.dart';
import 'package:rockapp/features/auth/auth.dart';
import 'package:rockapp/features/books/presentation/pages/single_book.dart';
import 'package:rockapp/features/home/home.dart';
import 'package:rockapp/features/home/presentation/pages/rules_view.dart';
import 'package:rockapp/features/music/music.dart';
import 'package:rockapp/features/settings/presentation/pages/about.dart';
import 'package:rockapp/features/settings/presentation/pages/privacy_policy.dart';
import 'package:rockapp/features/settings/presentation/pages/terms.dart';

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

    case Routes.appTabView:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: const AppTabView(),
      );

    case Routes.privacyPolicy:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: const PrivacyPolicy(),
      );

    case Routes.about:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: const About(),
      );

    case Routes.terms:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: const Terms(),
      );

    case Routes.membership:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: const MembershipView(),
      );

    case Routes.rules:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: const RulesView(),
      );

    case Routes.singleBook:
      final args = settings.arguments as SingleBooksArgs;
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: SingleBook(
          params: args,
        ),
      );

    case Routes.musicPlayerView:
      final args = settings.arguments as MusicPlayerViewsArgs;
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: MusicPlayerView(params: args),
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
