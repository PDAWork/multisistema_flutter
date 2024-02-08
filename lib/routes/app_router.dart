import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:multisitema_flutter/di/locator_service.dart';
import 'package:multisitema_flutter/features/auth/domain/entity/role_entity.dart';
import 'package:multisitema_flutter/features/auth/presentation/cubit/sign_in_cubit.dart';
import 'package:multisitema_flutter/features/auth/presentation/ui/sign_in.dart';
import 'package:multisitema_flutter/features/master/home/presentation/ui/home_master.dart';
import 'package:multisitema_flutter/features/user/home/presentation/bloc/drop_down_button_app/drop_down_button_app_bloc.dart';
import 'package:multisitema_flutter/features/user/home/presentation/bloc/home/home_bloc.dart';
import 'package:multisitema_flutter/features/user/home/presentation/cubit/splash_screen/splash_screen_cubit.dart';
import 'package:multisitema_flutter/features/user/home/presentation/home.dart';
import 'package:multisitema_flutter/features/user/home/presentation/splash_screen.dart';
import 'package:multisitema_flutter/features/user/information/presentation/information.dart';
import 'package:multisitema_flutter/core/service/auth_provider.dart';
import 'package:provider/provider.dart';

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
          final isLoggedIn = context.read<AuthProvider>().isLoginGet;
          final isLoginRoute = state.matchedLocation == Pages.singIn.screenPath;
          if (isLoggedIn && isLoginRoute) {
            return switch (context.read<AuthProvider>().role) {
              RoleEntity.master => Pages.homeMaster.screenPath,
              RoleEntity.user => Pages.splashScreen.screenPath,
            };
          }
          return state.matchedLocation;
        },
        path: Pages.singIn.screenPath,
        name: Pages.singIn.screenName,
        builder: (context, state) => BlocProvider(
          create: (context) => service<SignInCubit>(),
          child: SignIn(),
        ),
      ),
      GoRoute(
        path: Pages.info.screenPath,
        name: Pages.info.screenName,
        builder: (context, state) => ChangeNotifierProvider(
          create: (context) => service<PageViewProvider>(),
          child: const Information(),
        ),
      ),
      GoRoute(
        path: Pages.splashScreen.screenPath,
        name: Pages.splashScreen.screenName,
        builder: (context, state) => BlocProvider(
          create: (context) => service<SplashScreenCubit>(),
          child: const SplashScreen(),
        ),
      ),
      GoRoute(
        path: Pages.homeUser.screenPath,
        name: Pages.homeUser.screenName,
        builder: (context, state) => MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (_) => service<DropDownButtonAppBloc>()
                ..add(DropDownButtonAppInit()),
            ),
            BlocProvider(create: (_) => service<HomeBloc>())
          ],
          child: const Home(),
        ),
      ),
      GoRoute(
          path: Pages.homeMaster.screenPath,
          name: Pages.homeMaster.screenName,
          builder: (_, state) => const HomeMaster()),
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
