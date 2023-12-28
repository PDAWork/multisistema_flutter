import 'package:flutter/material.dart';

class DrawerApp extends StatelessWidget {
  const DrawerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      // backgroundColor: ThemeApp.primaryColor,
      child: ListView(
        physics:
            const PageScrollPhysics(), //const AlwaysScrollableScrollPhysics()
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
            leading: const Icon(Icons.payment),
            title: const Text('Баланс 110 руб'),
          ),
          ListTile(
            onTap: () {},
            leading: const Icon(Icons.info_outline),
            title: const Text('О приложении'),
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
            title: const Text('Настройки'),
          ),
          // ListTile(
          //   onTap: () {},
          //   leading: const Icon(Icons.send),
          //   title: const Text('Поддержка'),
          // ),
          ListTile(
            onTap: () {},
            leading: const Icon(Icons.login_outlined),
            title: const Text('Выход'),
          ),
        ],
      ),
    );
  }
}
