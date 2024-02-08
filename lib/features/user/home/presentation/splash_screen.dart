import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multisitema_flutter/core/widget/snack_bar.dart';
import 'package:multisitema_flutter/features/user/home/presentation/cubit/splash_screen/splash_screen_cubit.dart';
import 'package:multisitema_flutter/routes/app_router.dart';
import 'package:multisitema_flutter/routes/router_utils.dart';
import 'package:multisitema_flutter/style/app_theme.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SafeArea(
        bottom: true,
        child: Stack(
          children: [
            Align(
                alignment: Alignment.center,
                child: BlocConsumer<SplashScreenCubit, SplashScreenState>(
                  listener: (context, state) {
                    if (state is SuccesState) {
                      AppRouter.router.go(Pages.homeUser.screenPath);
                    }
                    if (state is ErrorState) {
                      showMessageDialog(state.message, context);
                    }
                  },
                  builder: (context, state) {
                    return switch (state) {
                      LoadState(:final firstName) => Text(
                          "${style().$1} $firstName,",
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      _ => const SizedBox(),
                    };
                  },
                )),
            const Align(
              alignment: Alignment.bottomCenter,
              child: LinearProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                backgroundColor: Colors.black12,
              ),
            )
          ],
        ),
      ),
    );
  }
}
