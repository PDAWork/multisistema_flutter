part of 'tariff_object_cubit.dart';

@freezed
sealed class TariffObjectState {}

final class TariffObjectInitial extends TariffObjectState {}

final class TariffObjectLoad extends TariffObjectState {}

final class TariffObjectSuccess extends TariffObjectState {
  final List<TariffObjectEntity> tariffObjects;

  TariffObjectSuccess({required this.tariffObjects});
}

final class TariffObjectError extends TariffObjectState {}
