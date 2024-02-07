part of 'drop_down_button_app_bloc.dart';

sealed class DropDownButtonAppEvent {}

final class DropDownButtonAppInit extends DropDownButtonAppEvent {}

final class DropDownButtonOnChangeEvent extends DropDownButtonAppEvent {
  final ObjectEntity selectItem;

  DropDownButtonOnChangeEvent({required this.selectItem});
}

final class DropDownButtonOnDateChangeEvent extends DropDownButtonAppEvent {
  final DateTime date;

  DropDownButtonOnDateChangeEvent({required this.date});
}
