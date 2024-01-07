import 'package:flutter/material.dart';
import 'package:multisitema_flutter/app/features/home/domain/entity/meter_entity.dart';
import 'package:multisitema_flutter/app/features/home/domain/entity/type_meter_entity.dart';
import 'package:multisitema_flutter/app/style/color.dart';

class ItemCardIndicators extends StatelessWidget {
  const ItemCardIndicators({super.key, required this.meter});
  final MeterEntity meter;

  @override
  Widget build(BuildContext context) {
    if (meter.typeMeter.id == 1 ||
        meter.typeMeter.id == 2 ||
        meter.typeMeter.id == 3 ||
        meter.typeMeter.id == 13) {
      return Container(
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(width: 1, color: Color(0xFFDEDEDE)),
          ),
        ),
        child: ListTile(
          leading: typeIcon(meter.typeMeter, meter.metersVals.firstOrNull ?? 0),
          title: Text('${meter.metersVals.firstOrNull ?? "0"} '), // TODO unit
          subtitle: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                  "${meter.meterName == "" ? meter.typeMeter.name : meter.meterName} ${meter.snMeter}"),
              meter.state?.name != null
                  ? meter.state?.id != 0
                      ? Text(
                          meter.state?.name ?? "",
                          style: TextStyle(color: primaryColor),
                        )
                      : const SizedBox()
                  : const SizedBox(),
            ],
          ),
        ),
      );
    }

    if (meter.typeMeter.id == 5) {
      return Container(
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(width: 1, color: Color(0xFFDEDEDE)),
          ),
        ),
        child: ListTile(
          leading: typeIcon(
            meter.typeMeter,
            meter.metersVals.firstOrNull ?? 0,
            stateNumber: meter.state?.id ?? 0,
          ),
          title: Text('${meter.metersVals.firstOrNull ?? 0} '), // TODO unit
          subtitle: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                  "${meter.meterName == "" ? meter.typeMeter.name : meter.meterName} ${meter.snMeter}"),
              (meter.state?.id ?? 0) != 0
                  ? Text(meter.state?.name ?? "")
                  : const SizedBox(),
            ],
          ),
        ),
      );
    }

    if (meter.typeMeter.id == 6) {
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
          title: Text(meter.infoText),
          subtitle: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                  "${meter.meterName == "" ? meter.typeMeter.name : meter.meterName} ${meter.snMeter}"),
              meter.state?.id != 0
                  ? Text(meter.state?.name ?? '')
                  : const SizedBox(),
            ],
          ),
        ),
      );
    }
    if (meter.typeMeter.id == 8) {
      return Container(
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(width: 1, color: Color(0xFFDEDEDE)),
          ),
        ),
        child: ListTile(
          leading: typeIcon(
            meter.typeMeter,
            meter.metersVals.firstOrNull ?? 0,
            stateNumber: meter.state?.id ?? 0,
          ),
          title: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('${meter.metersVals.firstOrNull ?? 0} '), // TODO unit
              Text(
                'T1:${meter.metersVals.firstOrNull ?? 0} T2:${meter.metersVals.lastOrNull ?? 0}',
                style: TextStyle(fontSize: 13),
              ),
            ],
          ),
          subtitle: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                  "${meter.meterName == "" ? meter.typeMeter.name : meter.meterName} ${meter.snMeter}"),
              meter.state?.id != 0
                  ? Text(meter.state?.name ?? "")
                  : const SizedBox(),
            ],
          ),
        ),
      );
    }
    if (meter.typeMeter.id == 10 || meter.typeMeter.id == 9) {
      return Container(
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(width: 1, color: Color(0xFFDEDEDE)),
          ),
        ),
        child: ListTile(
          leading: typeIcon(meter.typeMeter, meter.metersVals.firstOrNull ?? 0),
          title: Text(meter.infoText),
          subtitle: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                  "${meter.meterName == "" ? meter.typeMeter.name : meter.meterName} ${meter.snMeter}"),
              meter.state?.id != 0
                  ? Text(meter.state?.name ?? '')
                  : const SizedBox(),
            ],
          ),
        ),
      );
    }
    return SizedBox();
  }

  Widget typeIcon(TypeMeterEntity typeSensor, double vals,
      {int stateNumber = 0}) {
    return switch (typeSensor.id) {
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
      9 => vals == 0
          ? Image.asset(
              'assets/ic_sensor.png',
            )
          : Image.asset(
              'assets/ic_sensor_active.png',
            ),
      8 => Image.asset(
          'assets/ic_electro.png',
        ),
      10 => vals == 0
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
