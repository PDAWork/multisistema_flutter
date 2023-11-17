import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multisitema_flutter/app/core/hive_helper.dart';
import 'package:multisitema_flutter/app/future/auth/data/data_sources/auth_local_data_source_impl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../utils/locator_service.dart';
import '../../../../../utils/nav.dart';

class DrawerAppController with ChangeNotifier {
  final AuthLocalDataSource authLocalDataSource;

  DrawerAppController({required this.authLocalDataSource});

  void init() {
    final userProfile = authLocalDataSource.getUserProfile();
    _emailPerson = userProfile.email;
    _userNamePerson = userProfile.firstName;
  }

  String _emailPerson = '';
  String get emailPerson => _emailPerson;
  String _userNamePerson = '';
  String get userNamePerson => _userNamePerson;
}

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
          UserAccountsDrawerHeader(
            margin: EdgeInsets.zero,
            currentAccountPicture: const Icon(
              Icons.person,
              size: 60,
            ),
            currentAccountPictureSize: const Size.square(1),
            accountEmail: Text(context.read<DrawerAppController>().emailPerson),
            accountName:
                Text(context.read<DrawerAppController>().userNamePerson),
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
            title: const Text('Инструкция'),
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
            onTap: () async {
              await sl<SharedPreferences>().clear();
              sl<HiveHelper>().clearHive().then((value) {
                Navigator.pushNamedAndRemoveUntil(
                    context, Nav.signIn, (route) => false);
              });
            },
            leading: const Icon(Icons.login_outlined),
            title: const Text('Инструкция'),
          ),
        ],
      ),
    );
  }
}
