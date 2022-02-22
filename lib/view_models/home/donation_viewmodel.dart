import 'package:rockapp/locator.dart';
import 'package:rockapp/model/donations.dart';
import 'package:rockapp/services/home_service.dart';
import 'package:rockapp/view_models/base_viewmodel.dart';

class DonationViewModel extends BaseModel {
  final HomeService _homeService = sl<HomeService>();
  List<Donations>? get donationList => _homeService.donationList;

  void init() async {
    await getDonations();
  }

  Future getDonations() async {
    setBusy(true);
    await _homeService.getDonations();
    setBusy(false);
  }
}
