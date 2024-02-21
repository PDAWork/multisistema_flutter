import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:multisitema_flutter/features/user/home/domain/entity/drawer_app_entity.dart';
import 'package:multisitema_flutter/features/user/home/domain/usecase/drawer_app_clear_cache_use_case.dart';
import 'package:multisitema_flutter/features/user/home/domain/usecase/drawer_app_data_use_case.dart';

part 'drawer_app_event.dart';
part 'drawer_app_state.dart';

class DrawerAppBloc extends Bloc<DrawerAppEvent, DrawerAppState> {
  final DrawerAppDataUseCase _drawerAppUseCase;
  final DrawerAppClearCacheUseCase _drawerAppClearCacheUseCase;

  DrawerAppBloc(
    this._drawerAppUseCase,
    this._drawerAppClearCacheUseCase,
  ) : super(DrawerAppState.initial()) {
    on<DrawerAppEvent>(
      (event, emit) {},
    );
    on<DrawerAppInitEvent>(
      (event, emit) async {
        final data = await _drawerAppUseCase.call(unit);
        data.fold(
          (failure) {
            print('Ошибка при получении данных');
          },
          (data) => emit(DrawerAppState(drawerAppEntity: data)),
        );
      },
    );
    on<DrawerAppClearCacheEvent>(
      (event, emit) async {
        await _drawerAppClearCacheUseCase.call(unit);
      },
    );
  }
}
