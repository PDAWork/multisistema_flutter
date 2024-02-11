import 'package:multisitema_flutter/features/user/pay/data/model/pay_model.dart';
import 'package:multisitema_flutter/features/user/pay/domain/entity/pay_entity.dart';

extension PayMapper on PayModel {
  PayEntity toEntity() {
    return PayEntity(
      ulrPay: ulrPay,
      orderId: orderId,
    );
  }
}
