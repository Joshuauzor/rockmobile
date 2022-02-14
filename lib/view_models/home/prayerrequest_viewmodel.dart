import 'package:flutter/material.dart';
import 'package:rockapp/app/styles/flushbar_notification.dart';
import 'package:rockapp/core/errors/failure.dart';
import 'package:rockapp/core/navigators/routes.dart';
import 'package:rockapp/locator.dart';
import 'package:rockapp/model/events.dart';
import 'package:rockapp/model/users.dart';
import 'package:rockapp/services/auth_service.dart';
import 'package:rockapp/services/home_service.dart';
import 'package:rockapp/view_models/base_viewmodel.dart';

class PrayerRequestViewModel extends BaseModel {
  final AuthenticationService _authenticationService =
      sl<AuthenticationService>();

  final HomeService _homeService = sl<HomeService>();

  User? get user => _authenticationService.user;
  List<EventInfo>? get events => _authenticationService.eventDetails;

  void init() async {
    await fetchSettingsInfo();
  }

  Future fetchSettingsInfo() async {
    setBusy(true);
    _authenticationService.fetchSettingsInfo();
    setBusy(false);
  }

  Future prayerRequest({
    required String name,
    required String email,
    required String title,
    required String request,
    required BuildContext context,
  }) async {
    setBusy(true);
    final res = await _homeService.prayerRequest(
        name: name, email: email, title: title, request: request);
    res.fold(
        (l) => {
              FlushBarNotification.showError(
                context,
                FailureToMessage.mapFailureToMessage(l),
              )
            }, (r) {
      Navigator.popAndPushNamed(context, Routes.prayerRequestView);
      FlushBarNotification.showSuccess(
          context, 'Prayer request successfully submitted');
    });
    setBusy(false);
  }
}
