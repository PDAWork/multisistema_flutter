import 'package:hive_flutter/hive_flutter.dart';

import 'state_dto.dart';
import 'type_dto.dart';

part 'meter_dto.g.dart';

@HiveType(typeId: 0)
class MeterDTO {
  @HiveField(0)
  final int meterId;
  @HiveField(1)
  final String meterName;
  @HiveField(2)
  final int input;
  @HiveField(3)
  final dynamic approveDt;
  @HiveField(4)
  final String eircNum;
  @HiveField(5)
  final String sn;
  @HiveField(6)
  final TypeDTO type;
  @HiveField(7)
  final StateDTO state;
  @HiveField(8)
  final String unit;
  @HiveField(9)
  final List<String> vals;
  @HiveField(10)
  final String? activeText;
  @HiveField(11)
  final String? passiveText;

  MeterDTO({
    required this.meterId,
    required this.meterName,
    required this.input,
    required this.approveDt,
    required this.eircNum,
    required this.sn,
    required this.type,
    required this.state,
    required this.unit,
    required this.vals,
    this.activeText,
    this.passiveText,
  });

  factory MeterDTO.fromJson(Map<String, dynamic> json) {
    return MeterDTO(
        meterId: json['meter_id'],
        meterName: json['meter_name'],
        input: json['input'] ?? -1,
        approveDt: json['approve_dt'],
        eircNum: json['eirc_num'] ?? '',
        sn: json['sn'],
        type: TypeDTO.fromJson(json['type']),
        state: StateDTO.fromJson(json['state']),
        unit: json['unit'],
        vals: (json['vals'] as List).map((e) => e.toString()).toList(),
        activeText: json['active_text'],
        passiveText: json['passive_text']);
  }
}
