import 'package:flutter/material.dart';
import 'package:multisitema_flutter/app/style/color.dart';

class BottomNavigationBarApp extends StatelessWidget {
  const BottomNavigationBarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Divider(
          height: 1,
          color: Color.fromARGB(100, 204, 204, 204),
        ),
        BottomNavigationBar(
          onTap: (value) async {},
          showUnselectedLabels: true,
          selectedItemColor: primaryColor,
          unselectedItemColor: primaryColor,
          selectedLabelStyle: const TextStyle(fontSize: 12, color: Colors.grey),
          unselectedLabelStyle:
              const TextStyle(fontSize: 12, color: Colors.grey),
          useLegacyColorScheme: false,
          items: [
            BottomNavigationBarItem(
              icon: const Icon(
                Icons.date_range,
              ),
              label: DateTime.now().toString(),
            ),
            const BottomNavigationBarItem(
              icon: Icon(
                Icons.equalizer,
              ),
              label: "Статистика",
            ),
            // const BottomNavigationBarItem(
            //   icon: Icon(
            //     Icons.mail,
            //   ),
            //   label: "Отправка",
            // ),
            // const BottomNavigationBarItem(
            //   icon: Icon(
            //     Icons.history,
            //   ),
            //   label: "Журнал",
            // ),
          ],
        ),
      ],
    );
  }
}
