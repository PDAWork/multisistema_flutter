import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:multisitema_flutter/app/core/error/failure.dart';
import 'package:multisitema_flutter/app/features/auth/domain/entity/login_entity.dart';
import 'package:multisitema_flutter/app/features/auth/domain/usecase/auth.dart';
import 'package:multisitema_flutter/app/routes/app_router.dart';
import 'package:multisitema_flutter/app/routes/router_utils.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  final Auth authUseCase;
  SignInCubit({required this.authUseCase}) : super(SignInInitial()) {
    authUseCase
        .isLoginUser()
        .fold((l) => null, (r) => r ? emit(AuthorizationState()) : null);
  }

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
