import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:multisitema_flutter/app/features/home/domain/entity/sensor_entity.dart';
import 'package:multisitema_flutter/app/style/color.dart';

class ItemCardSensor extends StatelessWidget {
  const ItemCardSensor({super.key, required this.sensor});

  final SensorEntity sensor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 7,
        horizontal: 10,
      ),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(width: 1, color: Color(0xFFDEDEDE)),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          "${sensor.rssi} dBm",
                          style:
                              Theme.of(context).textTheme.labelMedium!.copyWith(
                                    color: colorTextColor,
                                  ),
                        ),
                        const SizedBox(width: 5),
                        Image.asset(
                          signalIconPath(sensor.rssi),
                          width: 16,
                        )
                      ],
                    ),
                    Text(
                      sensor.name == '' ? 'Контроллер' : sensor.name,
                      style: Theme.of(context).textTheme.labelMedium!.copyWith(
                            color: colorTextColor,
                          ),
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.cloud_upload_rounded,
                          size: 16,
                          color: colorTextColor,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          DateFormat('dd.MM.yyyy kk:mm')
                              .format(sensor.lastConnection),
                          style:
                              Theme.of(context).textTheme.labelMedium!.copyWith(
                                    color: colorTextColor,
                                  ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              // TODO пока не хнаю что с эти делать
              // Expanded(
              //   child: Align(
              //     alignment: Alignment.bottomCenter,
              //     child: Text(
              //       sensor.checkPeriodDipslay,
              //       style: const TextStyle(
              //         color: colorTextColor,
              //       ),
              //     ),
              //   ),
              // ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "${sensor.batery} %",
                          style:
                              Theme.of(context).textTheme.labelMedium!.copyWith(
                                    color: colorTextColor,
                                  ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        RotatedBox(
                          quarterTurns: 45,
                          child: Icon(
                            bataryIcon(sensor.batery),
                            size: 16,
                            color: colorTextColor,
                          ),
                        )
                      ],
                    ),
                    Text(
                      sensor.sn,
                      style: const TextStyle(
                        color: colorTextColor,
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          Icons.storage_outlined,
                          size: 16,
                          color: colorTextColor,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          DateFormat('dd.MM.yyyy kk:mm')
                              .format(sensor.requestDate ?? DateTime.now()),
                          style:
                              Theme.of(context).textTheme.labelMedium!.copyWith(
                                    color: colorTextColor,
                                  ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
          sensor.lastConnectionWarning.isEmpty
              ? const SizedBox()
              : Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Text(
                    sensor.lastConnectionWarning,
                    style: Theme.of(context).textTheme.labelMedium!.copyWith(
                          color: primaryColor,
                        ),
                  ),
                )
        ],
      ),
    );
  }

  String signalIconPath(String rssi) {
    if (int.parse(rssi) >= -59) {
      return 'assets/network_5.png';
    } else if (int.parse(rssi) >= -69) {
      return 'assets/network_4.png';
    } else if (int.parse(rssi) >= -79) {
      return 'assets/network_3.png';
    } else if (int.parse(rssi) >= -89) {
      return 'assets/network_2.png';
    }
    return 'assets/network_1.png';
  }

  IconData bataryIcon(int charge) {
    if (charge == 0) return Icons.battery_alert_rounded;
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
    }
    return Icons.battery_full;
  }
}
