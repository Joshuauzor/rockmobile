import 'package:flutter/material.dart';
import 'package:rockapp/app/styles/flushbar_notification.dart';
import 'package:rockapp/core/errors/failure.dart';
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

  Future resetPassword({
    required String currentPassword,
    required String newPassword,
    required String confirmPassword,
    required BuildContext context,
  }) async {
    setBusy(true);
    final res = await _authenticationService.resetPassword(
      currentPassword: currentPassword,
      newPassword: newPassword,
      confirmPassword: confirmPassword,
    );
    res.fold(
        (l) => {
              FlushBarNotification.showError(
                  context, FailureToMessage.mapFailureToMessage(l))
            }, (r) {
      Navigator.popAndPushNamed(context, Routes.changePassword);
      FlushBarNotification.showSuccess(context, r);
    });

    setBusy(false);
  }
}
