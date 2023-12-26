import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:multisitema_flutter/app/di/locator_service.dart';
import 'package:multisitema_flutter/app/features/auth/presentation/cubit/sign_in_cubit.dart';
import 'package:multisitema_flutter/app/features/splashscreen/ui/state/cubit/splash_screen_cubit.dart';
import 'package:multisitema_flutter/app/future/auth/presentation/ui/sign_in.dart';
import 'package:multisitema_flutter/app/future/home/ui/home.dart';
import 'package:multisitema_flutter/app/future/information/presentation/information.dart';
import 'package:multisitema_flutter/app/future/pay/presentation/pay.dart';
import 'package:multisitema_flutter/app/future/splashscreen/ui/splash_screen.dart';
import 'package:provider/provider.dart';

class Nav {
  static const String signIn = "/sign_in";
  static const String info = "/info";
  static const String splashScreen = "/splash_creen";
  static const String home = "/home";
  static const String pay = "/pay";

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: signIn,
        builder: (context, state) => BlocProvider(
          create: (context) => sl<SignInCubit>(),
          child: SignIn(),
        ),
      ),
      GoRoute(
        path: info,
        builder: (context, state) => ChangeNotifierProvider(
          create: (context) => sl<PageViewProvider>(),
          child: const Information(),
        ),
      ),
      GoRoute(
        path: splashScreen,
        builder: (context, state) => const SplashScreen(),
      )
    ],
  );

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    return switch (settings.name) {
      home => MaterialPageRoute(
          builder: (ctx) => const Home(),
        ),
      signIn => MaterialPageRoute(
          builder: (ctx) => SignIn(),
        ),
      info => MaterialPageRoute(
          builder: (ctx) => ChangeNotifierProvider(
            create: (context) => PageViewProvider(),
            child: const Information(),
          ),
        ),
      pay => MaterialPageRoute(builder: (_) => Pay()),
      splashScreen => MaterialPageRoute(
          builder: (ctx) => BlocProvider(
            create: (context) => sl<SplashScreenCubit>()..init(),
            child: const SplashScreen(),
          ),
        ),
      _ => MaterialPageRoute(builder: (ctx) => const Placeholder())
    };
  }
}
