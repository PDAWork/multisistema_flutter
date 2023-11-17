part of 'drop_down_button_app_cubit.dart';

sealed class DropDownButtonAppState {}

final class DropDownButtonAppInitial extends DropDownButtonAppState {}

final class DropDownButtonAppSeccues extends DropDownButtonAppState {
  final ObjectDTO item;
  final List<ObjectDTO> itemList;

  DropDownButtonAppSeccues({required this.item, required this.itemList});
}

final class DropDownButtonAppChanged extends DropDownButtonAppState {
  final List<ObjectDTO> itemList;

  DropDownButtonAppChanged({required this.itemList});
}

