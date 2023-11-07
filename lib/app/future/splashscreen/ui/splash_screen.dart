import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../utils/nav.dart';
import '../../../../utils/settings_provider.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  // TODO
  final String name = "Даниил";

  @override
  Widget build(BuildContext context) {
    Future.delayed(
      const Duration(seconds: 2),
      () {
        Navigator.pushNamedAndRemoveUntil(context, Nav.home, (route) => false);
      },
    );
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Text(
              "${context.select<SettingsProvider, String>((value) => value.greeting())}\n $name",
              style: const TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: LinearProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                backgroundColor: Colors.black12,
              ),
            ),
          )
        ],
      ),
    );
  }
}
