import 'package:flutter/material.dart';

import 'package:rockapp/core/navigators/routes.dart';
import 'package:rockapp/features/auth/auth.dart';
import 'package:rockapp/features/books/presentation/pages/single_book.dart';
import 'package:rockapp/features/church_prayers/church_prayers.dart';
import 'package:rockapp/features/donation/presentation/pages/donation.dart';
import 'package:rockapp/features/home/home.dart';
import 'package:rockapp/features/home/presentation/pages/daily_reading_view.dart';
import 'package:rockapp/features/media/media.dart';
import 'package:rockapp/features/music/music.dart';
import 'package:rockapp/features/rosary/rosary.dart';
import 'package:rockapp/features/settings/presentation/presentation.dart';
import 'package:rockapp/features/splash/splash.dart';

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

    case Routes.prayerRequestView:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: const PrayerRequest(),
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

    case Routes.mediaView:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: const MediaLibrary(),
      );

    case Routes.videoPlayerView:
      final args = settings.arguments as VideoPlayerViewsArgs;
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: VideoPlayerView(params: args),
      );

    case Routes.churchPrayers:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: const ChurchPrayersView(),
      );

    case Routes.singleChurchPrayer:
      final args = settings.arguments as SinglePrayerArgs;
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: SinglePrayer(params: args),
      );

    case Routes.rosaryView:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: const RosaryView(),
      );

    case Routes.singleRosaryView:
      final args = settings.arguments as SingleRosaryViewArgs;
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: SingleRosaryView(params: args),
      );

    case Routes.rockWebView:
      final args = settings.arguments as RockWebViewArgs;
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: RockWebView(params: args),
      );

    case Routes.selectReadingView:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: const SelectReading(),
      );

    case Routes.dailyReadingView:
      final args = settings.arguments as DailyReadingViewArgs;
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: DailyReadingView(params: args),
      );

    case Routes.donations:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: const DonationView(),
      );

    case Routes.changePassword:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: const ChangePassword(),
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
