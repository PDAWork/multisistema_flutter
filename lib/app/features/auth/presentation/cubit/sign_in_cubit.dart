import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:multisitema_flutter/app/features/auth/domain/entity/login_entity.dart';
import 'package:multisitema_flutter/app/features/auth/domain/usecase/auth.dart';

import '../../../../core/error/failure.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  final Auth authUseCase;
  SignInCubit({required this.authUseCase}) : super(SignInInitial());

  Future<void> signIn(String login, String password) async {
    emit(LoadingState());
    final result = await authUseCase.signIn(
      LoginEntity(
        login: login,
        password: password,
      ),
    );

    result.fold(
        (message) => emit(ErrorState(message: _mapFailureToMessage(message))),
        (right) => emit(SeccuceState()));
  }

  String _mapFailureToMessage(Failure failure) {
    return switch (failure) {
      UserFailure(:final errorMessage) => errorMessage,
      // ServerFailure => "Ошибка сервера",
      _ => ""
    };
  }
}