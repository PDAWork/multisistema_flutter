import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Stack(children: [
        Align(
          alignment: Alignment.center,
          child: Text(
            "data",
            textAlign: TextAlign.center,
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: LinearProgressIndicator(
              color: Colors.grey,
              
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            ),
          ),
        )
      ]),
    );
  }
}
