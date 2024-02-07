part of 'sign_in_cubit.dart';

sealed class SignInState extends Equatable {
  const SignInState();

  @override
  List<Object> get props => [];
}

final class SignInInitial extends SignInState {}

final class LoadingState extends SignInState {}

final class SeccuceState extends SignInState {}

final class AuthorizationState extends SignInState {}

final class ErrorState extends SignInState {
  final String message;

  const ErrorState({required this.message});
}
