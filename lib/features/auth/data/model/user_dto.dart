class UserDto {
  final String login;
  final String firstName;
  final String lastName;
  final String phone;
  final String refreshToken;
  final String accessToken;
  final RoleDto idRole;

  UserDto({
    required this.login,
    required this.firstName,
    required this.lastName,
    required this.phone,
    required this.refreshToken,
    required this.accessToken,
    this.idRole = RoleDto.user,
  });

  factory UserDto.fromJson(Map<String, dynamic> json) {
    return UserDto(
      login: json['login'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      phone: json['phone'],
      refreshToken: json['refreshToken'],
      accessToken: json['accessToken'],
      idRole: RoleDto.values.firstWhere(
        (element) => element.id == json['idRole'],
      ),
    );
  }
}

enum RoleDto {
  master(id: 1),
  user(id: 2);

  const RoleDto({required this.id});

  final int id;
}
