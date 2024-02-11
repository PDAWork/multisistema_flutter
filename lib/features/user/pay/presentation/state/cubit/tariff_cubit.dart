import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multisitema_flutter/features/user/pay/domain/entity/pay_entity.dart';
import 'package:multisitema_flutter/features/user/pay/domain/entity/tariff_entity.dart';
import 'package:multisitema_flutter/features/user/pay/domain/use_case/pay_use_case.dart';
import 'package:multisitema_flutter/features/user/pay/domain/use_case/tariff_use_case.dart';

part 'tariff_state.dart';

class TariffCubit extends Cubit<TariffState> {
  TariffCubit(this._useCaseTariff, this._useCasePay) : super(TariffInitial());

  final TariffUseCase _useCaseTariff;
  final PayUseCase _useCasePay;

  void init() async {
    emit(TariffLoad());
    final result = await _useCaseTariff.call();
    result.fold(
      (l) => emit(TariffError()),
      (tariffs) => emit(TariffSuccess(tariffs: tariffs)),
    );
  }

  Future<void> onPay(final int idTariff) async {
    final result = await _useCasePay.call(PayParams(idTariff: idTariff));
    result.fold(
      (l) => emit(TariffError()),
      (pay) => emit(TariffPay(payEntity: pay)),
    );
  }
}
