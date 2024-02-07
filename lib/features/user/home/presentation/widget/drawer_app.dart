import 'package:flutter/material.dart';
import 'package:multisitema_flutter/style/color.dart';

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
            leading: const Icon(Icons.payment),
            title:
                // title: Row(
                //   crossAxisAlignment: CrossAxisAlignment.center,
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                const Text('Баланс 110 руб'),
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
