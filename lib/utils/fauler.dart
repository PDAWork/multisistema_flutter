class Fauler {
  Fauler({this.message = ""});
  String message;

  @override
  String toString() {
    return message;
  }
}

final class AuthorizationExeption extends Fauler {
  AuthorizationExeption({String message = ""}) : super(message: message);
}
final class SidExeption extends Fauler {
  SidExeption({String message = ""}) : super(message: message);
}
