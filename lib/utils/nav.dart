import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multisitema_flutter/app/future/auth/model/repository/auth_repository.dart';
import 'package:multisitema_flutter/app/future/auth/data/repository/auth_repository_impl.dart';
import 'package:multisitema_flutter/app/future/auth/ui/state/auth_cubit.dart';
import 'package:multisitema_flutter/app/future/splashscreen/ui/splash_screen.dart';
import 'package:provider/provider.dart';

import '../app/future/auth/ui/sign_in.dart';
import '../app/future/home/ui/home.dart';
import '../app/future/information/ui/information.dart';
import 'locator_service.dart';

class Nav {
  static const String signIn = "/sign_in";
  static const String info = "/info";
  static const String splashScreen = "/splash_creen";
  static const String home = "/home";

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    return switch (settings.name) {
      home => MaterialPageRoute(builder: (ctx) => Home()),
      signIn => MaterialPageRoute(
          builder: (ctx) => BlocProvider(
            create: (context) => sl<AuthCubit>(),
            child: SignIn(),
          ),
        ),
      info => MaterialPageRoute(
          builder: (ctx) => ChangeNotifierProvider(
            create: (context) => PageViewProvider(),
            child: const Information(),
          ),
        ),
      splashScreen => MaterialPageRoute(
          builder: (ctx) => const SplashScreen(),
        ),
      _ => MaterialPageRoute(builder: (ctx) => Placeholder())
    };
  }
}
