class UserProfileDTO {
  final String email;
  final String firstName;
  final String lastName;
  final String phone;

  UserProfileDTO({
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.phone,
  });

  factory UserProfileDTO.fromJson(Map<String, dynamic> json) {
    return UserProfileDTO(
      email: json['email'] ?? '',
      firstName: json['firstname'] ?? '',
      lastName: json['lastname'] ?? '',
      phone: json['phone'] ?? '',
    );
  }

  factory UserProfileDTO.empty() {
    return UserProfileDTO(
      email: '',
      firstName: '',
      lastName: '',
      phone: '',
    );
  }

  @override
  String toString() {
    return '''{
      email: $email,
      firstName: $firstName,
      lastName: $lastName,
      phone: $phone,
    }''';
  }
}
