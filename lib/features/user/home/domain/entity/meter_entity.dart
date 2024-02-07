import 'state_entity.dart';
import 'type_meter_entity.dart';

class MeterEntity {
  final int id;
  final String meterName;
  final String snMeter;
  final String eircNum;
  final String infoText;
  final TypeMeterEntity typeMeter;
  final StateEntity? state;
  final List<double> metersVals;

  MeterEntity({
    required this.id,
    required this.meterName,
    required this.snMeter,
    required this.eircNum,
    required this.infoText,
    required this.typeMeter,
    required this.state,
    required this.metersVals,
  });
}
