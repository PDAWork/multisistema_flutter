import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:multisitema_flutter/features/user/pay/domain/entity/tariff_object_entity.dart';
import 'package:multisitema_flutter/features/user/pay/domain/use_case/tariff_object_use_case.dart';

part 'tariff_object_state.dart';

class TariffObjectCubit extends Cubit<TariffObjectState> {
  TariffObjectCubit(this._useCase) : super(TariffObjectInitial());

  final TarifObjectUseCase _useCase;

  void init() async {
    emit(TariffObjectLoad());
    final data = await _useCase.call(unit);
    data.fold(
      (l) => emit(TariffObjectError()),
      (tariffObject) => emit(TariffObjectSuccess(tariffObjects: tariffObject)),
    );
  }
}
