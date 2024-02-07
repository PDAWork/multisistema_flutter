part of 'home_bloc.dart';

sealed class HomeState extends Equatable {}

final class HomeInital extends HomeState {
  @override
  List<Object?> get props => [];
}

final class HomeLoad extends HomeState {
  @override
  List<Object?> get props => [];
}

final class HomeSuccess extends HomeState {
  final List<SensorEntity> meters;

  HomeSuccess({required this.meters});

  @override
  List<Object?> get props => [meters];
}

final class HomeError extends HomeState {
  @override
  List<Object?> get props => [];
}
