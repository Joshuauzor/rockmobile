import 'package:flutter/material.dart';

import 'package:rockapp/locator.dart';
import 'package:rockapp/model/reading.dart';
import 'package:rockapp/services/home_service.dart';
import 'package:rockapp/view_models/base_viewmodel.dart';

class ReadingViewModel extends BaseModel {
  final HomeService _homeService = sl<HomeService>();

  DailyReading? get reading => _homeService.reading;

  Future getDailyReading({
    required String date,
    required BuildContext context,
  }) async {
    setBusy(true);
    await _homeService.getDailyReading(date: date);
    setBusy(false);
  }
}
