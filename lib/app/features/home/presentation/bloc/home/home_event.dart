part of 'home_bloc.dart';

sealed class HomeEvent extends Equatable {}

final class HomeInitialEvent extends HomeEvent {
  final int idObject;
  final DateTime date;

  HomeInitialEvent({required this.idObject, required this.date});

  @override
  List<Object?> get props => [
        idObject,
        date,
      ];
}
