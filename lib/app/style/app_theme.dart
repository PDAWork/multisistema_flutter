import 'package:flutter/material.dart';

import 'color.dart';

final ThemeData appTheme = ThemeData(
  colorScheme: const ColorScheme.light(primary: primaryColor),
  primaryColor: primaryColor,
  appBarTheme: const AppBarTheme(
    backgroundColor: primaryColor,
  ),
  textButtonTheme: const TextButtonThemeData(
    style: ButtonStyle(
      foregroundColor: MaterialStatePropertyAll(primaryColor),
    ),
  ),
);

(String greeting, Color setColorOfHour) style() {
  int _hour = DateTime.now().hour;
  if (_hour > 0 && _hour < 5) {
    return ("Доброй ночи,", colorNight);
  } else if (_hour >= 5 && _hour < 10) {
    return ("Доброе утро,", colorMorning);
  } else if (_hour >= 10 && _hour < 18) {
    return ("Добрый день,", colorDay);
  } else if (_hour >= 18 && _hour < 22) {
    return ("Добрый вечер,", colorEvening);
  }
  return ("Доброй ночи,", colorNight);
}
