import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:multisitema_flutter/app/features/home/presentation/cubit/drop_down_button_app_cubit.dart';
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
        BlocBuilder<DropDownButtonAppCubit, DropDownButtonAppState>(
          builder: (context, state) {
            return BottomNavigationBar(
              onTap: (value) async {
                switch (value) {
                  case 0:
                    {
                      DateTime? date = await showDatePicker(
                        context: context,
                        initialDate: state.date,
                        firstDate: DateTime(1950),
                        lastDate: DateTime.now(),
                      );
                      if (date != null) {
                        context
                            .read<DropDownButtonAppCubit>()
                            .onSelectDate(date);
                      }
                    }
                }
              },
              showUnselectedLabels: true,
              selectedItemColor: primaryColor,
              unselectedItemColor: primaryColor,
              selectedLabelStyle:
                  const TextStyle(fontSize: 12, color: Colors.grey),
              unselectedLabelStyle:
                  const TextStyle(fontSize: 12, color: Colors.grey),
              useLegacyColorScheme: false,
              items: [
                BottomNavigationBarItem(
                  icon: const Icon(
                    Icons.date_range,
                  ),
                  label: DateFormat('dd.MM.yyyy').format(state.date),
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
            );
          },
        ),
      ],
    );
  }
}
