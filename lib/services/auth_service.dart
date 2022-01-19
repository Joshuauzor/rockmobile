import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:rockapp/core/errors/exceptions.dart';
import 'package:rockapp/core/errors/failure.dart';
import 'package:rockapp/core/networks/api_request.dart';
import 'package:rockapp/locator.dart';
import 'package:rockapp/model/events.dart';
import 'package:rockapp/model/users.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';

abstract class AuthenticationService with ReactiveServiceMixin {
  late User _user;
  User get user => _user;
  List<EventInfo>? _eventDetails;
  List<EventInfo>? get eventDetails => _eventDetails;

  Future<Either<Failure, String>> login({
    required String email,
    required String password,
  });

  Future<Either<Failure, String>> register({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
  });
}

class AuthenticationServiceImpl extends AuthenticationService {
  final ApiServiceRequester _apiServiceRequester = sl<ApiServiceRequester>();

  @override
  Future<Either<Failure, String>> login({
    required String email,
    required String password,
  }) async {
    _eventDetails = null;
    try {
      final response =
          await _apiServiceRequester.post(url: 'user/login', body: {
        'email': email,
        'password': password,
      });

      if (!response.data['status']) {
        return Left(ServerFailure(message: response.data['message']));
      }
      var prefs = await SharedPreferences.getInstance();
      await prefs.setString('token', response.data['data']['token']);
      await prefs.setString('user', jsonEncode(response.data['data']));
      _user = User.fromJson(response.data['data']);

      // loop list and inside into model
      var responseEventData = response.data['data']['events'];
      var _eventData = <EventInfo>[];
      for (var i = 0; i < responseEventData.length; i++) {
        _eventData.add(EventInfo.fromJson(responseEventData[i]));
      }
      _eventDetails = _eventData;
      return const Right('Login successful');
    } catch (e) {
      Logger().d('$e');
      if (e is NoInternetException) {
        return Left(NoInternetFailure());
      }
      if (e is DioError) {
        if (e.response != null && e.response!.statusCode! >= 500) {
          return const Left(ServerFailure(message: 'server error. try again'));
        }
        if (e.response != null &&
            e.response!.data != null &&
            e.response!.data['message'] != null) {
          return Left(ServerFailure(message: e.response!.data['message']));
        } else {
          return const Left(
            ServerFailure(message: 'Server error, please try again'),
          );
        }
      }
      return Left(UnknownFailure());
    }
  }

  @override
  Future<Either<Failure, String>> register({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
  }) async {
    try {
      final response =
          await _apiServiceRequester.post(url: 'user/register', body: {
        'email': email,
        'firstname': firstName,
        'lastname': lastName,
        'phone': '123456789',
        'password': password,
      });
      if (!response.data['status']) {
        return Left(ServerFailure(message: response.data['message']));
      }
      return const Right('Registration successfull. Please login');
    } catch (e) {
      Logger().d('$e');
      if (e is NoInternetException) {
        return Left(NoInternetFailure());
      }
      if (e is DioError) {
        if (e.response != null &&
            e.response!.statusCode! >= 500 &&
            e.response!.data != null &&
            e.response!.data['message'] != null) {
          return Left(ServerFailure(message: e.response!.data['message']));
        }
        if (e.response != null && e.response!.statusCode! >= 500) {
          return const Left(ServerFailure(message: 'server error. try again'));
        }
        if (e.response != null &&
            e.response!.data != null &&
            e.response!.data['message'] != null) {
          return Left(ServerFailure(message: e.response!.data['message']));
        } else {
          return const Left(
            ServerFailure(message: 'Server error, please try again'),
          );
        }
      }
      return Left(UnknownFailure());
    }
  }
}
