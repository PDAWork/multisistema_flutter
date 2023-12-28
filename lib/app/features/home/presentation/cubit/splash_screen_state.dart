part of 'splash_screen_cubit.dart';

sealed class SplashScreenState extends Equatable {
  const SplashScreenState();

  @override
  List<Object> get props => [];
}

final class SplashScreenInitial extends SplashScreenState {
  const SplashScreenInitial();
}

final class LoadState extends SplashScreenState {
  final String firstName;

  const LoadState({required this.firstName});
}

final class SuccesState extends SplashScreenState {}

final class ErrorState extends SplashScreenState {
  final String message;

  const ErrorState(this.message);
}
