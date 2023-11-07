import 'package:flutter/material.dart';
import 'package:multisitema_flutter/utils/theme_app.dart';

class SettingsProvider {
  SettingsProvider() {
    _hour = DateTime.now().hour;
  }

  final bool isAuth = true;

  void init() async {}

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

  String greeting() {
    if (_hour > 0 && _hour < 5) {
      return "Доброй ночи,";
    } else if (_hour >= 5 && _hour < 10) {
      return "Доброе утро,";
    } else if (_hour >= 10 && _hour < 18) {
      return "Добрый день,";
    } else if (_hour >= 18 && _hour < 22) {
      return "Добрый вечер,";
    } else {
      return "Доброй ночи,";
    }
  }

  final _scaffoldKey = GlobalKey<ScaffoldMessengerState>();

  void showMessageDialog(String title) {
    final context = _scaffoldKey.currentState!.context;
    final query = MediaQuery.of(context);
    final height = query.size.height * 0.023 < 20
        ? 20.0
        : MediaQuery.of(context).size.height * 0.023;
    SnackBar(
      dismissDirection: DismissDirection.startToEnd,
      backgroundColor: Colors.white60.withOpacity(.90),
      content: SizedBox(
        height: height,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              width: height,
              height: height,
              child: Icon(
                Icons.check,
                size: height,
                color: Colors.red,
              ),
            ),
          ],
        ),
      ),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(6),
        ),
      ),
      margin: const EdgeInsets.all(12),
      behavior: SnackBarBehavior.floating,
    );
  }
}
