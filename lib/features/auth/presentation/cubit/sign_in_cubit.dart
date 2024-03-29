import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multisitema_flutter/features/auth/domain/entity/login_entity.dart';
import 'package:multisitema_flutter/features/auth/domain/entity/role_entity.dart';
import 'package:multisitema_flutter/features/auth/domain/usecase/auth_use_case.dart';

import '../../../../core/error/failure.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  final AuthUseCase authUseCase;

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
        (role) => emit(SeccuceState(role: role)));
  }

  String _mapFailureToMessage(Failure failure) {
    return switch (failure) {
      ServerFailure() => "Ошибка сервера отвечает зайдите позже",
      UserFailure(:final errorMessage) => errorMessage,
      // ServerFailure => "Ошибка сервера",
      _ => ""
    };
  }
}