import 'package:multisitema_flutter/features/user/pay/data/mapper/tariff_mapper.dart';
import 'package:multisitema_flutter/features/user/pay/data/model/tariff_object_model.dart';
import 'package:multisitema_flutter/features/user/pay/domain/entity/tariff_object_entity.dart';

extension TariffObjectMapper on TariffObjectModel {
  TariffObjectEntity toEntity() {
    return TariffObjectEntity(
      startDate: startDate,
      finishDate: finishDate,
      objectId: objectId,
      objectName: objectName,
      tariffEntity: tariffModel.toEntity(),
    );
  }
}
