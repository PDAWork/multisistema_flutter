import 'package:flutter/material.dart';

import 'color.dart';

final ThemeData appTheme = ThemeData(
  useMaterial3: false,
  colorScheme: const ColorScheme.light(primary: primaryColor),
  primaryColor: primaryColor,
  appBarTheme: const AppBarTheme(
    elevation: 0,
    backgroundColor: primaryColor,
    foregroundColor: Colors.white,
  ),
  elevatedButtonTheme: const ElevatedButtonThemeData(
    style: ButtonStyle(
      foregroundColor: MaterialStatePropertyAll(Colors.white),
    ),
  ),
  textButtonTheme: const TextButtonThemeData(
    style: ButtonStyle(
      foregroundColor: MaterialStatePropertyAll(primaryColor),
    ),
  ),
);

(String greeting, Color setColorOfHour) style() {
  int hour = DateTime.now().hour;
  if (hour > 0 && hour < 5) {
    return ("Доброй ночи,", colorNight);
  } else if (hour >= 5 && hour < 10) {
    return ("Доброе утро,", colorMorning);
  } else if (hour >= 10 && hour < 18) {
    return ("Добрый день,", colorDay);
  } else if (hour >= 18 && hour < 22) {
    return ("Добрый вечер,", colorEvening);
  }
  return ("Доброй ночи,", colorNight);
}
