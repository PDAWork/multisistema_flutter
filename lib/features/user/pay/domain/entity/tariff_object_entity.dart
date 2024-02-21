import 'package:multisitema_flutter/features/user/pay/domain/entity/tariff_entity.dart';

final class TariffObjectEntity {
  final DateTime? startDate;
  final DateTime? finishDate;
  final int objectId;
  final String objectName;
  final TariffEntity tariffEntity;

  TariffObjectEntity({
    required this.startDate,
    required this.finishDate,
    required this.objectId,
    required this.objectName,
    required this.tariffEntity,
  });
}
