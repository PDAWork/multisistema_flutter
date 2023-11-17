import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multisitema_flutter/app/future/splashscreen/ui/state/cubit/splash_screen_cubit.dart';
import 'package:provider/provider.dart';

import '../../../../utils/nav.dart';
import '../../../../utils/settings_provider.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: BlocConsumer<SplashScreenCubit, SplashScreenState>(
        listener: (context, state) {
          if (state is SuccessSplashScreen) {
            Navigator.pushNamedAndRemoveUntil(
                context, Nav.home, (route) => false);
          }
          if (state is AuthExeptionSplashScreen) {
            context.read<SplashScreenCubit>().init();
          }
          if (state is ExeptionSplashScreen) {
            context
                .read<SettingsProvider>()
                .showMessageDialog(state.message, context);
            Future.delayed(
              const Duration(seconds: 1),
              () {
                Navigator.pushNamedAndRemoveUntil(
                    context, Nav.signIn, (route) => false);
              },
            );
          }
        },
        builder: (context, state) {
          return Stack(
            children: [
              Align(
                alignment: Alignment.center,
                child: Text(
                  "${context.select<SettingsProvider, String>((value) => value.greeting())}\n ${state.firstName}",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: LinearProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    backgroundColor: Colors.black12,
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
