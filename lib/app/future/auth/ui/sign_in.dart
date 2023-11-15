import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multisitema_flutter/app/future/auth/ui/state/auth_cubit.dart';
import 'package:multisitema_flutter/common/settings_provider.dart';
import 'package:multisitema_flutter/common/theme_app.dart';
import '../../../../common/nav.dart';
import 'widget/custom_icon_auth.dart';

class SignIn extends StatelessWidget {
  SignIn({super.key});

  bool isFinger = false;

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
                            controller: context.read<AuthCubit>().email,
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
                                  controller:
                                      context.read<AuthCubit>().password,
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
                  SizedBox(
                    width: double.infinity,
                    child: BlocConsumer<AuthCubit, AuthState>(
                      listener: (context, state) {
                        if (state is AuthSucess) {
                          FocusScope.of(context).unfocus();
                          Future.delayed(const Duration(milliseconds: 100))
                              .then(
                            (value) => Navigator.pushNamedAndRemoveUntil(
                              context,
                              Nav.info,
                              (t) => false,
                            ),
                          );
                          return;
                        }
                        if (state is AuthError) {
                          context.read<SettingsProvider>().showMessageDialog(
                                state.message,
                                context,
                              );
                        }
                      },
                      builder: (ctx, state) {
                        if (state is AuthLoading) {
                          return const Center(
                              child: CircularProgressIndicator());
                        }
                        return ElevatedButton(
                          style: const ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll(
                              ThemeApp.primaryColor,
                            ),
                          ),
                          onPressed: () {
                            context.read<AuthCubit>().login(isDemo: true);
                          },
                          child: const Text('Войти'),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: InkWell(
                      onTap: () {
                        context.read<AuthCubit>().login();
                      },
                      child: const Text(
                        'Демо режим',
                        style: TextStyle(color: ThemeApp.colorTextDemo),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
