import 'package:multisitema_flutter/features/user/home/domain/entity/meter_entity.dart';

class SensorEntity {
  final String sn;
  final String name;
  final String model;
  final bool active;
  final String ssid;
  final String hardwere;
  final String firmwawe;
  final int batery;
  final String localip;
  final int checkHours;
  final String checkPeriodDipslay;
  final DateTime lastConnection;
  final String lastConnectionWarning;
  final int licChennels;
  final int requests;
  final String rssi;
  final double log;
  final int scan;
  final int vol;
  final int send;
  final DateTime? readoutDate;
  final DateTime? requestDate;
  final bool capState;
  final bool powerSupply;
  final bool emptyInputs;
  final String nbiot;
  final List<MeterEntity> meterList;

  SensorEntity(
      {required this.sn,
      required this.name,
      required this.model,
      required this.active,
      required this.ssid,
      required this.hardwere,
      required this.firmwawe,
      required this.batery,
      required this.localip,
      required this.checkHours,
      required this.checkPeriodDipslay,
      required this.lastConnection,
      required this.lastConnectionWarning,
      required this.licChennels,
      required this.requests,
      required this.rssi,
      required this.log,
      required this.scan,
      required this.vol,
      required this.send,
      required this.readoutDate,
      required this.requestDate,
      required this.capState,
      required this.powerSupply,
      required this.emptyInputs,
      required this.nbiot,
      required this.meterList});
}
