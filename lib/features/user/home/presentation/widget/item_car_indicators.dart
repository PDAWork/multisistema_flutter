import 'package:flutter/material.dart';
import 'package:multisitema_flutter/features/user/home/domain/entity/meter_entity.dart';
import 'package:multisitema_flutter/features/user/home/domain/entity/type_meter_entity.dart';
import 'package:multisitema_flutter/style/color.dart';

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
          leading: Image.asset(
            typeIconPath(
              meter.typeMeter,
              meter.metersVals.firstOrNull ?? 0,
            ),
            width: 32,
          ),
          title: Text(
            '${meter.metersVals.firstOrNull ?? "0"} ',
            style: Theme.of(context).textTheme.titleMedium,
          ), // TODO unit
          subtitle: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${meter.meterName == "" ? meter.typeMeter.name : meter.meterName} ${meter.snMeter}",
                style: Theme.of(context).textTheme.labelMedium,
              ),
              meter.state?.name != null
                  ? meter.state?.id != 0
                      ? Text(
                          meter.state?.name ?? "",
                          style: Theme.of(context)
                              .textTheme
                              .labelMedium!
                              .copyWith(color: primaryColor),
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
          leading: Image.asset(
            typeIconPath(
              meter.typeMeter,
              meter.metersVals.firstOrNull ?? 0,
              stateNumber: meter.state?.id ?? 0,
            ),
            width: 32,
          ),
          title: Text(
            '${meter.metersVals.firstOrNull ?? 0} ',
            style: Theme.of(context).textTheme.titleMedium,
          ), // TODO unit
          subtitle: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${meter.meterName == "" ? meter.typeMeter.name : meter.meterName} ${meter.snMeter}",
                style: Theme.of(context).textTheme.labelMedium,
              ),
              (meter.state?.id ?? 0) != 0
                  ? Text(
                      meter.state?.name ?? "",
                      style: Theme.of(context)
                          .textTheme
                          .labelMedium!
                          .copyWith(color: primaryColor),
                    )
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
          title: Text(
            meter.infoText,
            style: Theme.of(context).textTheme.titleMedium,
          ),
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
          leading: Image.asset(
            typeIconPath(
              meter.typeMeter,
              meter.metersVals.firstOrNull ?? 0,
              stateNumber: meter.state?.id ?? 0,
            ),
            width: 32,
          ),
          title: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${meter.metersVals.firstOrNull ?? 0} ',
                style: Theme.of(context).textTheme.titleMedium,
              ), // TODO unit
              Text(
                'T1:${meter.metersVals.firstOrNull ?? 0} T2:${meter.metersVals.lastOrNull ?? 0}',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ],
          ),
          subtitle: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${meter.meterName == "" ? meter.typeMeter.name : meter.meterName} ${meter.snMeter}",
                style: Theme.of(context).textTheme.labelMedium,
              ),
              meter.state?.id != 0
                  ? Text(
                      meter.state?.name ?? "",
                      style: Theme.of(context).textTheme.labelMedium,
                    )
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
          leading: Image.asset(
            typeIconPath(meter.typeMeter, meter.metersVals.firstOrNull ?? 0),
            width: 32,
          ),
          title: Text(
            meter.infoText,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          subtitle: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${meter.meterName == "" ? meter.typeMeter.name : meter.meterName} ${meter.snMeter}",
                style: Theme.of(context).textTheme.labelMedium,
              ),
              meter.state?.id != 0
                  ? Text(
                      meter.state?.name ?? '',
                      style: Theme.of(context).textTheme.labelMedium,
                    )
                  : const SizedBox(),
            ],
          ),
        ),
      );
    }
    return const SizedBox();
  }

  String typeIconPath(
    TypeMeterEntity typeSensor,
    double vals, {
    int stateNumber = 0,
  }) {
    return switch (typeSensor.id) {
      0 => 'assets/ic_unknown.png',
      1 => 'assets/ic_cold_water.png',
      2 => 'assets/ic_warm_water.png',
      3 => 'assets/ic_gaz.png',
      5 => stateNumber != 0
          ? 'assets/ic_temper_active.png'
          : 'assets/ic_temper.png',
      9 => vals == 0 ? 'assets/ic_sensor.png' : 'assets/ic_sensor_active.png',
      8 => 'assets/ic_electro.png',
      10 => vals == 0 ? 'assets/ic_kran.png' : 'assets/ic_kran_active.png',
      13 => 'assets/ic_heat.png',
      _ => 'assets/ic_unknown.png',
    };
  }
}
