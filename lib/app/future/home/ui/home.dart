import 'package:flutter/material.dart';
import 'package:multisitema_flutter/utils/theme_app.dart';

import 'widget/drawer_app.dart';
import 'widget/drop_down_button_app.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const DropdownButtonApp(
          items: [
            "Дом 1",
            "Дом 2",
            "Дом 3",
          ],
        ),
      ),
      drawer: const DrawerApp(),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Divider(
            height: 1,
            color: Color.fromARGB(100, 204, 204, 204),
          ),
          BottomNavigationBar(
            showUnselectedLabels: true,
            selectedItemColor: ThemeApp.primaryColor,
            unselectedItemColor: ThemeApp.primaryColor,
            selectedLabelStyle:
                const TextStyle(fontSize: 12, color: Colors.grey),
            unselectedLabelStyle:
                const TextStyle(fontSize: 12, color: Colors.grey),
            useLegacyColorScheme: false,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.date_range,
                ),
                label: "01.11.2023",
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.equalizer,
                ),
                label: "Статистика",
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.mail,
                ),
                label: "Отправка",
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.history,
                ),
                label: "Журнал",
              ),
            ],
          ),
        ],
      ),
    );
  }
}
