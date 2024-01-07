part of 'home_cubit.dart';

sealed class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class HomeLoad extends HomeState {}

class HomeSeccues extends HomeState {
  final List<SensorEntity> meters;

  const HomeSeccues({required this.meters});
}

class HomeError extends HomeState {}
