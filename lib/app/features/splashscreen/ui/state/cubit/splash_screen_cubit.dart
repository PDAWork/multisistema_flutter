import 'package:bloc/bloc.dart';
import 'package:multisitema_flutter/utils/fauler.dart';

part 'splash_screen_state.dart';

class SplashScreenCubit extends Cubit<SplashScreenState> {
  SplashScreenCubit() : super(SplashScreenInitial());

  void init() async {}
}
