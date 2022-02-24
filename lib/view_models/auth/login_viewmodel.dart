import 'package:flutter/material.dart';
import 'package:rockapp/app/styles/flushbar_notification.dart';
import 'package:rockapp/core/errors/failure.dart';
import 'package:rockapp/core/navigators/routes.dart';
import 'package:rockapp/features/auth/auth.dart';
import 'package:rockapp/locator.dart';
import 'package:rockapp/services/auth_service.dart';
import 'package:rockapp/view_models/base_viewmodel.dart';

class LoginViewModel extends BaseModel {
  final AuthenticationService _authenticationService =
      sl<AuthenticationService>();

  Future login({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    setBusy(true);
    final res =
        await _authenticationService.login(email: email, password: password);
    res.fold(
        (l) => {
              FlushBarNotification.showError(
                  context, FailureToMessage.mapFailureToMessage(l))
            }, (r) {
      Navigator.pushReplacementNamed(context, Routes.appTabView);
      FlushBarNotification.showSuccess(context, r);
    });
    setBusy(false);
  }

  Future register({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    setBusy(true);
    final res = await _authenticationService.register(
      email: email,
      firstName: firstName,
      lastName: lastName,
      password: password,
    );

    res.fold(
        (l) => {
              FlushBarNotification.showError(
                  context, FailureToMessage.mapFailureToMessage(l))
            }, (r) {
      Navigator.pushReplacementNamed(context, Routes.loginView);
      FlushBarNotification.showSuccess(context, r);
    });
    setBusy(false);
  }

  Future forgotPassword({
    required String email,
    required BuildContext context,
  }) async {
    setBusy(true);
    final res = await _authenticationService.forgotPassword(email: email);

    res.fold(
        (l) => {
              FlushBarNotification.showError(
                  context, FailureToMessage.mapFailureToMessage(l))
            }, (r) {
      Navigator.pushNamed(
        context,
        Routes.resetView,
        arguments: ResetViewArgs(email: email),
      );
      FlushBarNotification.showSuccess(context, r);
    });
    setBusy(false);
  }

  Future resetPassword({
    required String email,
    required String otp,
    required String password,
    required BuildContext context,
  }) async {
    setBusy(true);
    final res = await _authenticationService.resetPasswordHome(
        email: email, otp: otp, newPassword: password);

    res.fold(
        (l) => {
              FlushBarNotification.showError(
                  context, FailureToMessage.mapFailureToMessage(l))
            }, (r) {
      Navigator.popUntil(
        context,
        ModalRoute.withName(Routes.loginView),
      );
      FlushBarNotification.showSuccess(context, r);
    });
    setBusy(false);
  }

  Future logout(BuildContext context) async {
    setBusy(true);
    await _authenticationService.logout();
    setBusy(false);
    Navigator.pushNamedAndRemoveUntil(
        context, Routes.loginView, (route) => false);
  }
}
