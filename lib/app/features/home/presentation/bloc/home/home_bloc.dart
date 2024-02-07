import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:multisitema_flutter/app/features/home/domain/entity/meter_body_entity.dart';
import 'package:multisitema_flutter/app/features/home/domain/entity/sensor_entity.dart';
import 'package:multisitema_flutter/app/features/home/domain/usecase/home_use_case.dart';
import 'package:multisitema_flutter/app/features/home/presentation/cubit/home_cubit.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeUseCase homeUseCase;

  HomeBloc(this.homeUseCase) : super(HomeInital()) {
    on<HomeEvent>((event, emit) {});
    on<HomeInitialEvent>((event, emit) async {
      emit(HomeLoad());
      final data = await homeUseCase.call(MeterBodyEntity(
        idObject: event.idObject,
        date: event.date,
      ));
      data.fold(
        (error) => emit(HomeError()),
        (list) => emit(HomeSuccess(meters: list)),
      );
    });
  }
}
