part of 'splash_screen_cubit.dart';

sealed class SplashScreenState {
  final String firstName;

  SplashScreenState({required this.firstName});
}

final class SplashScreenInitial extends SplashScreenState {
  SplashScreenInitial({required super.firstName});
}

final class LoadingSplashScreen extends SplashScreenState {
  LoadingSplashScreen({required super.firstName});
}

final class SuccessSplashScreen extends SplashScreenState {
  SuccessSplashScreen() : super(firstName: '');
}

final class ExeptionSplashScreen extends SplashScreenState {
  final String message;
  ExeptionSplashScreen(this.message) : super(firstName: '');
}
