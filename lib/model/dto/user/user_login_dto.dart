class UserLoginDTO {
  final String sid;
  final int api;
  final int role;

  UserLoginDTO({
    required this.api,
    required this.role,
    required this.sid,
  });

  factory UserLoginDTO.fromJson(Map<String, dynamic> json) {
    return UserLoginDTO(
      sid: json['sid'] ?? '',
      api: json['api'] ?? -1,
      role: json['role'] ?? -1,
    );
  }

  factory UserLoginDTO.empty() {
    return UserLoginDTO(
      api: -1,
      role: -1,
      sid: '',
    );
  }

  @override
  String toString() {
    return '''{
      sid: $sid,
      api: $api,
      role: $role,
    }''';
  }
}
