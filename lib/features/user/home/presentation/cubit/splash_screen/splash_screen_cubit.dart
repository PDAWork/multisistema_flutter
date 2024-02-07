import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:multisitema_flutter/features/user/home/domain/usecase/splash_screen_use_case.dart';

part 'splash_screen_state.dart';

class SplashScreenCubit extends Cubit<SplashScreenState> {
  SplashScreenCubit(this.useCase) : super(const SplashScreenInitial()) {
    final firstName = useCase.getFirstName();
    emit(LoadState(firstName: firstName));
    init();
  }

  final SplashScreenUseCase useCase;

  void init() async {
    final result = await useCase.getData();

    result.fold(
      (l) => emit(const ErrorState('Ошибка')),
      (r) => Future.delayed(
        const Duration(seconds: 1),
        () => emit(SuccesState()),
      ),
    );
  }
}
