import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  const Failure([List properties = const <dynamic>[]]) : super();
}

class NoInternetFailure extends Failure {
  @override
  List<Object> get props => [];
  @override
  String toString() => 'No internet';
}

class ServerFailure extends Failure {
  final String message;
  const ServerFailure({
    required this.message,
  });

  @override
  List<Object> get props => [message];
}

class CustomKnownFailure extends Failure {
  final String message;
  const CustomKnownFailure({
    required this.message,
  });

  @override
  List<Object> get props => [message];
}

class ExistingValue extends Failure {
  @override
  List<Object> get props => [];
  @override
  String toString() => 'Value exist Faliure';
}

class InvalidCredentials extends Failure {
  @override
  List<Object> get props => [];
  @override
  String toString() => 'Invalid credentials';
}

class PendingFailure extends Failure {
  @override
  List<Object> get props => [];

  @override
  String toString() => 'Pending Faliure';
}

class NullFailure extends Failure {
  @override
  List<Object> get props => [];
}

class UnknownFailure extends Failure {
  @override
  List<Object> get props => [];

  @override
  String toString() => 'Unknown Failure';
}

class FailureToMessage {
  static String mapFailureToMessage(Failure failure) {
    var message = 'An Error occurred, please try again';
    if (failure is NoInternetFailure) {
      message = 'Please check your internet connection and try again';
    } else if (failure is ServerFailure) {
      message = failure.message;
    } else if (failure is ExistingValue) {
      message = 'Incorrect data provided';
    } else if (failure is InvalidCredentials) {
      message = 'Incorrect email or password';
    } else if (failure is PendingFailure) {
      message = 'Request is pending, please try again later';
    } else if (failure is CustomKnownFailure) {
      message = failure.message;
    }
    return message;
  }
}
