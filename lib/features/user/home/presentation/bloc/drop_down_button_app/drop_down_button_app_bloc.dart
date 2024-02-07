import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:multisitema_flutter/features/user/home/domain/entity/object_entity.dart';
import 'package:multisitema_flutter/features/user/home/domain/usecase/drop_down_button_app_use_case.dart';

part 'drop_down_button_app_event.dart';
part 'drop_down_button_app_state.dart';

class DropDownButtonAppBloc
    extends Bloc<DropDownButtonAppEvent, DropDownButtonAppState> {
  final DropdownButtonAppUseCase _useCase;

  DropDownButtonAppBloc(this._useCase) : super(DropDownButtonAppState()) {
    on<DropDownButtonAppInit>(
      (event, emit) async {
        final dataObject = await _useCase.call();
        final List<ObjectEntity> list = [];

        dataObject.fold(
          (l) => print("Ошибка"),
          (r) => list.addAll(r),
        );

        emit(
          DropDownButtonAppState(
            date: DateTime.now(),
            selectItem: list.first,
            items: list,
          ),
        );
      },
    );

    on<DropDownButtonAppEvent>((event, emit) async {});

    on<DropDownButtonOnChangeEvent>((event, emit) {
      emit(state.copyWith(selectItem: event.selectItem));
    });

    on<DropDownButtonOnDateChangeEvent>((event, emit) {
      emit(state.copyWith(date: event.date));
    });
  }
}
