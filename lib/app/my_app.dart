import 'package:flutter/material.dart';
import 'package:multisitema_flutter/app/service/auth_provider.dart';
import 'package:multisitema_flutter/app/style/app_theme.dart';
import 'package:provider/provider.dart';

import 'routes/app_router.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context) => AuthProvider(),
      child: MaterialApp.router(
        routeInformationProvider: AppRouter.router.routeInformationProvider,
        routeInformationParser: AppRouter.router.routeInformationParser,
        routerDelegate: AppRouter.router.routerDelegate,
        theme: appTheme,
      ),
    );
  }
}
