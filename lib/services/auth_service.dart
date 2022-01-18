import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:rockapp/core/errors/exceptions.dart';
import 'package:rockapp/core/errors/failure.dart';
import 'package:rockapp/core/networks/api_request.dart';
import 'package:rockapp/locator.dart';
import 'package:stacked/stacked.dart';

abstract class AuthenticationService with ReactiveServiceMixin {
  // late User _user;
  // User get user => _user;
  Future<Either<Failure, String>> login({
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
    try {
      final response =
          await _apiServiceRequester.post(url: 'user/login', body: {
        email,
        password,
      });
      print(response);
      return const Right('success');
    } catch (e) {
      Logger().d(e);
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
}
