import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multisitema_flutter/features/user/home/presentation/bloc/drop_down_button_app/drop_down_button_app_bloc.dart';
import 'package:multisitema_flutter/routes/app_router.dart';
import 'package:multisitema_flutter/routes/router_utils.dart';
import 'package:multisitema_flutter/style/color.dart';

class DrawerApp extends StatelessWidget {
  const DrawerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        physics: const PageScrollPhysics(),
        padding: EdgeInsets.zero,
        shrinkWrap: false,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            decoration: const BoxDecoration(color: primaryColor),
            child: SafeArea(
              bottom: false,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "pahomovdaniil02@yandex.ru",
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(color: Colors.white),
                  ),
                  SizedBox(height: 4),
                  Text(
                    "Пахомов Даниил Александрович",
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(color: Colors.white),
                  )
                ],
              ),
            ),
          ),
          // UserAccountsDrawerHeader(
          //   margin: EdgeInsets.zero,
          //   // currentAccountPicture: const Icon(
          //   //   Icons.person,
          //   //   size: 32,
          //   // ),
          //   // currentAccountPictureSize: const Size.square(1),
          //   accountEmail: Text(
          //     "pahomovdaniil02@yandex.ru",
          //     style: Theme.of(context)
          //         .textTheme
          //         .bodyMedium!
          //         .copyWith(color: Colors.white),
          //   ),
          //   accountName: Text(
          //     "Пахомов Даниил Александрович",
          //     style: Theme.of(context)
          //         .textTheme
          //         .labelLarge!
          //         .copyWith(color: Colors.white),
          //   ),
          // ),
          ListTile(
            onTap: () {
              final int objectId =
                  context.read<DropDownButtonAppBloc>().state.selectItem!.id;
              Navigator.pop(context, true);
              AppRouter.router.pushNamed(
                Pages.tariff.screenName,
                pathParameters: {
                  "objectId": "$objectId",
                },
              );
            },
            leading: const Icon(Icons.payment),
            title:
                // title: Row(
                //   crossAxisAlignment: CrossAxisAlignment.center,
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                Text(
              'Баланс 110 руб',
              style: Theme.of(context).textTheme.labelLarge,
            ),
            // Container(
            //   padding: const EdgeInsets.symmetric(
            //     horizontal: 7,
            //     vertical: 5,
            //   ),
            //   decoration: BoxDecoration(
            //     color: primaryColor,
            //     borderRadius: BorderRadius.circular(7),
            //   ),
            //   child: const Text(
            //     '1 месяц',
            //     style: const TextStyle(fontSize: 13, color: Colors.white),
            //   ),
            // )
            // ],
            // ),
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
          // ListTile(
          //   onTap: () {},
          //   leading: const Icon(Icons.send),
          //   title: const Text('Поддержка'),
          // ),
          ListTile(
            onTap: () {},
            leading: const Icon(Icons.login_outlined),
            title: Text(
              'Выход',
              style: Theme.of(context).textTheme.labelLarge,
            ),
          ),
        ],
      ),
    );
  }
}
