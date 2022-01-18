import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:rockapp/core/constant/constant.dart';
import 'package:rockapp/core/errors/exceptions.dart';
import 'package:rockapp/core/networks/connectivity_info.dart';
import 'package:rockapp/locator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiServiceRequester {
  final Dio dio;
  final ConnectivityInfo _connectivityInfo = sl<ConnectivityInfo>();

  ApiServiceRequester({required this.dio});

  String? baseUrl = dotenv.env[BASE_URL];

  //Post request
  Future<Response> post({
    required String url,
    required dynamic body,
  }) async {
    if (await _connectivityInfo.isConnected) {
      var prefs = await SharedPreferences.getInstance();
      var token = prefs.getString('token');

      dio.options.headers['Authorization'] = 'Bearer $token';
      dio.options.contentType = 'application/json';

      final response = await dio.post(
        baseUrl! + url,
        data: body,
      );

      return response;
    } else {
      throw NoInternetException();
    }
  }

  //put request
  Future<Response> put({
    required String url,
    required dynamic body,
  }) async {
    if (await _connectivityInfo.isConnected) {
      var prefs = await SharedPreferences.getInstance();
      var token = prefs.getString('token');

      dio.options.headers['Authorization'] = 'Bearer $token';
      dio.options.contentType = 'application/json';

      final response = await dio.put(
        baseUrl! + url,
        data: body,
      );

      return response;
    } else {
      throw NoInternetException();
    }
  }

  //get request
  Future<Response> getRequest({
    required String url,
  }) async {
    if (await _connectivityInfo.isConnected) {
      var prefs = await SharedPreferences.getInstance();
      var token = prefs.getString('token');

      dio.options.headers['Authorization'] = 'Bearer $token';
      dio.options.contentType = 'application/json';

      final response = await dio.get(
        baseUrl! + url,
      );

      return response;
    } else {
      throw NoInternetException();
    }
  }
}
