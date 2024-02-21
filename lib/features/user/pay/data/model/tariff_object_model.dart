import 'package:multisitema_flutter/features/user/pay/data/model/tariff_model.dart';

class TariffObjectModel {
  final DateTime? startDate;
  final DateTime? finishDate;
  final int objectId;
  final String objectName;
  final TariffModel tariffModel;

  TariffObjectModel({
    required this.startDate,
    required this.finishDate,
    required this.objectId,
    required this.objectName,
    required this.tariffModel,
  });

  factory TariffObjectModel.fromJson(Map<String, dynamic> json) {
    return TariffObjectModel(
      startDate: json['startDate'] == null ? null : DateTime.parse(json['startDate']),
      finishDate:json['finishDate'] == null ? null :  DateTime.parse(json['finishDate']),
      objectName: json['object']['house'],
      objectId: json['object']['id'],
      tariffModel: TariffModel.fromJson(json['tariff']),
    );
  }
}
