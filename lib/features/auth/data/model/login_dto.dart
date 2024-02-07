class LoginDto {
  final String login;
  final String password;

  LoginDto({
    required this.login,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    return {
      "login": login,
      "password": password,
    };
  }
}
