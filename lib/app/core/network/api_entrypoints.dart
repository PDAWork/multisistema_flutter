import 'package:flutter/foundation.dart';

abstract final class ApiEndpoints {
  static const String baseUrl = kDebugMode
      ? "http://localhost:3000/api/"
      : kProfileMode
          ? "https://localhost:3000/api/"
          : "https://localhost:3000/api/";

  static const String signIn = "auth/signIn";
  static const String userProfile = "user/profile";
  static const String userObjects = "user/objects";
  static const String objectGet = "object/get";
  static const String objectMeters = "object/meters";
}
