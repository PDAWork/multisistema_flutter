import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../app/ui/auth/sign_in.dart';
import '../app/ui/information/information.dart';

class Nav {
  static const String signIn = "/home";
  static const String info = "/info";

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) =>
      switch (settings.name) {
        signIn => MaterialPageRoute(builder: (ctx) => SignIn()),
        info => MaterialPageRoute(
            builder: (ctx) => ChangeNotifierProvider(
              create: (context) => PageViewProvider(),
              child: Information(),
            ),
          ),
        _ => MaterialPageRoute(builder: (ctx) => const Placeholder())
      };
}
