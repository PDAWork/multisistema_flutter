import 'package:bloc/bloc.dart';
import 'package:multisitema_flutter/app/future/auth/data/data_sources/auth_local_data_source_impl.dart';
import 'package:multisitema_flutter/app/future/splashscreen/model/repository/splash_screen_repository.dart';
import 'package:multisitema_flutter/utils/fauler.dart';

part 'splash_screen_state.dart';

class SplashScreenCubit extends Cubit<SplashScreenState> {
  SplashScreenCubit({
    required this.splashScreenRepository,
    required this.authLocalDataSource,
  }) : super(
          SplashScreenInitial(firstName: ''),
        );

  final SplashScreenRepository splashScreenRepository;
  final AuthLocalDataSource authLocalDataSource;

  void refresState(){
    emit(SuccessSplashScreen());
  }

  void init() async {
    final userProfile = authLocalDataSource.getUserProfile();
    emit(SplashScreenInitial(firstName: userProfile.firstName));

    emit(LoadingSplashScreen(firstName: state.firstName));
    final result = await splashScreenRepository.loadData();
    result.fold(
      (l) {
        if (l is AuthorizationFailure) {
          emit(AuthExeptionSplashScreen(l.message, firstName: state.firstName));
        }
        emit(AuthExeptionSplashScreen(l.message, firstName: state.firstName));
      },
      (r) => emit(SuccessSplashScreen()),
    );
  }
}
