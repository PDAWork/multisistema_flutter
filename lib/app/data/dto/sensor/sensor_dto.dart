import 'package:hive_flutter/hive_flutter.dart';
import 'meters/meter_dto.dart';

part 'sensor_dto.g.dart';

@HiveType(typeId: 3)
class SensorDTO {
  @HiveField(0)
  final String sn;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String model;
  @HiveField(3)
  final bool active;
  @HiveField(4)
  final String ssid;
  @HiveField(5)
  final String firmware;
  @HiveField(6)
  final int bat;
  @HiveField(7)
  final String localIp;
  @HiveField(8)
  final int checkHours;
  @HiveField(9)
  final String checkPeriodDisplay;
  @HiveField(10)
  final DateTime lastConnection;
  @HiveField(11)
  final String? lastConnectionWarning;
  @HiveField(12)
  final dynamic licChannels;
  @HiveField(13)
  final int requests;
  @HiveField(14)
  final String rssi;
  @HiveField(15)
  final double? log;
  @HiveField(16)
  final int scan;
  @HiveField(17)
  final int vol;
  @HiveField(18)
  final int send;
  @HiveField(19)
  final DateTime readoutDt;
  @HiveField(20)
  final DateTime requestDt;
  @HiveField(21)
  final bool capState;
  @HiveField(22)
  final bool powerSupply;
  @HiveField(23)
  final bool emptyInputs;
  @HiveField(24)
  final dynamic nbiot;
  @HiveField(25)
  final List<MeterDTO> metersList;

  SensorDTO({
    required this.sn,
    required this.name,
    required this.model,
    required this.active,
    required this.ssid,
    required this.firmware,
    required this.bat,
    required this.localIp,
    required this.checkHours,
    required this.checkPeriodDisplay,
    required this.lastConnection,
    required this.lastConnectionWarning,
    required this.licChannels,
    required this.requests,
    required this.rssi,
    required this.log,
    required this.scan,
    required this.vol,
    required this.send,
    required this.readoutDt,
    required this.requestDt,
    required this.capState,
    required this.powerSupply,
    required this.emptyInputs,
    required this.nbiot,
    required this.metersList,
  });

  factory SensorDTO.fromJson(Map<String, dynamic> json) {
    return SensorDTO(
      sn: json['sn'] ?? '',
      name: json['name'] ?? '',
      model: json['model'] ?? '',
      active: json['active'] ?? false,
      ssid: json['ssid'] ?? '',
      firmware: json['firmware'] ?? '',
      bat: json['bat'] ?? 0,
      localIp: json['local_ip'] ?? '',
      checkHours: json['check_hours'] ?? 0,
      checkPeriodDisplay: json['check_period_display'] ?? '',
      lastConnection: DateTime.parse(
        json['last_connection'] ?? DateTime.now().toString(),
      ),
      lastConnectionWarning: json['last_connection_warning'],
      licChannels: json['lic_channels'],
      requests: json['requests'] ?? 0,
      rssi: json['rssi'] ??'',
      log: json['log'],
      scan: json['scan'] ??0,
      vol: json['vol'] ?? 0 ,
      send: json['send'] ?? 0,
      readoutDt: DateTime.parse(json['readout_dt'] ?? DateTime.now().toString()),
      requestDt: DateTime.parse(json['request_dt'] ?? DateTime.now().toString()),
      capState: json['cap_state'] ?? false,
      powerSupply: json['power_supply'] ?? false,
      emptyInputs: json['empty_inputs']?? false,
      nbiot: json['nbiot'] ,
      metersList:
          (json['meters'] as List).map((e) => MeterDTO.fromJson(e)).toList(),
    );
  }
}
