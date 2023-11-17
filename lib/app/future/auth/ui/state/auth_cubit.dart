import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:multisitema_flutter/app/future/auth/model/usecase/auth_use_cases.dart';
import 'package:multisitema_flutter/utils/fauler.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this.authUseCases) : super(AuthInitial());

  final AuthUseCases authUseCases;

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  void login({bool isDemo = false}) async {
    if (!isDemo) {
      email.text = 'demo@saures.ru';
      password.text = 'demo';
    }
    emit(AuthLoading());
    final result = await authUseCases.login(email.text, password.text);

    result.fold(
      (l) {
        if (l is AuthorizationFailure) {
          emit(AuthError(message: l.message));
        }
      },
      (r) => emit(AuthSucess()),
    );
  }
}
