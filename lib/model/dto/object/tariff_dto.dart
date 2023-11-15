import 'package:hive_flutter/hive_flutter.dart';

part 'tariff_dto.g.dart';

@HiveType(typeId: 6)
class TariffDTO {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String balance;

  TariffDTO({
    required this.id,
    required this.name,
    required this.balance,
  });

  factory TariffDTO.fromJson(Map<String, dynamic> json) {
    return TariffDTO(
      id: json['id'],
      name: json['name'],
      balance: json['balance'],
    );
  }
}
