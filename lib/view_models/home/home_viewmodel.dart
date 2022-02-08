import 'package:rockapp/locator.dart';
import 'package:rockapp/model/events.dart';
import 'package:rockapp/model/users.dart';
import 'package:rockapp/services/auth_service.dart';
import 'package:rockapp/view_models/base_viewmodel.dart';

class HomeViewModel extends BaseModel {
  final AuthenticationService _authenticationService =
      sl<AuthenticationService>();

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
}
