import 'package:flutter/material.dart';
import 'package:rockapp/core/navigators/routes.dart';
import 'package:rockapp/locator.dart';
import 'package:rockapp/services/auth_service.dart';
import 'package:stacked/stacked.dart';

class SplashViewModel extends BaseViewModel {
  final AuthenticationService _authenticationService =
      sl<AuthenticationService>();

  Future checkUserLoggedIn({required BuildContext context}) async {
    setBusy(true);
    await Future.delayed(const Duration(seconds: 2));
    var isUserLoggedIn = await _authenticationService.isUserLoggedIn();
    if (isUserLoggedIn) {
      Navigator.pushReplacementNamed(context, Routes.appTabView);
    } else {
      Navigator.pushReplacementNamed(context, Routes.loginView);
    }
    setBusy(false);
  }
}
