import 'package:flutter/material.dart';
import 'package:multisitema_flutter/utils/theme_app.dart';

class SettingsProvider {
  SettingsProvider() {
    _hour = DateTime.now().hour;
  }

  int _hour = 0;

  Color setColorOfHour() {
    if (_hour > 0 && _hour < 5) {
      return ThemeApp.colorNight;
    } else if (_hour >= 5 && _hour < 10) {
      return ThemeApp.colorMorning;
    } else if (_hour >= 10 && _hour < 18) {
      return ThemeApp.colorDay;
    } else if (_hour >= 18 && _hour < 22) {
      return ThemeApp.colorEvening;
    }
    return ThemeApp.colorNight;
  }
}
