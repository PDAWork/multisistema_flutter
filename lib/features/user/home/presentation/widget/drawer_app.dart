import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multisitema_flutter/features/user/home/presentation/bloc/drawer_app/drawer_app_bloc.dart';
import 'package:multisitema_flutter/routes/app_router.dart';
import 'package:multisitema_flutter/routes/router_utils.dart';
import 'package:multisitema_flutter/style/color.dart';

class DrawerApp extends StatelessWidget {
  const DrawerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: BlocBuilder<DrawerAppBloc, DrawerAppState>(
        builder: (context, state) {
          return ListView(
            physics: const PageScrollPhysics(),
            padding: EdgeInsets.zero,
            shrinkWrap: false,
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                decoration: const BoxDecoration(color: primaryColor),
                child: SafeArea(
                  bottom: false,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        state.drawerAppEntity.fristName,
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(color: Colors.white),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        state.drawerAppEntity.email,
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .copyWith(color: Colors.white),
                      )
                    ],
                  ),
                ),
              ),
              ListTile(
                onTap: () {
                  Navigator.pop(context, true);
                  AppRouter.router.goNamed(
                    Pages.tariffObject.screenName,
                  );
                },
                leading: const Icon(Icons.payment),
                title: Text(
                  "${state.drawerAppEntity.balanceObject.floor()} ₽",
                  style: Theme.of(context).textTheme.labelLarge,
                ),
              ),
              ListTile(
                onTap: () {},
                leading: const Icon(Icons.info_outline),
                title: Text(
                  'О приложении',
                  style: Theme.of(context).textTheme.labelLarge,
                ),
              ),
              Divider(
                color: Colors.grey.shade400,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 5, bottom: 5),
                child: Text(
                  "Аккаунт",
                  style: Theme.of(context).textTheme.titleMedium,
                  textAlign: TextAlign.start,
                ),
              ),
              ListTile(
                onTap: () {},
                leading: const Icon(Icons.build),
                title: Text(
                  'Настройки',
                  style: Theme.of(context).textTheme.labelLarge,
                ),
              ),
              ListTile(
                onTap: () async {
                  context.read<DrawerAppBloc>().add(DrawerAppClearCacheEvent());
                  AppRouter.router.go(Pages.singIn.screenPath);
                },
                leading: const Icon(Icons.login_outlined),
                title: Text(
                  'Выход',
                  style: Theme.of(context).textTheme.labelLarge,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
