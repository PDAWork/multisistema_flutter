import 'package:multisitema_flutter/app/future/auth/data/dto/user_profile_dto.dart';

import 'errors_response.dart';
import 'object/object_dto.dart';
import 'object/object_list_dto.dart';
import 'sensor/sensor_list_dto.dart';
import 'user.dart';
import '../../future/auth/data/dto/user_login_dto.dart';

// Fulutter Securet Storage
class BodyResponse<T> {
  final String status;
  final List<ErrorsResponse> errors;
  final T data;
  final List<T>? dataList;
  BodyResponse(
      {required this.status,
      required this.errors,
      required this.data,
      this.dataList});

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
        ObjectDTO => ObjectDTO.fromJson(data) as T,
        ObjectListDTO => ObjectListDTO.fromJson(data) as T,
        SensorListDTO => SensorListDTO.fromJson(data) as T,
        _ => data,
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
        ObjectDTO => ObjectDTO.empty() as T,
        // Test => Test.fromJson(json['data']) as T,
        _ => "" as T,
      },
    );
  }
}
