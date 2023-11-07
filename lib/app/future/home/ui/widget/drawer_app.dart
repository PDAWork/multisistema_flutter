import 'package:flutter/material.dart';

class DrawerApp extends StatelessWidget {
  const DrawerApp({super.key});

  // TODO email
  final String emailPerson = "pahomovdaniil02@yandex.ru";
  // TODO userName
  final String userNamePerson = "Пахомов Даниил";

  @override
  Widget build(BuildContext context) {
    return Drawer(
      // backgroundColor: ThemeApp.primaryColor,
      child: ListView(

        physics: const PageScrollPhysics() , //const AlwaysScrollableScrollPhysics()
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        children: [
          UserAccountsDrawerHeader(
            margin: EdgeInsets.zero,
            currentAccountPicture: const Icon(
              Icons.person,
              size: 60,
            ),
            currentAccountPictureSize: Size.square(1),
            accountEmail: Text(emailPerson),
            accountName: Text(
              userNamePerson,
            ),
           
          ),
          ListTile(
            onTap: () {},
            leading: const Icon(Icons.payment),
            title: const Text('Баланс 110 руб'),
          ),
          ListTile(
            onTap: () {},
            leading: const Icon(Icons.video_collection),
            title: const Text('Инструкция'),
          ),
          ListTile(
            onTap: () {},
            leading: const Icon(Icons.share),
            title: Text('Инструкция'),
          ),
          ListTile(
            onTap: () {},
            leading: const Icon(Icons.star_border),
            title: const Text('Инструкция'),
          ),
          ListTile(
            onTap: () {},
            leading: const Icon(Icons.info_outline),
            title: const Text('Инструкция'),
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
            title: const Text('Инструкция'),
          ),
          ListTile(
            onTap: () {},
            leading: const Icon(Icons.send),
            title: const Text('Инструкция'),
          ),
          ListTile(
            onTap: () {
              Navigator.pushNamedAndRemoveUntil(
                  context, Navigator.defaultRouteName, (route) => false);
            },
            leading: const Icon(Icons.login_outlined),
            title: const Text('Инструкция'),
          ),
        ],
      ),
    );
  }
}
