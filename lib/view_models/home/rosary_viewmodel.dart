import 'package:rockapp/locator.dart';
import 'package:rockapp/model/rosary.dart';
import 'package:rockapp/services/home_service.dart';
import 'package:rockapp/view_models/base_viewmodel.dart';

class RosaryViewModel extends BaseModel {
  final HomeService _homeService = sl<HomeService>();
  List<Rosary>? get rosary => _homeService.rosary;

  void init() async {
    await getRosary();
  }

  Future getRosary() async {
    setBusy(true);
    await _homeService.getRosary();
    setBusy(false);
  }
}
