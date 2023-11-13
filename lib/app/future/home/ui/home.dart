import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:multisitema_flutter/app/data/dto/sensor/meters/type_dto.dart';
import 'package:multisitema_flutter/utils/theme_app.dart';

import 'state/cubit/home_cubit.dart';
import 'widget/drawer_app.dart';
import 'widget/drop_down_button_app.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        title: const DropdownButtonApp(
          items: [
            "Москва, Гризодубовой, 4к1",
            "Москва, 1-й Магистральный тупик , 11с1",
            "Москва, 1-й Магистральный тупик , 11с1",
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
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          if (state is HomeLoad) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is HomeSeccues) {
            final list = context.watch<HomeCubit>().listSensor;
            return ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: list.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Column(
                      children: list[index].metersList.map(
                        (e) {
                          return Container(
                            decoration: const BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                    width: 1, color: Color(0xFFDEDEDE)),
                              ),
                            ),
                            child: ListTile(
                              leading: typeIcon(e.type),
                              title: Text(e.vals.first),
                              subtitle: Text("${e.meterName} ${e.sn}"),
                            ),
                          );
                        },
                      ).toList(),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 7,
                        horizontal: 10,
                      ),
                      decoration: const BoxDecoration(
                        border: Border(
                          bottom:
                              BorderSide(width: 1, color: Color(0xFFDEDEDE)),
                        ),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Expanded(
                            flex: 2,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      "${list[index].rssi} dBm",
                                      style: const TextStyle(
                                        color: ThemeApp.colorItemController,
                                      ),
                                    ),
                                    const SizedBox(width: 5),
                                    signalIcon(list[index].rssi)
                                  ],
                                ),
                                Text(
                                  list[index].name == ''
                                      ? 'Контроллер'
                                      : list[index].name,
                                  style: const TextStyle(
                                    color: ThemeApp.colorItemController,
                                  ),
                                ),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.cloud_upload_rounded,
                                      size: 18,
                                      color: ThemeApp.colorItemController,
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      DateFormat('dd.MM.yyyy kk:mm')
                                          .format(list[index].lastConnection),
                                      style: const TextStyle(
                                        color: ThemeApp.colorItemController,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: Text(
                                list[index].checkPeriodDisplay,
                                style: const TextStyle(
                                  color: ThemeApp.colorItemController,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      "${list[index].bat} %",
                                      style: const TextStyle(
                                        color: ThemeApp.colorItemController,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    RotatedBox(
                                      quarterTurns: 45,
                                      child: Icon(
                                        bataryIcon(list[index].bat),
                                        size: 18,
                                        color: ThemeApp.colorItemController,
                                      ),
                                    )
                                  ],
                                ),
                                Text(
                                  list[index].sn,
                                  style: const TextStyle(
                                    color: ThemeApp.colorItemController,
                                  ),
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const Icon(
                                      Icons.storage_outlined,
                                      size: 18,
                                      color: ThemeApp.colorItemController,
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      DateFormat('dd.MM.yyyy kk:mm')
                                          .format(list[index].requestDt),
                                      style: const TextStyle(
                                        color: ThemeApp.colorItemController,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                );
              },
            );
          }
          return const Text('Упc техническая ошибка');
        },
      ),
    );
  }

  IconData bataryIcon(int charge) {
    if (charge == 0) {
      return Icons.battery_alert_rounded;
    }
    if (charge <= 14) {
      return Icons.battery_0_bar_rounded;
    } else if (charge <= 28) {
      return Icons.battery_1_bar_rounded;
    } else if (charge <= 42) {
      return Icons.battery_2_bar_rounded;
    } else if (charge <= 56) {
      return Icons.battery_4_bar_rounded;
    } else if (charge <= 70) {
      return Icons.battery_5_bar_rounded;
    } else if (charge <= 84) {
      return Icons.battery_6_bar_rounded;
    } else {
      return Icons.battery_full;
    }
  }

  Image typeIcon(TypeDTO typeSensor) {
    return switch (typeSensor.number) {
      0 => Image.asset(
          'assets/ic_unknown.png',
        ),
      1 => Image.asset(
          'assets/ic_cold_water.png',
        ),
      2 => Image.asset(
          'assets/ic_warm_water.png',
        ),
      _ => Image.asset(
          'assets/ic_unknown.png',
        )
    };
  }

  Image signalIcon(String rssi) {
    if (int.parse(rssi) >= -59) {
      return Image.asset(
        'assets/network_5.png',
        width: 20,
      );
    } else if (int.parse(rssi) >= -69) {
      return Image.asset(
        'assets/network_4.png',
        width: 20,
      );
    } else if (int.parse(rssi) >= -79) {
      return Image.asset(
        'assets/network_3.png',
        width: 20,
      );
    } else if (int.parse(rssi) >= -89) {
      return Image.asset(
        'assets/network_2.png',
        width: 20,
      );
    } else {
      return Image.asset(
        'assets/network_1.png',
        width: 20,
      );
    }
  }
}
