import 'package:rockapp/locator.dart';
import 'package:rockapp/model/church_prayers.dart';
import 'package:rockapp/services/home_service.dart';
import 'package:rockapp/view_models/base_viewmodel.dart';

class ChurchPrayersViewModel extends BaseModel {
  final HomeService _homeService = sl<HomeService>();
  List<ChurchPrayers>? get churchPrayers => _homeService.churchPrayers;

  void init() async {
    await getPrayers();
  }

  Future getPrayers() async {
    setBusy(true);
    await _homeService.getChurchPrayers();
    setBusy(false);
  }
}
