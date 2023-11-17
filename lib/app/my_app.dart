import 'package:flutter/material.dart';
import 'package:multisitema_flutter/utils/nav.dart';
import 'package:multisitema_flutter/utils/settings_provider.dart';
import 'package:multisitema_flutter/utils/theme_app.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context) => SettingsProvider(),
      builder: (ctx, child) {
        return MaterialApp(
          theme: ThemeData(
            colorScheme:
                const ColorScheme.light(primary: ThemeApp.primaryColor),
            primaryColor: ThemeApp.primaryColor,
            appBarTheme: const AppBarTheme(
              backgroundColor: ThemeApp.primaryColor,
            ),
            textButtonTheme: const TextButtonThemeData(
              style: ButtonStyle(
                foregroundColor:
                    MaterialStatePropertyAll(ThemeApp.primaryColor),
              ),
            ),
          ),
          initialRoute: ctx.read<SettingsProvider>().isAuthGet
              ? Nav.splashScreen
              : Nav.signIn,
          onGenerateRoute: Nav.onGenerateRoute,
        );
      },
    );
  }
}
