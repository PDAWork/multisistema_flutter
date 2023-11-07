import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  // final AuthRepository authRepository;

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  void login() async {
    emit(AuthLoading());
    // final result = await authRepository.login(password.text, email.text);

    // if (result.$1 is AuthorizationExeption) {
    //   return emit(AuthError());
    // }
  }
}
