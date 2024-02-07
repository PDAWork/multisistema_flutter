import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:multisitema_flutter/app/features/home/presentation/bloc/drop_down_button_app/drop_down_button_app_bloc.dart';
import 'package:multisitema_flutter/app/style/color.dart';
import 'package:provider/provider.dart';

class BottomNavigationBarApp extends StatelessWidget {
  const BottomNavigationBarApp({super.key});

  @override
  Widget build(BuildContext context) {
    final dateBloc =
        context.select((DropDownButtonAppBloc bloc) => bloc.state.date);
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
                    initialDate: dateBloc,
                    firstDate: DateTime(1950),
                    lastDate: DateTime.now(),
                  );
                  if (date != null) {
                    context.read<DropDownButtonAppBloc>().add(
                          DropDownButtonOnDateChangeEvent(date: date),
                        );
                  }
                }
            }
          },
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
              label: DateFormat('dd.MM.yyyy').format(dateBloc!),
            ),
            const BottomNavigationBarItem(
              icon: Icon(
                Icons.equalizer,
              ),
              label: "Статистика",
            ),
          ],
        ),
      ],
    );
  }
}
