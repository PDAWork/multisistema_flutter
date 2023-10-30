import 'package:flutter/material.dart';
import 'package:multisitema_flutter/app/ui/auth/sign_in.dart';
import 'package:multisitema_flutter/utils/nav.dart';
import 'package:multisitema_flutter/utils/settings_provider.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context) => SettingsProvider(),
      child: MaterialApp(
        theme: ThemeData(
          primaryColor: const Color(0xfffBF1E27),
          textButtonTheme: const TextButtonThemeData(
            style: ButtonStyle(
              foregroundColor: MaterialStatePropertyAll(Colors.white),
            ),
          ),
        ),
        initialRoute: Nav.signIn,
        onGenerateRoute: Nav.onGenerateRoute,
      ),
    );
  }
}
