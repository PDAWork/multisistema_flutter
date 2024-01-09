import 'package:flutter/foundation.dart';

abstract final class ApiEndpoints {
  static const String baseUrl = kDebugMode
      ? "http://localhost:1000/api/"
      : kProfileMode
          ? "https://localhost:3000/api/"
          : "https://localhost:3000/api/";

  static const String signIn = "auth/signIn";
  static const String refreshToken = "auth/refresh";
  static const String objects = "object/objects";
  static const String meters = "meter/meter";

  static const String userProfile = "user/profile";
  static const String userObjects = "user/objects";
  static const String objectMeters = "object/meters";
}
