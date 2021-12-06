import 'package:flutter/material.dart';
import 'package:rockapp/constant/routes.dart';
import 'package:stacked/stacked.dart';

class SplashViewModel extends BaseViewModel {
  Future init({required BuildContext context}) async {
    await Future.delayed(const Duration(milliseconds: 2000)).whenComplete(
        () => Navigator.pushReplacementNamed(context, Routes.loginView));
  }
}
