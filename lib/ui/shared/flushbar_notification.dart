import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';

class FlushBarNotification {
  static void showError(BuildContext context, String message,
      {bool top = false}) {
    Flushbar(
      flushbarPosition: top ? FlushbarPosition.TOP : FlushbarPosition.BOTTOM,
      padding: const EdgeInsets.fromLTRB(20, 10, 5, 10),
      margin: const EdgeInsets.symmetric(horizontal: 20),
      message: message,
      duration: const Duration(seconds: 3),
      backgroundColor: Colors.red,
      borderRadius: BorderRadius.circular(7),
    ).show(context);
  }

  static void showSuccess(BuildContext context, String message,
      {bool top = false}) {
    Flushbar(
      flushbarPosition: top ? FlushbarPosition.TOP : FlushbarPosition.BOTTOM,
      padding: const EdgeInsets.fromLTRB(20, 10, 5, 10),
      margin: const EdgeInsets.symmetric(horizontal: 20),
      message: message,
      duration: const Duration(seconds: 3),
      backgroundColor: Colors.green,
      borderRadius: BorderRadius.circular(7),
    ).show(context);
  }
}
