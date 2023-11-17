import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multisitema_flutter/app/core/hive_helper.dart';
import 'package:multisitema_flutter/app/future/auth/data/data_sources/auth_local_data_source_impl.dart';
import 'package:multisitema_flutter/app/future/auth/ui/state/auth_cubit.dart';
import 'package:multisitema_flutter/app/future/home/ui/state/cubit/home_cubit.dart';
import 'package:multisitema_flutter/app/future/home/ui/widget/drawer_app.dart';
import 'package:multisitema_flutter/app/future/splashscreen/ui/splash_screen.dart';
import 'package:multisitema_flutter/app/future/splashscreen/ui/state/cubit/splash_screen_cubit.dart';
import 'package:provider/provider.dart';

import '../app/future/auth/ui/sign_in.dart';
import '../app/future/home/ui/home.dart';
import '../app/future/home/ui/state/cubit/drop_down_button_app_cubit.dart';
import '../app/future/information/ui/information.dart';
import 'locator_service.dart';

class Nav {
  static const String signIn = "/sign_in";
  static const String info = "/info";
  static const String splashScreen = "/splash_creen";
  static const String home = "/home";

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    return switch (settings.name) {
      home => MaterialPageRoute(
          builder: (ctx) => BlocProvider(
            create: (_) => DropDownButtonAppCubit(sl<HiveHelper>()),
            child: MultiBlocProvider(
              providers: [
                BlocProvider(
                  create: (context) => sl<HomeCubit>(),
                ),
                ChangeNotifierProvider(
                  create: (_) => DrawerAppController(
                      authLocalDataSource: sl<AuthLocalDataSource>())
                    ..init(),
                ),
              ],
              child: const Home(),
            ),
          ),
        ),
      signIn => MaterialPageRoute(
          builder: (ctx) => BlocProvider(
            create: (ctx) => sl<AuthCubit>(),
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
          builder: (ctx) => BlocProvider(
            create: (context) => sl<SplashScreenCubit>()..init(),
            child: SplashScreen(),
          ),
        ),
      _ => MaterialPageRoute(builder: (ctx) => const Placeholder())
    };
  }
}
