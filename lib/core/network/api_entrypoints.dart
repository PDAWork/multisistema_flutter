import 'package:flutter/foundation.dart';

abstract final class ApiEndpoints {
  static const String baseUrl = kDebugMode
      ? "https://a857-212-5-179-254.ngrok-free.app/api/"
      : kProfileMode
          ? "https://e2d9-176-59-54-29.ngrok-free.app/api/"
          : "https://f19d-212-5-179-254.ngrok-free.app/api/";

  static const String socket = "https://a857-212-5-179-254.ngrok-free.app";

  static const String signIn = "auth/signIn";
  static const String refreshToken = "auth/refresh";
  static const String objects = "object/objects";
  static const String meters = "meter/meter";

  static const String userProfile = "user/profile";
  static const String userObjects = "user/objects";
  static const String objectMeters = "object/meters";

  static const String tariff = "pay/tariff";
  static const String pay = "pay/pay";
  static const String allTariffObject = "pay/allTariffObject";
}
