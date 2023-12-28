import 'package:hive/hive.dart';

part 'object_dto.g.dart';

@HiveType(typeId: 0)
class ObjectDto {
  @HiveField(1)
  final int id;
  @HiveField(2)
  final String house;
  @HiveField(3)
  final String number;
  @HiveField(4)
  final String label;
  @HiveField(5)
  final String accountId;
  @HiveField(6)
  final String personalAccount;
  @HiveField(7)
  final DateTime connectDate;
  @HiveField(8)
  final bool enable;
  @HiveField(9)
  final int balanceObject;
  @HiveField(10)
  final String accesLevel;
  @HiveField(11)
  final String objectCompanyName;
  @HiveField(12)
  final String? objectCompanyUrl;

  ObjectDto({
    required this.id,
    required this.house,
    required this.label,
   required this.number,
    required this.accountId,
    required this.personalAccount,
    required this.connectDate,
    required this.enable,
    required this.balanceObject,
    required this.accesLevel,
    required this.objectCompanyName,
    required this.objectCompanyUrl,
  });

  factory ObjectDto.fromJson(Map<String, dynamic> json) {
    return ObjectDto(
      id: json['id'],
      house: json['house'],
      label: json['lable'],
      number: json['number'],
      accountId: json['accountId'],
      personalAccount: json['personalAccount'],
      connectDate: DateTime.parse(json['connectDate']),
      enable: json['enable'],
      balanceObject: json['balanceObject'],
      accesLevel: json['accesLevel'],
      objectCompanyName: json['objectCompanyName'],
      objectCompanyUrl: json['objectCompanyUrl'],
    );
  }
}
