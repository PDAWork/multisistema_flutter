import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:multisitema_flutter/app/features/home/domain/entity/object_entity.dart';
import 'package:multisitema_flutter/app/features/home/domain/usecase/drop_down_button_app_use_case.dart';

part 'drop_down_button_app_state.dart';

class DropDownButtonAppCubit extends Cubit<DropDownButtonAppState> {
  DropDownButtonAppCubit(this.useCase) : super(DropDownButtonAppInitial());

  final DropdownButtonAppUseCase useCase;

  void init() async {
    emit(LoadlState());
    final value = await useCase.call();
    value.fold(
      (l) => emit(const ErrorState(errorMessage: 'Упс, нет не одного объекта')),
      (items) => emit(
        OnSelectItemState(
          items: items,
          selectItem: items.first,
        ),
      ),
    );
  }

  void onChanged(ObjectEntity item) {
    switch (state) {
      case OnSelectItemState(:final items):
        {
          emit(OnChangedItemState(items: items, selectItem: item));
          emit(OnSelectItemState(items: items, selectItem: item));
          break;
        }
      default:
        {
          break;
        }
    }
  }
}
