import 'package:flutter/material.dart';
import 'package:multisitema_flutter/app/ui/auth/widget/custom_icon_auth.dart';

import '../../../utils/nav.dart';

class SignIn extends StatelessWidget {
  SignIn({super.key});

  bool isFinger = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            bottom: -MediaQuery.of(context).viewInsets.bottom,
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
                    child: const Row(
                      children: [
                        CustomIconAuth(
                          icon: Icons.lock,
                          iconColor: Colors.white,
                        ),
                        SizedBox(width: 20),
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
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
                          child: const Row(
                            children: [
                              CustomIconAuth(
                                icon: Icons.person,
                                iconColor: Colors.white,
                              ),
                              SizedBox(width: 20),
                              Expanded(
                                child: TextField(
                                  decoration: InputDecoration(
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
                          : SizedBox(
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
                        style: TextStyle(color: Color(0xfff9c9c9c)),
                      )),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        style: const ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(
                            Color(0xfffbf1e27),
                          ),
                        ),
                        onPressed: () {
                          Navigator.pushNamedAndRemoveUntil(
                            context,
                            Nav.info,
                            (t) => false,
                          );
                        },
                        child: const Text('Войти')),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    child: Text(
                      'Демо режим',
                      style: TextStyle(color: Color(0xfffBBDEFB)),
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
