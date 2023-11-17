part of 'home_cubit.dart';

sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class HomeLoad extends HomeState {}

final class HomeSeccues extends HomeState {
  final List<SensorDTO> listSensor;

  HomeSeccues({required this.listSensor});
}

final class HomeRefresh extends HomeState {
  final List<SensorDTO> listSensor;

  HomeRefresh({required this.listSensor});
}

final class ExeptionHome extends HomeState {}
