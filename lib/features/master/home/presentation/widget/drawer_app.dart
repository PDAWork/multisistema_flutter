import 'package:flutter/material.dart';

class DrawerApp extends StatelessWidget {
  const DrawerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        physics: const PageScrollPhysics(),
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        children: [
          const UserAccountsDrawerHeader(
            margin: EdgeInsets.zero,
            currentAccountPicture: Icon(
              Icons.person,
              size: 60,
            ),
            currentAccountPictureSize: Size.square(1),
            accountEmail: Text("pahomovdaniil02@yandex.ru"),
            accountName: Text("Пахомов Даниил Александрович"),
          ),
          ListTile(
            onTap: () {},
            leading: const Icon(
              Icons.info_outline,
            ),
            title: Text(
              'О приложении',
              style: Theme.of(context).textTheme.labelLarge,
            ),
          ),
          ListTile(
            onTap: () {},
            leading: const Icon(
              Icons.build,
            ),
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
            leading: const Icon(
              Icons.login_outlined,
            ),
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
