part of 'home_cubit.dart';

sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class HomeLoad extends HomeState {}

final class HomeSeccues extends HomeState {}
final class HomeRefresh extends HomeState{}
