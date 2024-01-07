import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:multisitema_flutter/app/features/home/domain/entity/object_entity.dart';
import 'package:multisitema_flutter/app/features/home/domain/usecase/drop_down_button_app_use_case.dart';

part 'drop_down_button_app_state.dart';

class DropDownButtonAppCubit extends Cubit<DropDownButtonAppState> {
  DropDownButtonAppCubit(this.useCase)
      : super(DropDownButtonAppInitial(DateTime.now()));

  final DropdownButtonAppUseCase useCase;

  void init() async {
    emit(LoadlState(DateTime.now()));
    final value = await useCase.call();
    value.fold(
      (l) => emit(ErrorState(
        errorMessage: 'Упс, нет не одного объекта',
        date: DateTime.now(),
      )),
      (items) => emit(
        OnSelectItemState(
            items: items, selectItem: items.first, date: DateTime.now()),
      ),
    );
  }

  void onChanged(ObjectEntity item) {
    switch (state) {
      case OnSelectItemState(:final items, :final date):
        {
          emit(OnChangedItemState(items: items, selectItem: item, date: date));
          emit(OnSelectItemState(items: items, selectItem: item, date: date));
          break;
        }
      default:
        {
          break;
        }
    }
  }

  void onSelectDate(DateTime date) {
    switch (state) {
      case OnSelectItemState(:final items, :final selectItem):
        {
          emit(OnChangedItemState(
              items: items, selectItem: selectItem, date: date));
          emit(OnSelectItemState(
              items: items, selectItem: selectItem, date: date));
          break;
        }
      default:
        {
          break;
        }
    }
  }
}
