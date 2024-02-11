part of 'tariff_cubit.dart';

sealed class TariffState {}

final class TariffInitial extends TariffState {}

final class TariffLoad extends TariffState {}

final class TariffSuccess extends TariffState {
  final List<TariffEntity> tariffs;

  TariffSuccess({required this.tariffs});
}

final class TariffError extends TariffState {}

final class TariffPay extends TariffState {
  final PayEntity payEntity;

  TariffPay({required this.payEntity});
}
