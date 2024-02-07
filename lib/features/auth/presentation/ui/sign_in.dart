import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multisitema_flutter/core/widget/snack_bar.dart';
import 'package:multisitema_flutter/features/auth/presentation/cubit/sign_in_cubit.dart';
import 'package:multisitema_flutter/routes/app_router.dart';
import 'package:multisitema_flutter/routes/router_utils.dart';
import 'package:multisitema_flutter/style/color.dart';
import 'widget/custom_icon_auth.dart';

// ignore: must_be_immutable
class SignIn extends StatelessWidget {
  SignIn({super.key});
  bool isFinger = false;

  TextEditingController login = TextEditingController();
  TextEditingController password = TextEditingController();

  void _dispose() {
    login.dispose();
    password.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            bottom: MediaQuery.of(context).viewInsets.bottom,
            child: const DecoratedBox(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/sign_bg.png"),
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Spacer(),
                  Image.asset(
                    'assets/logo_multi.png',
                    height: 100,
                  ),
                  const Spacer(
                    flex: 2,
                  ),
                  Container(
                    color: Colors.white,
                    child: Row(
                      children: [
                        const CustomIconAuth(
                          icon: Icons.lock,
                          iconColor: Colors.white,
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          child: TextField(
                            controller: login,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: "Email",
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 15),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          color: Colors.white,
                          child: Row(
                            children: [
                              const CustomIconAuth(
                                icon: Icons.person,
                                iconColor: Colors.white,
                              ),
                              const SizedBox(width: 20),
                              Expanded(
                                child: TextField(
                                  controller: password,
                                  decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Пароль",
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      isFinger
                          ? Padding(
                              padding: const EdgeInsets.only(left: 12),
                              child: InkWell(
                                onTap: () {},
                                child: Image.asset(
                                  'assets/fingerprint.png',
                                  height: 51,
                                ),
                              ),
                            )
                          : const SizedBox(
                              width: 0,
                            )
                    ],
                  ),
                  Container(
                      margin: const EdgeInsets.only(
                        top: 15,
                        bottom: 20,
                      ),
                      alignment: Alignment.centerRight,
                      child: const Text(
                        'Восстановить пароль',
                        style: TextStyle(color: Color(0xff9c9c9c)),
                      )),

                  BlocConsumer<SignInCubit, SignInState>(
                    listener: (context, state) {
                      if (state is AuthorizationState) {
                        AppRouter.router.go(Pages.info.screenPath);
                      }
                      if (state is ErrorState) {
                        showMessageDialog(state.message, context);
                      }
                      if (state is SeccuceState) {
                        AppRouter.router.go(Pages.info.screenPath);
                      }
                    },
                    builder: (context, state) {
                      return switch (state) {
                        LoadingState() =>
                          const Center(child: CircularProgressIndicator()),
                        _ => SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              style: const ButtonStyle(
                                backgroundColor: MaterialStatePropertyAll(
                                  primaryColor,
                                ),
                              ),
                              onPressed: () async {
                                context.read<SignInCubit>().signIn(
                                      login.text,
                                      password.text,
                                    );
                              },
                              child: const Text(
                                'Войти',
                              ),
                            ),
                          ),
                      };
                    },
                  ),
                  const SizedBox(height: 30)
                  // TODO потом решить что делать с демо режимом
                  // Padding(
                  //   padding: const EdgeInsets.symmetric(vertical: 15),
                  //   child: InkWell(
                  //     onTap: () {},
                  //     child: const Text(
                  //       'Демо режим',
                  //       style: TextStyle(color: ThemeApp.colorTextDemo),
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
