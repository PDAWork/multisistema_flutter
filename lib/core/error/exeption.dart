class ServerException implements Exception {}

class ChacheException implements Exception {}
class UserException implements Exception {
  final String errorMessage;

  UserException({required this.errorMessage});
}

class HiveDataException implements ServerException {}
