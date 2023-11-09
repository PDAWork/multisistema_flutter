import 'package:multisitema_flutter/app/future/auth/data/dto/user_profile_dto.dart';

import 'errors_response.dart';
import 'user.dart';
import '../../future/auth/data/dto/user_login_dto.dart';

// Fulutter Securet Storage
class BodyResponse<T> {
  final String status;
  final List<ErrorsResponse> errors;
  final T data;

  BodyResponse({
    required this.status,
    required this.errors,
    required this.data,
  });

  factory BodyResponse.fromJson(Map<String, dynamic> json) {
    final data = json['data'];
    return BodyResponse(
      status: json['status'],
      errors: (json['errors'] as List)
          .map((e) => ErrorsResponse.fromJson(e))
          .toList(),
      data: switch (T) {
        User => User.fromJson(data) as T,
        UserLoginDTO => UserLoginDTO.fromJson(data) as T,
        UserProfileDTO => UserProfileDTO.fromJson(data) as T,
        // Test => Test.fromJson(json['data']) as T,
        _ => data as T,
      },
    );
  }

  factory BodyResponse.empty(String error) {
    return BodyResponse(
      status: 'bad',
      errors:
          [error].map((e) => ErrorsResponse(name: 'name', msg: error)).toList(),
      data: switch (T) {
        UserLoginDTO => UserLoginDTO.empty() as T,
        UserProfileDTO => UserProfileDTO.empty() as T,
        // Test => Test.fromJson(json['data']) as T,
        _ => "" as T,
      },
    );
  }
}