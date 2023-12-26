import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:multisitema_flutter/app/di/locator_service.dart';
import 'package:multisitema_flutter/app/features/auth/presentation/cubit/sign_in_cubit.dart';
import 'package:multisitema_flutter/app/features/auth/presentation/ui/sign_in.dart';
import 'package:multisitema_flutter/app/features/splashscreen/ui/splash_screen.dart';
import 'package:multisitema_flutter/app/service/AuthProvider.dart';
import 'package:provider/provider.dart';

import '../features/information/presentation/information.dart';
import 'router_utils.dart';

class AppRouter {
  static final _rootNavigatorKey = GlobalKey<NavigatorState>();

  static GoRouter get router => _router;

  static final GoRouter _router = GoRouter(
    debugLogDiagnostics: true,
    navigatorKey: _rootNavigatorKey,
    routes: [
      GoRoute(
        redirect: (context, state) {
          final isLoggedIn = !context.read<AuthProvider>().isLoginGet;
          final isLoginRoute = state.matchedLocation == Pages.singIn.screenPath;
          if (isLoggedIn && isLoginRoute) {
            return Pages.info.screenPath;
          }
          return state.matchedLocation;
        },
        path: Pages.singIn.screenPath,
        name: Pages.singIn.screenName,
        builder: (context, state) => BlocProvider(
          create: (context) => sl<SignInCubit>(),
          child: SignIn(),
        ),
      ),
      GoRoute(
        path: Pages.info.screenPath,
        name: Pages.info.screenName,
        builder: (context, state) => ChangeNotifierProvider(
          create: (context) => sl<PageViewProvider>(),
          child: const Information(),
        ),
      ),
      GoRoute(
        path: Pages.splashScreen.screenPath,
        name: Pages.splashScreen.screenName,
        builder: (context, state) => const SplashScreen(),
      )
    ],
  );

  // static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
  //   return switch (settings.name) {
  //     home => MaterialPageRoute(
  //         builder: (ctx) => const Home(),
  //       ),
  //     signIn => MaterialPageRoute(
  //         builder: (ctx) => SignIn(),
  //       ),
  //     info => MaterialPageRoute(
  //         builder: (ctx) => ChangeNotifierProvider(
  //           create: (context) => PageViewProvider(),
  //           child: const Information(),
  //         ),
  //       ),
  //     pay => MaterialPageRoute(builder: (_) => Pay()),
  //     splashScreen => MaterialPageRoute(
  //         builder: (ctx) => BlocProvider(
  //           create: (context) => sl<SplashScreenCubit>()..init(),
  //           child: SplashScreen(),
  //         ),
  //       ),
  //     _ => MaterialPageRoute(builder: (ctx) => const Placeholder())
  //   };
  // }
}
