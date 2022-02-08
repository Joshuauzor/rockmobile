import 'package:connectivity/connectivity.dart';

abstract class ConnectivityInfo {
  Future<bool> get isConnected;
}

class ConnectivityInfoImpl implements ConnectivityInfo {
  @override
  Future<bool> get isConnected async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      return true;
    } else {
      return false;
    }
  }
}
