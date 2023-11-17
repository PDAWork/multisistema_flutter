import 'package:flutter/material.dart';
import 'package:multisitema_flutter/app/data/dto/sensor/meters/meter_dto.dart';
import 'package:multisitema_flutter/app/data/dto/sensor/meters/type_dto.dart';
import 'package:multisitema_flutter/utils/theme_app.dart';

class ItemCardIndicators extends StatelessWidget {
  const ItemCardIndicators({super.key, required this.meter});
  final MeterDTO meter;

  @override
  Widget build(BuildContext context) {
    if (meter.type.number == 1 ||
        meter.type.number == 2 ||
        meter.type.number == 3 ||
        meter.type.number == 13) {
      return Container(
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(width: 1, color: Color(0xFFDEDEDE)),
          ),
        ),
        child: ListTile(
          leading: typeIcon(meter.type, meter.vals.firstOrNull ?? '0'),
          title: Text('${meter.vals.firstOrNull ?? "0"} ${meter.unit}'),
          subtitle: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                  "${meter.meterName == "" ? meter.type.name : meter.meterName} ${meter.sn}"),
              meter.state.numberError != null
                  ? meter.state.numberError != 0
                      ? Text(meter.state.nameError ?? '', style: TextStyle(color: ThemeApp.primaryColor),)
                      : const SizedBox()
                  : const SizedBox(),
            ],
          ),
        ),
      );
    }

    if (meter.type.number == 5) {
      return Container(
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(width: 1, color: Color(0xFFDEDEDE)),
          ),
        ),
        child: ListTile(
          leading: typeIcon(
            meter.type,
            meter.vals.firstOrNull ?? '0',
            stateNumber: meter.state.numberError!,
          ),
          title: Text('${meter.vals.firstOrNull ?? "0"} ${meter.unit}'),
          subtitle: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                  "${meter.meterName == "" ? meter.type.name : meter.meterName} ${meter.sn}"),
              meter.state.numberError != 0
                  ? Text(meter.state.nameError!)
                  : const SizedBox(),
            ],
          ),
        ),
      );
    }

    if (meter.type.number == 6) {
      final String titleText =
          (((meter.vals.firstOrNull ?? '0') == '0') ? meter.passiveText : meter.activeText)!;
      return Container(
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(width: 1, color: Color(0xFFDEDEDE)),
          ),
        ),
        child: ListTile(
          leading: Switch(
            value: false,
            onChanged: (value) {},
          ),
          title: Text(titleText.toString()),
          subtitle: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                  "${meter.meterName == "" ? meter.type.name : meter.meterName} ${meter.sn}"),
              meter.state.numberError != 0
                  ? Text(meter.state.nameError ?? '')
                  : const SizedBox(),
            ],
          ),
        ),
      );
    }
    if (meter.type.number == 8) {
      return Container(
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(width: 1, color: Color(0xFFDEDEDE)),
          ),
        ),
        child: ListTile(
          leading: typeIcon(
            meter.type,
            meter.vals.firstOrNull ?? '0',
            stateNumber: meter.state.numberError ?? 0,
          ),
          title: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('${meter.vals.firstOrNull ?? 0} ${meter.unit}'),
              Text(
                'T1:${meter.vals.firstOrNull ?? 0} T2:${meter.vals.lastOrNull ?? 0}',
                style: TextStyle(fontSize: 13),
              ),
            ],
          ),
          subtitle: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                  "${meter.meterName == "" ? meter.type.name : meter.meterName} ${meter.sn}"),
              meter.state.numberError != 0
                  ? Text(meter.state.nameError ?? '')
                  : const SizedBox(),
            ],
          ),
        ),
      );
    }
    if (meter.type.number == 10 || meter.type.number == 9) {
      final String titleText =
          (((meter.vals.firstOrNull ?? '0') == '0') ? meter.passiveText : meter.activeText)!;
      return Container(
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(width: 1, color: Color(0xFFDEDEDE)),
          ),
        ),
        child: ListTile(
          leading: typeIcon(meter.type, meter.vals.firstOrNull ?? '0'),
          title: Text(titleText.toString()),
          subtitle: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                  "${meter.meterName == "" ? meter.type.name : meter.meterName} ${meter.sn}"),
              meter.state.numberError != 0
                  ? Text(meter.state.nameError ?? '')
                  : const SizedBox(),
            ],
          ),
        ),
      );
    }
    return SizedBox();
  }

  Widget typeIcon(TypeDTO typeSensor, String vals, {int stateNumber = 0}) {
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
      3 => Image.asset(
          'assets/ic_gaz.png',
        ),
      5 => stateNumber != 0
          ? Image.asset(
              'assets/ic_temper_active.png',
            )
          : Image.asset(
              'assets/ic_temper.png',
            ),
      9 => vals == '0'
          ? Image.asset(
              'assets/ic_sensor.png',
            )
          : Image.asset(
              'assets/ic_sensor_active.png',
            ),
      8 => Image.asset(
          'assets/ic_electro.png',
        ),
      10 => vals == '0'
          ? Image.asset(
              'assets/ic_kran.png',
            )
          : Image.asset(
              'assets/ic_kran_active.png',
            ),
      13 => Image.asset(
          'assets/ic_heat.png',
        ),
      _ => Image.asset(
          'assets/ic_unknown.png',
        )
    };
  }
}
