import 'package:multisitema_flutter/features/user/pay/data/model/tariff_model.dart';
import 'package:multisitema_flutter/features/user/pay/domain/entity/tariff_entity.dart';

extension Tariffmapper on TariffModel {
  TariffEntity toEntity() {
    return TariffEntity(
      id: id,
      name: name,
      cost: cost,
    );
  }
}
