import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multisitema_flutter/app/future/home/ui/state/cubit/drop_down_button_app_cubit.dart';
import 'package:multisitema_flutter/app/future/home/ui/state/cubit/home_cubit.dart';

import '../../../../../utils/theme_app.dart';

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
          onTap: (value) async {
            switch (value) {
              case 0:
                {
                  DateTime? date = await showDatePicker(
                    context: context,
                    initialDate: context.read<HomeCubit>().date,
                    firstDate: DateTime(1950),
                    lastDate: DateTime.now(),
                  );
                  if (date != null) {
                    context.read<HomeCubit>().date = date;
                  }
                  final stateDrop =
                      context.read<DropDownButtonAppCubit>().state;
                  if (stateDrop is DropDownButtonAppSeccues) {
                    context.read<HomeCubit>().onDropChangedObject(
                          stateDrop.item.id.toString(),
                          dateTime: date,
                        );
                  }
                  break;
                }
            }
          },
          showUnselectedLabels: true,
          selectedItemColor: ThemeApp.primaryColor,
          unselectedItemColor: ThemeApp.primaryColor,
          selectedLabelStyle: const TextStyle(fontSize: 12, color: Colors.grey),
          unselectedLabelStyle:
              const TextStyle(fontSize: 12, color: Colors.grey),
          useLegacyColorScheme: false,
          items: [
            BottomNavigationBarItem(
              icon: const Icon(
                Icons.date_range,
              ),
              label: context.watch<HomeCubit>().selectDateTime,
            ),
            const BottomNavigationBarItem(
              icon: Icon(
                Icons.equalizer,
              ),
              label: "Статистика",
            ),
            const BottomNavigationBarItem(
              icon: Icon(
                Icons.mail,
              ),
              label: "Отправка",
            ),
            const BottomNavigationBarItem(
              icon: Icon(
                Icons.history,
              ),
              label: "Журнал",
            ),
          ],
        ),
      ],
    );
  }
}
