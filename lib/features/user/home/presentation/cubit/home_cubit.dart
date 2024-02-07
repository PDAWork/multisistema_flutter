import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:multisitema_flutter/features/user/home/domain/entity/meter_body_entity.dart';
import 'package:multisitema_flutter/features/user/home/domain/entity/sensor_entity.dart';
import 'package:multisitema_flutter/features/user/home/domain/usecase/home_use_case.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.homeUseCase) : super(HomeInitial());

  final HomeUseCase homeUseCase;

  void init(MeterBodyEntity request) async {
    emit(HomeLoad());

    final result = await homeUseCase.call(request);

    result.fold(
      (l) => emit(HomeError()),
      (r) {
        emit(
          HomeSeccues(meters: r),
        );
      },
    );
  }
}
