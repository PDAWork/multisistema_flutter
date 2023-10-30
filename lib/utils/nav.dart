import 'package:flutter/material.dart';
import 'package:multisitema_flutter/app/ui/splashScreen/splash_screen.dart';
import 'package:provider/provider.dart';

import '../app/ui/auth/sign_in.dart';
import '../app/ui/information/information.dart';

class Nav {
  static const String signIn = "/home";
  static const String info = "/info";
  static const String splashScreen = "/splash_creen";

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) =>
      switch (settings.name) {
        signIn => MaterialPageRoute(builder: (ctx) => SignIn()),
        info => MaterialPageRoute(
            builder: (ctx) => ChangeNotifierProvider(
              create: (context) => PageViewProvider(),
              child: const Information(),
            ),
          ),
        splashScreen => MaterialPageRoute(
            builder: (ctx) => const SplashScreen(),
          ),
        _ => MaterialPageRoute(builder: (ctx) => const Placeholder())
      };
}
