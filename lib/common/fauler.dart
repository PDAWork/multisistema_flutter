class AuthorizationExeption implements Exception {
  final String message;

  AuthorizationExeption({this.message = ''});
}

class ServerExeption implements Exception {
  final String message;

  ServerExeption({this.message = ''});
}

abstract interface class Failure {
  Failure({this.message = ""});
  final String message;

  @override
  String toString() {
    return message;
  }
}

class AuthorizationFailure extends Failure {
  AuthorizationFailure({String message = ""}) : super(message: message);
}

class ServerFailure extends Failure {
  ServerFailure({String message = ""}) : super(message: message);
}

class SidFailure extends Failure {
  SidFailure({String message = ""}) : super(message: message);
}
