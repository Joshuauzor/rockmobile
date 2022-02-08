class NoInternetException implements Exception {
  @override
  String toString() => 'No internet';
}

class ServerException implements Exception {
  final String message;

  const ServerException({
    required this.message,
  });
}

class CacheException implements Exception {}

class NullException implements Exception {}
