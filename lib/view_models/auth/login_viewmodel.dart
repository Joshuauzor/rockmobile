import 'package:rockapp/locator.dart';
import 'package:rockapp/services/auth_service.dart';
import 'package:rockapp/view_models/base_viewmodel.dart';

class LoginViewModel extends BaseModel {
  final AuthenticationService _authenticationService =
      sl<AuthenticationService>();

  Future login({
    required String email,
    required String password,
  }) async {
    setBusy(true);
    print(email);
    // final res = await
    setBusy(false);
  }
}
