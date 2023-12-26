import 'package:flutter/material.dart';
import 'package:multisitema_flutter/app/style/app_theme.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SafeArea(
        child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: Text(
                " ${style().$1}",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const Align(
              alignment: Alignment.bottomCenter,
              child: LinearProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                backgroundColor: Colors.black12,
              ),
            )
          ],
        ),
      ),
    );
  }
}
