import 'package:flutter/material.dart';
import 'package:rockapp/core/navigators/routes.dart';
import 'package:rockapp/locator.dart';
import 'package:rockapp/model/settings.dart';
import 'package:rockapp/services/auth_service.dart';
import 'package:rockapp/view_models/base_viewmodel.dart';

class SettingsViewModel extends BaseModel {
  final AuthenticationService _authenticationService =
      sl<AuthenticationService>();

  SettingsModel? get settings => _authenticationService.settings;

  Future logout(BuildContext context) async {
    setBusy(true);
    await _authenticationService.logout();
    setBusy(false);
    Navigator.pushNamedAndRemoveUntil(
        context, Routes.loginView, (route) => false);
  }
}
