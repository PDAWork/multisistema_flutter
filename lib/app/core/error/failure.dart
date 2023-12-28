sealed class Failure {}

class UserFailure extends Failure {
  final String errorMessage;

  UserFailure({required this.errorMessage});
}

class ServerFailure extends Failure {}

class CacheFailure extends Failure {}

class HiveDataFailure extends Failure {}
