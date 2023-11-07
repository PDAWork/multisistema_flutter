import 'package:dio/dio.dart';

class User {
  final String sid;
  final String email;
  final String password;
  final String firstName;
  final String lastName;
  final String phone;

  User({
    this.sid = '',
    required this.email,
    required this.password,
    this.firstName = '',
    this.lastName = '',
    this.phone = '',
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      sid: json['sid'] ?? '',
      email: json['email'] ?? '',
      password: json['password'] ?? '',
      firstName: json['firstname'] ?? '',
      lastName: json['lastname'] ?? '',
      phone: json['phone'] ?? '',
    );
  }

  static FormData toJsonLogin(String email, String password) {
    return FormData.fromMap({
      'email': email,
      'password': password,
    });
  }

  

  @override
  String toString() {
    return '''{
      sid: $sid,
      email: $email,
      password: $password,
      firstName: $firstName,
      lastName: $lastName,
      phone: $phone,
    }''';
  }
}
