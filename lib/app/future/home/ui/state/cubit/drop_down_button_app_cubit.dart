import 'package:bloc/bloc.dart';
import 'package:multisitema_flutter/app/core/hive_helper.dart';
import 'package:multisitema_flutter/app/data/dto/object/object_dto.dart';

part 'drop_down_button_app_state.dart';

class DropDownButtonAppCubit extends Cubit<DropDownButtonAppState> {
  DropDownButtonAppCubit(this.helper) : super(DropDownButtonAppInitial());
  final HiveHelper helper;

  void init() async {
    final itemList = await helper.getUserObject();
    emit(
      DropDownButtonAppSeccues(
          item: itemList.objects.first, itemList: itemList.objects),
    );
  }

  void onChangedItem(ObjectDTO object) {
    if (state is DropDownButtonAppSeccues) {
      final value = state as DropDownButtonAppSeccues;
      emit(DropDownButtonAppChanged(itemList: value.itemList));
    }
    if (state is DropDownButtonAppChanged) {
      final value = state as DropDownButtonAppChanged;
      emit(
        DropDownButtonAppSeccues(item: object, itemList: value.itemList),
      );
    }
  }
}
