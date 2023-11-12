import 'package:hive/hive.dart';

import 'tariff_dto.dart';

part 'object_dto.g.dart';

@HiveType(typeId: 1)
class ObjectDTO extends HiveObject {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String number;

  @HiveField(2)
  final String label;

  @HiveField(3)
  final String house;

  @HiveField(4)
  final String personalAccount;

  @HiveField(5)
  final bool enable;

  @HiveField(6)
  final List<TariffDTO>? tarrifsList;

  @HiveField(7)
  final int utc;

  @HiveField(8)
  final double? longitude;

  @HiveField(9)
  final double? latitude;

  @HiveField(10)
  final String? objectCompanyName;

  @HiveField(11)
  final String? objectCompanyInn;

  @HiveField(12)
  final String? objectCompanyAccount;

  @HiveField(13)
  final String? objectCompanyUrl;

  @HiveField(14)
  final String connectDT;

  @HiveField(15)
  final String accessLevel;

  ObjectDTO({
    required this.id,
    required this.number,
    required this.label,
    required this.house,
    required this.personalAccount,
    required this.enable,
    required this.tarrifsList,
    required this.utc,
    required this.longitude,
    required this.latitude,
    required this.objectCompanyName,
    required this.objectCompanyInn,
    required this.objectCompanyAccount,
    required this.objectCompanyUrl,
    required this.connectDT,
    required this.accessLevel,
  });

  factory ObjectDTO.fromJson(Map<String, dynamic> json) {
    return ObjectDTO(
      id: json['id'],
      number: json['number'],
      label: json['label'],
      house: json['house'],
      personalAccount: json['personal_account'],
      enable: json['enable'],
      tarrifsList: json['tariffs'] == null
          ? json['tariffs']
          : (json['tariffs'] as List)
              .map((e) => TariffDTO.fromJson(e))
              .toList(),
      utc: json['utc'] ?? -1,
      longitude: json['longitude'],
      latitude: json['latitude'],
      objectCompanyName: json['object_company_name'],
      objectCompanyInn: json['object_company_inn'],
      objectCompanyAccount: json['object_company_account'],
      objectCompanyUrl: json['object_company_url'],
      connectDT: json['connect_dt'],
      accessLevel: json['access_level'],
    );
  }

  factory ObjectDTO.empty() {
    return ObjectDTO(
      id: 01,
      number: '',
      label: '',
      house: '',
      personalAccount: '',
      enable: false,
      tarrifsList: [],
      utc: -1,
      longitude: 0,
      latitude: 0,
      objectCompanyName: '',
      objectCompanyInn: '',
      objectCompanyAccount: '',
      objectCompanyUrl: '',
      connectDT: '',
      accessLevel: '',
    );
  }
}
